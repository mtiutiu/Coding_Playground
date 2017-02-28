//#pragma GCC optimize ("-O2")

#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
//#define HAS_NODE_ID_SET_SWITCH
// ----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69
#define MY_RFM69_FREQUENCY RF69_868MHZ

#define MY_NODE_ID 249  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED  // this node needs to be functional without mysensors network/gw too
//#define MY_TRANSPORT_DONT_CARE_MODE // this node needs to be functional without mysensors network/gw to
#define MY_TRANSPORT_WAIT_READY_MS	3000
#define MY_TRANSPORT_RELAX // for future mysensors core upgrades(replaces MY_TRANSPORT_DONT_CARE_MODE)

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

#define MY_OTA_FIRMWARE_FEATURE // need OTA

#include <MySensors.h>
const uint32_t SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS = 100;
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

// ---------------------------------------- TOUCH SENSORS CONFIGURATION ------------------------
#define RELEASED  0
#define TOUCHED   1
const uint32_t SHORT_TOUCH_DETECT_THRESHOLD_MS = 1000;
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {3, A1};
// -------------------------------------------------------------------------------------------------------------

// ----------------------- LIGHTS SECTION ----------------------
const uint8_t NODE_SENSORS_COUNT = 2;

const uint32_t LIGHTS_STATE_SEND_INTERVAL_MS = 45000; //45s interval

const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 300;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 1200;

#define OFF 0
#define ON  1
#define SET_COIL_INDEX     0
#define RESET_COIL_INDEX   1

const uint8_t RELAY_CH_PINS[][2] = {
    {A4, A5}, // channel 1 relay control pins(bistable relay - 2 coils)
    {0, 1}  // channel 2 relay control pins(bistable relay - 2 coils)
};

const uint32_t RELAY_PULSE_DELAY_MS = 50;

uint8_t channelState[] = {OFF, OFF};
const uint8_t LIGHT_STATE_LED_PINS[] = {4, A0};

#define TURN_RED_LED_ON(channel) hwDigitalWrite(LIGHT_STATE_LED_PINS[channel], LOW)
#define TURN_BLUE_LED_ON(channel) hwDigitalWrite(LIGHT_STATE_LED_PINS[channel], HIGH)
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
const float VccMax        = 3.0;  // Maximum expected Vcc level, in Volts
const float VccCorrection = 1.1;  // Measured Vcc by multimeter divided by reported Vcc

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
		present(i + 1, S_BINARY, nodeInfo[i + 1]);
		wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);// don't send next data too fast
	}
}

#ifdef HAS_NODE_ID_SET_SWITCH
uint8_t readNodeIdSwitch() {
    uint8_t nodeId = 0;

    for (uint8_t i = 0; i < sizeof(NODE_ID_SWITCH_PINS); i++) {
        hwPinMode(NODE_ID_SWITCH_PINS[i], INPUT_PULLUP);
        nodeId |= !hwDigitalRead(NODE_ID_SWITCH_PINS[i]) << i;
    }

    return nodeId;
}
#endif

void sendData(uint8_t sensorId, uint8_t sensorData, uint8_t dataType) {
    MyMessage sensorDataMsg(sensorId, dataType);

    for (uint8_t retries = 0; !send(sensorDataMsg.set(sensorData), false) &&
         (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
        // random wait interval between retries for collisions
        wait(random(SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS,
            SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS));
    }
}

uint8_t getChannelState(uint8_t index) {
    return channelState[index];
}

void setChannelRelaySwitchState(uint8_t channel, uint8_t newState) {
    if(newState == ON) {
        hwDigitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], HIGH);
        wait(RELAY_PULSE_DELAY_MS);
        hwDigitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], LOW);
        channelState[channel] = ON;
        TURN_RED_LED_ON(channel);
    } else {
        hwDigitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], HIGH);
        wait(RELAY_PULSE_DELAY_MS);
        hwDigitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], LOW);
        channelState[channel] = OFF;
        TURN_BLUE_LED_ON(channel);
    }
}

void sendLightsState() {
    for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
        sendData(i + 1, getChannelState(i), V_STATUS);
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
    }
}

void checkTouchSensor() {
    static uint32_t lastTouchTimestamp[NODE_SENSORS_COUNT];
    static uint8_t touchSensorState[NODE_SENSORS_COUNT];

	for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
		if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
                (touchSensorState[i] != TOUCHED)) {

            // latch in TOUCH state
            touchSensorState[i] = TOUCHED;
            lastTouchTimestamp[i] = millis();
		}

        if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
                (touchSensorState[i] != RELEASED)) {

            lastTouchTimestamp[i] = millis() - lastTouchTimestamp[i];
            // evaluate elapsed time between touch states
            // we can do here short press and long press handling if desired
            if(lastTouchTimestamp[i] >= SHORT_TOUCH_DETECT_THRESHOLD_MS) {
                channelState[i] = !channelState[i];
                setChannelRelaySwitchState(i, channelState[i]);
                sendData(i + 1, channelState[i], V_STATUS);
            }
            // latch in RELEASED state
            touchSensorState[i] = RELEASED;
		}
	}
}

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
            // V_STATUS message type for light switch set operations only
            if (message.getCommand() == C_SET) {
                // maybe perform some received data validation here ???
                setChannelRelaySwitchState((message.sensor - 1), message.getBool());
                sendData(message.sensor, message.getBool(), V_STATUS);
            }

            // V_STATUS message type for light switch get operations only
            if(message.getCommand() == C_REQ) {
                // maybe perform some received data validation here ???
                sendData(message.sensor, getChannelState(message.sensor - 1), V_STATUS);
            }
            break;
        default:;
    }
}

void setup() {
    // set required mcu pins for reading touch sensors state
    for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
		hwPinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
	}

    // lit BLUE leds when starting up
    for(uint8_t i = 0; i < sizeof(LIGHT_STATE_LED_PINS); i++) {
		hwPinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
        TURN_BLUE_LED_ON(i);
	}

    // set bistable relays initial state
	for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
        for(uint8_t j = 0; j < NODE_SENSORS_COUNT; j++) {
		    hwPinMode(RELAY_CH_PINS[i][j], OUTPUT);
            // make sure touch switch relays start in OFF state
            hwDigitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], HIGH);
            wait(RELAY_PULSE_DELAY_MS);
            hwDigitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], LOW);
        }
	}
}

void loop()  {
    static bool firstInit = false;
    if(!firstInit) {
        //sendKnockSyncMsg();
        sendHeartbeat();
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        sendBatteryLevel(vcc.Read_Perc(VccMin, VccMax));
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        sendLightsState();
        firstInit = true;
    }

    checkTouchSensor();

    static uint32_t lastLightsStateReportTimestamp;
    if(millis() - lastLightsStateReportTimestamp >= LIGHTS_STATE_SEND_INTERVAL_MS) {
        sendLightsState();
        lastLightsStateReportTimestamp = millis();
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

    // send presentation on a regular interval too
    static uint32_t lastPresentationTimestamp = 0;
    if ((millis() - lastPresentationTimestamp) >= PRESENTATION_SEND_INTERVAL_MS) {
        presentNodeMetadata();
        lastPresentationTimestamp = millis();
    }
}
