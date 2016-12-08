//#pragma GCC optimize ("-O2")

#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
#define WANT_HEATER_ACTIVITY_LED
//#define HAS_NODE_ID_SET_SWITCH
#define WANT_RELAY_SAFETY
// ----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RF69_868MHZ

#define MY_NODE_ID 251  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

// Flash leds on rx/tx/err
#define MY_DEFAULT_ERR_LED_PIN 4
#define MY_DEFAULT_RX_LED_PIN  6
#define MY_DEFAULT_TX_LED_PIN  5
// Set blinking period
#define MY_DEFAULT_LED_BLINK_PERIOD 300
// Inverses the behavior of leds
#define MY_WITH_LEDS_BLINKING_INVERSE

#include <MySensors.h>
// --------------------------------------------------------------------------------------------------------------

// ---------------------------------------- DIP SW NODE ID CONFIGURATION ------------------------
#ifdef HAS_NODE_ID_SET_SWITCH
/*
| C0 | C1 | C2 | C3 | C4 | C5 | C6 |
| A0 | A1 | A2 | A3 | A4 | A5 |  7 |
*/

const uint8_t NODE_ID_SWITCH_PINS[] = {A0, A1, A2, A3, A4, A5, 7};
#endif
// -------------------------------------------------------------------------------------------------------------

// ----------------------- HEATER ACTUATOR SENSOR SECTION ----------------------
const uint8_t NODE_SENSORS_COUNT = 1;
const uint8_t HEATER_CONTROL_RELAY_SENSOR_ID = 1;
const uint8_t HEATER_CONTROL_RELAY_PIN = A0;
const uint8_t HEATER_OFF = 0;
const uint8_t HEATER_ON = 1;

const uint32_t HEATER_ACTUATOR_STATE_SEND_INTERVAL_MS = 25000;
const uint32_t KNOCK_MSG_WAIT_INTERVAL_MS = 3000;
const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 300;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 1200;

#ifdef WANT_RELAY_SAFETY
static uint32_t relaySafetyCounter = 0;
const uint32_t HEATER_RELAY_SAFETY_TIMEOUT_MS = 300000; // 5 min
const uint32_t HEATER_RELAY_SAFETY_CHECK_INTERVAL_MS = 60000;
const uint32_t HEATER_RELAY_SAFETY_MAX_COUNTER = HEATER_RELAY_SAFETY_TIMEOUT_MS /
    HEATER_RELAY_SAFETY_CHECK_INTERVAL_MS;
#endif

bool sendHeaterActuatorState = false;

#ifdef WANT_HEATER_ACTIVITY_LED
const uint8_t HEATER_ON_LED_PIN = 3;
#endif
// ------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//  this MUST be a multiple of SENSOR_SLEEP_INTERVAL_MS
const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// ------------------------------------------ BATTERY STATUS SECTION ---------------------------------
const uint32_t BATTERY_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)
// -----------------------------------------------------------------------------------------------------------

// --------------------------------- EEPROM CUSTOM CONFIG DATA SECTION ----------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
// we add 1 for storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown:Unknown"
// -------------------------------------------------------------------------------------------------------------

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
    return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char *metadata, char **nodeInfo, uint8_t maxFields) {
    if (!metadata || !nodeInfo) {
        return;
    }

    for (uint8_t i = 0; i < maxFields; i++) {
        if (i == 0) {
            strncpy(nodeInfo[i], strtok(metadata, ":"), MAX_NODE_METADATA_LENGTH);
            continue;
        }
        strncpy(nodeInfo[i], strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
    }
}

void loadNodeDefaultMetadata(char **nodeInfo, uint8_t maxFields) {
    char metadata[MAX_NODE_METADATA_LENGTH];
    memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy_P(metadata, PSTR(DEFAULT_NODE_METADATA), MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(metadata, nodeInfo, maxFields);
}

void loadNodeEepromRawMetadata(char *destBuffer, uint8_t len) {
    memset(destBuffer, '\0', len);
    for (uint16_t i = 0; i < len; i++) {
        destBuffer[i] = EEPROM.read(EEPROM_CUSTOM_METADATA_INDEX + i);
    }
}

void loadNodeEepromMetadataFields(char **nodeInfo, uint8_t maxFields) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                              EEPROM_FIRST_WRITE_MARK) ||
        !nodeInfo) {
        loadNodeDefaultMetadata(nodeInfo, maxFields);
        return;
    }

    char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
    loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

    parseNodeMetadata(rawNodeMetadata, nodeInfo, maxFields);
}

void saveNodeEepromMetadata(const char *metadata) {
    if (metadata) {
        if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX,
                                  EEPROM_FIRST_WRITE_MARK)) {
            EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
        }

        for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
            EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
        }
    }
}

void presentNodeMetadata() {
    char nodeName[MAX_NODE_METADATA_LENGTH];
    char heaterSensorName[MAX_NODE_METADATA_LENGTH];
    memset(nodeName, '\0', MAX_NODE_METADATA_LENGTH);
    memset(heaterSensorName, '\0', MAX_NODE_METADATA_LENGTH);

    char *nodeInfo[] = {
        nodeName,     // node friendly name
        heaterSensorName // node sensor friendly name
    };

    // load node metadata based on attached sensors count + the node name
    loadNodeEepromMetadataFields(nodeInfo, (NODE_SENSORS_COUNT + 1));

    sendSketchInfo(nodeName, MY_SENSOR_NODE_SKETCH_VERSION);
    present(HEATER_CONTROL_RELAY_SENSOR_ID, S_BINARY, heaterSensorName);
}

uint8_t getHeaterState() {
    return digitalRead(HEATER_CONTROL_RELAY_PIN);
}

void setHeaterState(uint8_t newState) {
    digitalWrite(HEATER_CONTROL_RELAY_PIN, newState);

    #ifdef WANT_HEATER_ACTIVITY_LED
    // signal heater state using a LED
    digitalWrite(HEATER_ON_LED_PIN, (newState == HEATER_ON));
    #endif

    #ifdef WANT_RELAY_SAFETY
    if(newState == HEATER_OFF) {
        relaySafetyCounter = 0;
    }
    #endif
}

#ifdef HAS_NODE_ID_SET_SWITCH
uint8_t readNodeIdSwitch() {
    uint8_t nodeId = 0;

    for (uint8_t i = 0; i < sizeof(NODE_ID_SWITCH_PINS); i++) {
        pinMode(NODE_ID_SWITCH_PINS[i], INPUT_PULLUP);
        nodeId |= !digitalRead(NODE_ID_SWITCH_PINS[i]) << i;
    }

    return nodeId;
}
#endif

void sendData(uint8_t sensorId, uint8_t sensorData, uint8_t dataType) {
    MyMessage sensorDataMsg(sensorId, dataType);

    for (uint8_t retries = 0; !send(sensorDataMsg.set(sensorData), false) &&
         (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
        // random sleep interval between retries for collisions
        wait(random(SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS,
            SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS));
    }
}

/*void sendKnockSyncMsg() {
    MyMessage knockMsg(HEATER_CONTROL_RELAY_SENSOR_ID, V_VAR1);

    send(knockMsg.set("knock"), false);
    wait(KNOCK_MSG_WAIT_INTERVAL_MS);
}*/

// called by mysensors to set node id internally
// this is useful to set node id at runtime and
//  not at compile time with MY_NODE_ID preprocesor define
// needs mysensors core patched
uint8_t setNodeId() {
#ifdef HAS_NODE_ID_SET_SWITCH
	return readNodeIdSwitch();
#else
	return MY_NODE_ID;
#endif
}

// called automatically by mysensors core for doing node presentation
void presentation() {
    presentNodeMetadata();
}

// called automatically by mysensors core for incomming messages
void receive(const MyMessage &message) {
    switch (message.type) {
        case V_VAR1:
            if (message.getCommand() == C_SET) {
                char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
                loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

                // save new node metadata only when they differ
                if (strncmp(message.getString(), rawNodeMetadata,
                            MAX_NODE_METADATA_LENGTH) != 0) {
                    char recvMetadata[MAX_NODE_METADATA_LENGTH];
                    memset(recvMetadata, '\0', MAX_NODE_METADATA_LENGTH);
                    strncpy(recvMetadata, message.getString(), MAX_NODE_METADATA_LENGTH);
                    saveNodeEepromMetadata(recvMetadata);
                }
                presentNodeMetadata();
            }
            break;
        #ifdef WANT_RELAY_SAFETY
        case V_VAR2:
            if((getHeaterState() == HEATER_ON) &&
                    (message.getCommand() == C_SET) &&
                    (strcasecmp_P(message.getString(), PSTR("reset")) == 0)) {
                relaySafetyCounter = 0;
            }
            break;
        #endif
        case V_STATUS:
            // V_STATUS message type for heater set operations only
            if (message.getCommand() == C_SET) {
                uint8_t newState = 0;
                sscanf(message.getString(), "%hhu", &newState);
                setHeaterState(newState);
                sendHeaterActuatorState = true;
            }

            // V_STATUS message type for heater get operations only
            if(message.getCommand() == C_REQ) {
                sendHeaterActuatorState = true;

                #ifdef WANT_RELAY_SAFETY
                relaySafetyCounter = 0;
                #endif
            }
            break;
        default:;
    }
}

void setup() {
    pinMode(HEATER_CONTROL_RELAY_PIN, OUTPUT);

    #ifdef WANT_HEATER_ACTIVITY_LED
    pinMode(HEATER_ON_LED_PIN, OUTPUT);
    #endif

    // make sure the relay is off when starting up
    setHeaterState(HEATER_OFF);

#ifdef WANT_RELAY_SAFETY
    relaySafetyCounter = 0;
#endif
}

void loop()  {
    static bool firstInit = false;
    if(!firstInit) {
        //sendKnockSyncMsg();
        sendHeartbeat();
        sendBatteryLevel(100);
        firstInit = true;
    }

#ifdef WANT_RELAY_SAFETY
    static uint32_t lastRelaySafetyCheckTimestamp;
    // start heater safety counter when turning on
    if ((getHeaterState() == HEATER_ON) &&
            ((millis() - lastRelaySafetyCheckTimestamp) >= HEATER_RELAY_SAFETY_CHECK_INTERVAL_MS)) {
        if (++relaySafetyCounter >= HEATER_RELAY_SAFETY_MAX_COUNTER) {
            // for safety turn off the heater if the controller doesn't reset the relay safety timer
            //  this is needed in case something bad happens and the controller looses control over this node
            //     so we need to shutdown the heater automatically
            setHeaterState(HEATER_OFF);
        }
        lastRelaySafetyCheckTimestamp = millis();
    }
#endif

    if (sendHeaterActuatorState) {
        MyMessage stateMsg(HEATER_CONTROL_RELAY_SENSOR_ID, V_STATUS);
        // send new state back to controller
        sendData(HEATER_CONTROL_RELAY_SENSOR_ID, getHeaterState(), V_STATUS);
        sendHeaterActuatorState = false;
    }

    static uint32_t lastHeartbeatReportTimestamp;
    if ((millis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
        sendHeartbeat();
        lastHeartbeatReportTimestamp = millis();
    }
    // this is always on(I don't see a reason on sending battery level here - but if the client requested it...oh well)
    static uint32_t lastBatteryLvlReportTimestamp;
    if(millis() - lastBatteryLvlReportTimestamp >= BATTERY_LVL_REPORT_INTERVAL_MS) {
        sendBatteryLevel(100);
        lastBatteryLvlReportTimestamp = millis();
    }
}
