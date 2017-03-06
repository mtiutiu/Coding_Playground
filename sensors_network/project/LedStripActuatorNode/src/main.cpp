//#pragma GCC optimize ("-O2")

#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
//#define HAS_NODE_ID_SET_SWITCH
#define LED_STRIP_CONTROL_BTN_HAS_LED_SIGNALING
// ----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RF69_868MHZ

#define MY_NODE_ID 250  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED  // this node needs to be functional without mysensors network/gw too
//#define MY_TRANSPORT_DONT_CARE_MODE // this node needs to be functional without mysensors network/gw to
#define MY_TRANSPORT_RELAX // for future mysensors core upgrades(replaces MY_TRANSPORT_DONT_CARE_MODE)
#define MY_TRANSPORT_WAIT_READY_MS	3000

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

// Flash leds on rx/tx/err
//#define MY_DEFAULT_ERR_LED_PIN 4
//#define MY_DEFAULT_RX_LED_PIN  6
//#define MY_DEFAULT_TX_LED_PIN  5
// Set blinking period
//#define MY_DEFAULT_LED_BLINK_PERIOD 300
// Inverses the behavior of leds
//#define MY_WITH_LEDS_BLINKING_INVERSE

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

// ---------------------------------------- LED STRIP CONTROL BUTTON CONFIGURATION ------------------------
const uint8_t LED_STRIP_CONTROL_BTN_PIN = 9;
const uint32_t LED_STRIP_CONTROL_BTN_DEBOUNCE_INTERVAL_MS = 500;

#ifdef LED_STRIP_CONTROL_BTN_HAS_LED_SIGNALING
const uint8_t LED_STRIP_CONTROL_BTN_LED_PIN = A0;
#endif

#include <Bounce2.h>

Bounce ledStripControlBtnDebouncer = Bounce();
// -------------------------------------------------------------------------------------------------------------

// ----------------------- LED STRIP ACTUATOR SENSOR SECTION ----------------------
const uint8_t NODE_SENSORS_COUNT = 1;
const uint8_t LED_STRIP_RELAY_SENSOR_ID = 1;
const uint8_t LED_STRIP_CONTROL_RELAY_PIN = 4;
const uint8_t LED_STRIP_OFF = 0;
const uint8_t LED_STRIP_ON = 1;

const uint32_t LED_STRIP_ACTUATOR_STATE_SEND_INTERVAL_MS = 45000;
const uint32_t SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS = 500;

//const uint32_t KNOCK_MSG_WAIT_INTERVAL_MS = 3000;
const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 300;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 1200;

bool sendLedStripActuatorState = false;
const uint8_t ATTACHED_SENSOR_TYPES[] = {S_BINARY};
// ------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE PRESENTATION CONFIG ------------------------------------------
const uint32_t PRESENTATION_SEND_INTERVAL_MS = 600000; // 10 min
// -----------------------------------------------------------------------------------------------------------

// ------------------------------------------ SUPPLY VOLTAGE STATUS SECTION ---------------------------------
const uint32_t POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)

#include <Vcc.h>

const float VccMin        = 0;  // Minimum expected Vcc level, in Volts
const float VccMax        = 3.3;  // Maximum expected Vcc level, in Volts
const float VccCorrection = 1.0;  // Measured Vcc by multimeter divided by reported Vcc

Vcc vcc(VccCorrection);
// -----------------------------------------------------------------------------------------------------------

// --------------------------------- EEPROM CUSTOM CONFIG DATA SECTION ----------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
// storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown:Unknown"

char nodeInfo[NODE_SENSORS_COUNT + 1][MAX_NODE_METADATA_LENGTH];
// -------------------------------------------------------------------------------------------------------------

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
    return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char *metadata, char nodeInfo[][MAX_NODE_METADATA_LENGTH], uint8_t maxFields) {
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

void loadNodeDefaultMetadata(char nodeInfo[][MAX_NODE_METADATA_LENGTH], uint8_t maxFields) {
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

void loadNodeEepromMetadataFields(char nodeInfo[][MAX_NODE_METADATA_LENGTH], uint8_t maxFields) {
    memset(nodeInfo, ((NODE_SENSORS_COUNT + 1) * MAX_NODE_METADATA_LENGTH), '\0');

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
    // load node metadata based on attached sensors count + the node name
    loadNodeEepromMetadataFields(nodeInfo, (NODE_SENSORS_COUNT + 1));

    sendSketchInfo(nodeInfo[0], MY_SENSOR_NODE_SKETCH_VERSION);
    wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);    // don't send next data too fast

    for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
		present(i + 1, ATTACHED_SENSOR_TYPES[i], nodeInfo[i + 1]);
		wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);// don't send next data too fast
	}
}

uint8_t getLedStripState() {
    return digitalRead(LED_STRIP_CONTROL_RELAY_PIN);
}

void setLedStripState(uint8_t newState) {
    digitalWrite(LED_STRIP_CONTROL_RELAY_PIN, newState);

#ifdef LED_STRIP_CONTROL_BTN_HAS_LED_SIGNALING
    // signaling btn led has inverse logic
    //  (we want it to be lit when the led strip is OFF and viceversa)
    digitalWrite(LED_STRIP_CONTROL_BTN_LED_PIN, !newState);
#endif
}

void toggleLedStripState() {
    setLedStripState(!digitalRead(LED_STRIP_CONTROL_RELAY_PIN));
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
    MyMessage knockMsg(LED_STRIP_RELAY_SENSOR_ID, V_VAR1);

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
        case V_STATUS:
            // V_STATUS message type for led strip actuator set operations only
            if (message.getCommand() == C_SET) {
                setLedStripState(message.getBool());
                sendLedStripActuatorState = true;
            }

            // V_STATUS message type for led strip actuator get operations only
            if(message.getCommand() == C_REQ) {
                sendLedStripActuatorState = true;
            }
            break;
        default:;
    }
}

void setup() {
    pinMode(LED_STRIP_CONTROL_BTN_PIN, INPUT_PULLUP);
    ledStripControlBtnDebouncer.attach(LED_STRIP_CONTROL_BTN_PIN);
    ledStripControlBtnDebouncer.interval(LED_STRIP_CONTROL_BTN_DEBOUNCE_INTERVAL_MS);

#ifdef LED_STRIP_CONTROL_BTN_HAS_LED_SIGNALING
    pinMode(LED_STRIP_CONTROL_BTN_LED_PIN, OUTPUT);
    digitalWrite(LED_STRIP_CONTROL_BTN_LED_PIN, LOW);
#endif

    pinMode(LED_STRIP_CONTROL_RELAY_PIN, OUTPUT);

    // make sure the relay is off when starting up
    setLedStripState(LED_STRIP_OFF);
}

void loop()  {
    static bool firstInit = false;
    if(!firstInit) {
        //sendKnockSyncMsg();
        sendHeartbeat();
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        sendBatteryLevel(100);
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        sendLedStripActuatorState = true;
        firstInit = true;
    }

    ledStripControlBtnDebouncer.update();
    if(ledStripControlBtnDebouncer.fell()) {
        // led strip control button was pressed
        toggleLedStripState();
        sendLedStripActuatorState = true;
    }

    static uint32_t lastLedStripActuatorStateReportTimestamp;
    if(millis() - lastLedStripActuatorStateReportTimestamp >= LED_STRIP_ACTUATOR_STATE_SEND_INTERVAL_MS) {
        sendLedStripActuatorState = true;
        lastLedStripActuatorStateReportTimestamp = millis();
    }

    static uint32_t lastHeartbeatReportTimestamp;
    if ((millis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
        sendHeartbeat();
        lastHeartbeatReportTimestamp = millis();
    }

    // send power supply voltage level
    static uint32_t lastPowerSupplyVoltageLvlReportTimestamp;
    if(millis() - lastPowerSupplyVoltageLvlReportTimestamp >= POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS) {
        sendBatteryLevel(vcc.Read_Perc(VccMin, VccMax));
        lastPowerSupplyVoltageLvlReportTimestamp = millis();
    }

    if (sendLedStripActuatorState) {
        // send new state back to controller
        sendData(LED_STRIP_RELAY_SENSOR_ID, getLedStripState(), V_STATUS);
        sendLedStripActuatorState = false;
    }

    // send presentation on a regular interval too
    static uint32_t lastPresentationTimestamp = 0;
    if ((millis() - lastPresentationTimestamp) >= PRESENTATION_SEND_INTERVAL_MS) {
        presentNodeMetadata();
        lastPresentationTimestamp = millis();
    }
}
