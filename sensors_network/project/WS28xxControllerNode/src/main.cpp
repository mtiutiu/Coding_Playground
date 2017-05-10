//#pragma GCC optimize ("-O2")

#include <Arduino.h>
#include <SPI.h>
#include <EEPROM.h>
#include <avr/wdt.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
//#define HAS_NODE_ID_SET_SWITCH
// ----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
// RFM69 radio driver
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RF69_868MHZ

#define MY_NODE_ID 253  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED  // this node needs to be functional without mysensors network/gw too
//#define MY_TRANSPORT_DONT_CARE_MODE // this node needs to be functional without mysensors network/gw to
#define MY_TRANSPORT_RELAX // for future mysensors core upgrades(replaces MY_TRANSPORT_DONT_CARE_MODE)
#define MY_TRANSPORT_WAIT_READY_MS	3000

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.1"

#define MY_OTA_FIRMWARE_FEATURE // need OTA

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

// --------------------------------- RGB LED STRIP SECTION ----------------------
const uint8_t NODE_SENSORS_COUNT = 1;

const uint32_t SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS = 100;

//const uint32_t KNOCK_MSG_WAIT_INTERVAL_MS = 3000;
const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 10;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 50;

const uint8_t ATTACHED_SENSOR_TYPES[] = {S_RGB_LIGHT};

const uint16_t LED_COUNT = 144;
const uint8_t DATA_PIN = A0;

const uint8_t RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID = 1;
const uint8_t RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID = 2;
const uint8_t RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID = 3;
const uint8_t RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID = 4;
const uint8_t RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID = 5;
const uint8_t RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID = 6;

#include <WS2812FX.h>

// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
WS2812FX ws2812fx = WS2812FX(LED_COUNT, DATA_PIN, NEO_GRB + NEO_KHZ800);
// ------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE PRESENTATION CONFIG ------------------------------------------
//const uint32_t PRESENTATION_SEND_INTERVAL_MS = 600000; // 10 min
// -----------------------------------------------------------------------------------------------------------

// ------------------------------------------ SUPPLY VOLTAGE STATUS SECTION ---------------------------------
const uint32_t POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)

#include <Vcc.h>

const float VccMin        = 0;  // Minimum expected Vcc level, in Volts
const float VccMax        = 5.0;  // Maximum expected Vcc level, in Volts
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
        case V_VAR2:
            // brightness setting set
            if (message.getCommand() == C_SET) {
                uint8_t brightnessSetting = message.getByte();
                if((brightnessSetting >= 0) && (brightnessSetting <= 255)) {
                    ws2812fx.setBrightness(brightnessSetting);
                }
            }
        case V_VAR3:
            // speed setting set
            if (message.getCommand() == C_SET) {
                uint8_t speedSetting = message.getByte();
                if((speedSetting >= 0) && (speedSetting <= 255)) {
                    ws2812fx.setSpeed(speedSetting);
                }
            }
        case V_VAR4:
            // mode setting set
            if (message.getCommand() == C_SET) {
                uint8_t modeSetting = message.getByte();
                if((modeSetting >= 0) && (modeSetting <= ws2812fx.getModeCount())) {
                    ws2812fx.setMode(modeSetting);
                }
            }
        case V_VAR5:
            // save current rgb led strip settings
            if (message.getCommand() == C_SET) {
                bool saveSettings = message.getBool();
                if(saveSettings) {
                    saveState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID,
                        ws2812fx.getBrightness());
                    saveState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID,
                        ws2812fx.getSpeed());
                    saveState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID,
                        ws2812fx.getMode());
                    saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID,
                        (ws2812fx.getColor() & 0x00FF0000) >> 16);
                    saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID,
                        (ws2812fx.getColor() & 0x0000FF00) >> 8);
                    saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID,
                        (ws2812fx.getColor() & 0x000000FF) >> 0);
                }
            }
            break;
        case V_RGB:
            // V_RGB message type for RGB led strip set operations only
            if (message.getCommand() == C_SET) {
                ws2812fx.setColor(strtoul(message.getString(), NULL, 16));
                //ws2812fx.setColor(message.getULong());
            }
        default:;
    }
}

void before() {
    wdt_disable();
    wdt_enable(WDTO_8S);
}

void setup() {
    ws2812fx.init();

    // load rgb led strip saved settings
    ws2812fx.setBrightness(loadState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID));
    ws2812fx.setSpeed(loadState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID));
    ws2812fx.setColor(
        loadState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID),
        loadState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID),
        loadState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID)
    );
    ws2812fx.setMode(loadState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID));

    ws2812fx.start();
}

void loop()  {
    wdt_reset();

    static bool firstInit = false;
    if(!firstInit) {
        //sendKnockSyncMsg();
        sendHeartbeat();
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        sendBatteryLevel(vcc.Read_Perc(VccMin, VccMax));
        wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);
        firstInit = true;
    }

    ws2812fx.service();

    // static uint32_t lastHeartbeatReportTimestamp;
    // if ((hwMillis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
    //     sendHeartbeat();
    //     lastHeartbeatReportTimestamp = hwMillis();
    // }

    // send power supply voltage level
    static uint32_t lastPowerSupplyVoltageLvlReportTimestamp;
    if(hwMillis() - lastPowerSupplyVoltageLvlReportTimestamp >= POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS) {
        sendBatteryLevel(vcc.Read_Perc(VccMin, VccMax));
        lastPowerSupplyVoltageLvlReportTimestamp = hwMillis();
    }

    // send presentation on a regular interval too
    // static uint32_t lastPresentationTimestamp = 0;
    // if ((hwMillis() - lastPresentationTimestamp) >= PRESENTATION_SEND_INTERVAL_MS) {
    //     presentNodeMetadata();
    //     lastPresentationTimestamp = hwMillis();
    // }
}