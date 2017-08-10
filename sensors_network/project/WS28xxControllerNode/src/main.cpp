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
#define MY_RFM69_NEW_DRIVER
#define MY_RADIO_RFM69

#define MY_RFM69_FREQUENCY RFM69_868MHZ

#define MY_NODE_ID 200  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED  // this node needs to be functional without mysensors network/gw too
//#define MY_TRANSPORT_DONT_CARE_MODE // this node needs to be functional without mysensors network/gw to
#define MY_TRANSPORT_RELAX // for future mysensors core upgrades(replaces MY_TRANSPORT_DONT_CARE_MODE)
#define MY_TRANSPORT_WAIT_READY_MS	3000

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.2"

#define MY_OTA_FIRMWARE_FEATURE // need OTA
#define MY_OTA_FLASH_SS   4

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
const uint8_t SENSOR_DATA_SEND_RETRIES = 5;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 10;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 30;

const uint8_t RGB_SENSOR_ID = 1;
//const uint8_t BRIGHTNESS_SENSOR_ID = 2;
//const uint8_t SPEED_SENSOR_ID = 3;
//const uint8_t MODE_SENSOR_ID = 4;
//const uint8_t STATUS_SENSOR_ID = 5;

const uint8_t ATTACHED_SENSOR_TYPES[] = {
  S_RGB_LIGHT
  //S_CUSTOM,   // brightness
  //S_CUSTOM,   // speed
  //S_CUSTOM,    // mode
  //S_BINARY
};

const bool OFF = false;
const bool ON = true;

const uint8_t BRIGHTNESS_MIN_VALUE = 0;
const uint8_t BRIGHTNESS_MAX_VALUE = 255;
const uint8_t BRIGHTNESS_DEFAULT_VALUE = 100;
const uint8_t SPEED_MIN_VALUE = 0;
const uint8_t SPEED_MAX_VALUE = 255;
const uint8_t SPEED_DEFAULT_VALUE = 100;
const uint8_t MODE_MIN_VALUE = 0;
const uint8_t MODE_DEFAULT_VALUE = 0;
const uint8_t R_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t R_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t R_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t G_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t G_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t G_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t B_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t B_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t B_COLOR_FIELD_DEFAULT_VALUE = 100;

const uint8_t RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID = 1;
const uint8_t RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID = 2;
const uint8_t RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID = 3;
const uint8_t RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID = 4;
const uint8_t RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID = 5;
const uint8_t RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID = 6;

const uint16_t LED_COUNT = 300;
const uint16_t LED_PXL_BUFF_SIZE = LED_COUNT * 3;
const uint8_t DATA_PIN = 3;

#include <WS2812FX.h>

uint8_t pix_buff[LED_PXL_BUFF_SIZE];

// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
//   NEO_KHZ400  400 KHz (classic 'v1' (not v2) FLORA pixels, WS2811 drivers)
//   NEO_GRB     Pixels are wired for GRB bitstream (most NeoPixel products)
//   NEO_RGB     Pixels are wired for RGB bitstream (v1 FLORA pixels, not v2)
//   NEO_RGBW    Pixels are wired for RGBW bitstream (NeoPixel RGBW products)
WS2812FX ws2812fx = WS2812FX(LED_COUNT, DATA_PIN, NEO_GRB + NEO_KHZ800, pix_buff);
// ------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE PRESENTATION CONFIG ------------------------------------------
//const uint32_t PRESENTATION_SEND_INTERVAL_MS = 600000; // 10 min
// -----------------------------------------------------------------------------------------------------------

// ------------------------------------------ SUPPLY VOLTAGE STATUS SECTION ---------------------------------
const uint32_t POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)

const uint16_t SUPPY_VOLTAGE_MV = 5000;
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
  memset(nodeInfo, '\0', ((NODE_SENSORS_COUNT + 1) * MAX_NODE_METADATA_LENGTH));

  if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK) || !nodeInfo) {
    loadNodeDefaultMetadata(nodeInfo, maxFields);
    return;
  }

  char rawNodeMetadata[MAX_NODE_METADATA_LENGTH];
  loadNodeEepromRawMetadata(rawNodeMetadata, MAX_NODE_METADATA_LENGTH);

  parseNodeMetadata(rawNodeMetadata, nodeInfo, maxFields);
}

void saveNodeEepromMetadata(const char *metadata) {
  if (metadata) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK)) {
      EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
    }

    for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
      EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
    }
  }
}

uint8_t getSupplyVoltagePercentage() {
  return constrain(((hwCPUVoltage() * 100) / SUPPY_VOLTAGE_MV), 0, 100);
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

void sendData(uint8_t sensorId, const void* sensorData, uint8_t dataType) {
  MyMessage sensorDataMsg(sensorId, dataType);

  if(dataType == V_RGB) {
    sensorDataMsg = sensorDataMsg.set((const char*)sensorData);
  } else {
    sensorDataMsg = sensorDataMsg.set(*((uint8_t*)sensorData));
  }

  for (uint8_t retries = 0; !send(sensorDataMsg, false) &&
        (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
    // random sleep interval between retries for collisions
    wait(random(SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS,
      SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS));
  }
}

void saveRGBLedStripCurrentSettings(uint8_t brightness, uint8_t speed,
                                      uint8_t mode, uint32_t color) {

  saveState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID, brightness);
  saveState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID, speed);
  saveState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID, mode);
  saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID,
              (color & 0x00FF0000) >> 16);
  saveState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID,
              (color & 0x0000FF00) >> 8);
  saveState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID,
              (color & 0x000000FF) >> 0);
}

void loadRGBLedStripSavedSettings() {
  uint8_t brightnessSetting = loadState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setBrightness(
    ((brightnessSetting >= BRIGHTNESS_MIN_VALUE) && (brightnessSetting <= BRIGHTNESS_MAX_VALUE)) ?
    brightnessSetting : BRIGHTNESS_DEFAULT_VALUE
  );

  uint8_t speedSetting = loadState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setSpeed(
    ((speedSetting >= SPEED_MIN_VALUE) && (speedSetting <= SPEED_MAX_VALUE)) ?
    speedSetting : SPEED_DEFAULT_VALUE
  );

  uint8_t modeSetting = loadState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setMode(
    ((modeSetting >= MODE_MIN_VALUE) && (modeSetting <= ws2812fx.getModeCount())) ?
    modeSetting : MODE_DEFAULT_VALUE
  );

  uint8_t R_FieldColorSetting = loadState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID);
  uint8_t G_FieldColorSetting = loadState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID);
  uint8_t B_FieldColorSetting = loadState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setColor(
    ((R_FieldColorSetting >= R_COLOR_FIELD_MIN_VALUE) && (R_FieldColorSetting <= R_COLOR_FIELD_MAX_VALUE)) ?
    R_FieldColorSetting : R_COLOR_FIELD_DEFAULT_VALUE,
    ((G_FieldColorSetting >= G_COLOR_FIELD_MIN_VALUE) && (G_FieldColorSetting <= G_COLOR_FIELD_MAX_VALUE)) ?
    G_FieldColorSetting : G_COLOR_FIELD_DEFAULT_VALUE,
    ((B_FieldColorSetting >= B_COLOR_FIELD_MIN_VALUE) && (B_FieldColorSetting <= B_COLOR_FIELD_MAX_VALUE)) ?
    B_FieldColorSetting : B_COLOR_FIELD_DEFAULT_VALUE
  );
  ws2812fx.trigger();
}

void sendLedStripSettings() {
  char colorInfoBuff[6];
  sprintf(colorInfoBuff, "%02x%02x%02x",
  (uint8_t)((ws2812fx.getColor() & 0x00FF0000) >> 16),
  (uint8_t)((ws2812fx.getColor() & 0x0000FF00) >> 8),
  (uint8_t)((ws2812fx.getColor() & 0x000000FF) >> 0));
  sendData(RGB_SENSOR_ID, colorInfoBuff, V_RGB);
  wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripBrightness = round((float)(ws2812fx.getBrightness() * 100) / BRIGHTNESS_MAX_VALUE);
  sendData(RGB_SENSOR_ID, &currentLedStripBrightness, V_LIGHT_LEVEL);
  wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripSpeed = round((float)(ws2812fx.getSpeed() * 100) / SPEED_MAX_VALUE);
  sendData(RGB_SENSOR_ID, &currentLedStripSpeed, V_PERCENTAGE);
  wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripMode = ws2812fx.getMode();
  sendData(RGB_SENSOR_ID, &currentLedStripMode, V_CUSTOM);
  wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripState = ws2812fx.isRunning();
  sendData(RGB_SENSOR_ID, &currentLedStripState, V_STATUS);
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
    case V_RGB:
      if(!ws2812fx.isRunning()) {
        return;
      }
      // V_RGB message type for RGB led strip set operations only
      if (message.getCommand() == C_SET) {
        ws2812fx.setColor(strtoul(message.getString(), NULL, 16));
        ws2812fx.trigger();
        sendData(RGB_SENSOR_ID, message.getString(), V_RGB);
      }
      break;
    case V_LIGHT_LEVEL:
      if(!ws2812fx.isRunning()) {
        return;
      }
      // brightness setting set
      if (message.getCommand() == C_SET) {
        uint8_t brightnessPercentage = message.getByte();
        if((brightnessPercentage >= 0) && (brightnessPercentage <= 100)) {
          ws2812fx.setBrightness(round((float)(brightnessPercentage * BRIGHTNESS_MAX_VALUE) / 100));
          ws2812fx.trigger();
          sendData(RGB_SENSOR_ID, &brightnessPercentage, V_LIGHT_LEVEL);
        }
      }
      break;
    case V_PERCENTAGE:
      if(!ws2812fx.isRunning()) {
        return;
      }
      // speed setting set
      if (message.getCommand() == C_SET) {
        uint8_t speedPercentage = message.getByte();
        if((speedPercentage >= 0) && (speedPercentage <= 100)) {
          ws2812fx.setSpeed(round((float)(speedPercentage * SPEED_MAX_VALUE) / 100));
          ws2812fx.trigger();
          sendData(RGB_SENSOR_ID, &speedPercentage, V_PERCENTAGE);
        }
      }
      break;
    case V_CUSTOM:
      if(!ws2812fx.isRunning()) {
        return;
      }
      // mode setting set
      if (message.getCommand() == C_SET) {
        uint8_t modeSetting = message.getByte();
        if((modeSetting >= MODE_MIN_VALUE) && (modeSetting < ws2812fx.getModeCount())) {
          ws2812fx.setMode(modeSetting);
          ws2812fx.trigger();
          sendData(RGB_SENSOR_ID, &modeSetting, V_CUSTOM);
        }
      }
      break;
    case V_STATUS:
      // save current rgb led strip settings
      if (message.getCommand() == C_SET) {
        bool newLedStripState = message.getBool();
        if((newLedStripState == OFF) && (ws2812fx.isRunning())) {
          // get current brightness/color settings for saving them later
          uint8_t previousLedStripBrightness = ws2812fx.getBrightness();
          uint32_t previousLedStripColor = ws2812fx.getColor();

          // turn OFF rgb led strip
          ws2812fx.stop();
          hwDigitalWrite(DATA_PIN, LOW);

          saveRGBLedStripCurrentSettings(previousLedStripBrightness,
            ws2812fx.getSpeed(), ws2812fx.getMode(), previousLedStripColor);
          }

          if((newLedStripState == ON) && (!ws2812fx.isRunning())) {
            // load rgb led strip saved settings
            loadRGBLedStripSavedSettings();
            sendLedStripSettings();
            ws2812fx.start();
          }
          sendData(RGB_SENSOR_ID, &newLedStripState, V_STATUS);
        }
        break;
    default:;
  }
}

void before() {
  wdt_disable();
  wdt_enable(WDTO_8S);

  hwPinMode(DATA_PIN, OUTPUT);

  ws2812fx.init();

  // load rgb led strip saved settings
  loadRGBLedStripSavedSettings();

  ws2812fx.start();
}

void setup() {

}

void loop()  {
  wdt_reset();

  static bool firstInit = false;
  if(!firstInit) {
    sendHeartbeat();
    wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

    sendBatteryLevel(getSupplyVoltagePercentage());
    wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

    sendLedStripSettings();
    firstInit = true;
  }

  if(ws2812fx.isRunning()) {
    ws2812fx.service();
  }

  // static uint32_t lastHeartbeatReportTimestamp;
  // if ((hwMillis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
  //     sendHeartbeat();
  //     lastHeartbeatReportTimestamp = hwMillis();
  // }

  // send power supply voltage level
  static uint32_t lastPowerSupplyVoltageLvlReportTimestamp;
  if(hwMillis() - lastPowerSupplyVoltageLvlReportTimestamp >= POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS) {
    sendBatteryLevel(getSupplyVoltagePercentage());
    lastPowerSupplyVoltageLvlReportTimestamp = hwMillis();
  }

  // send presentation on a regular interval too
  // static uint32_t lastPresentationTimestamp = 0;
  // if ((hwMillis() - lastPresentationTimestamp) >= PRESENTATION_SEND_INTERVAL_MS) {
  //     presentNodeMetadata();
  //     lastPresentationTimestamp = hwMillis();
  // }
}
