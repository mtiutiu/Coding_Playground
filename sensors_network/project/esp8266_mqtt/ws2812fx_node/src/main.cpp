//#define DEBUG

#ifdef DEBUG
  #ifndef DEBUG_OUTPUT
    #define DEBUG_OUTPUT Serial
  #endif
  #ifndef SERIAL_DEBUG_BAUDRATE
    #define SERIAL_DEBUG_BAUDRATE 115200
  #endif
#endif

#define STRINGIFY(a) str(a)
#define str(a) #a

#include <Arduino.h>
#include <FS.h>
#include <ESPAsyncWebServer.h>
#include <ESPAsyncWiFiManager.h>
#include <ArduinoOTA.h>
#include <ArduinoJson.h>
#include <Ticker.h>

AsyncWebServer server(80);
DNSServer dns;

// enable reading of Vcc
ADC_MODE(ADC_VCC);

// ------------------------ Module CONFIG --------------------------------------
#ifndef AP_SSID
#define AP_SSID "WS2812FXController"
#endif
#ifndef AP_PASSWD
#define AP_PASSWD "test1234"
#endif
#ifndef CFG_PORTAL_TIMEOUT_S
#define CFG_PORTAL_TIMEOUT_S 180UL  // 3 minutes timeout for configuration portal
#endif
#define CONFIG_FILE "/config.json"

#define MQTT_SERVER_FIELD_MAX_LEN 40
#define MQTT_USER_FIELD_MAX_LEN 40
#define MQTT_PASS_FIELD_MAX_LEN 40
#define MQTT_PORT_FIELD_MAX_LEN 6
#define MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MYS_NODE_ID_FIELD_MAX_LEN 4
#define MYS_NODE_ALIAS_FIELD_MAX_LEN 40
#define MYS_NODE_LED_COUNT_FIELD_MAX_LEN 20

typedef struct {
  char mqtt_server[MQTT_SERVER_FIELD_MAX_LEN];
  char mqtt_user[MQTT_USER_FIELD_MAX_LEN];
  char mqtt_passwd[MQTT_PASS_FIELD_MAX_LEN];
  char mqtt_port[MQTT_PORT_FIELD_MAX_LEN];
  char mqtt_in_topic_prefix[MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mqtt_out_topic_prefix[MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mys_node_id[MYS_NODE_ID_FIELD_MAX_LEN];
  char mys_node_alias[MYS_NODE_ALIAS_FIELD_MAX_LEN];
  char mys_node_led_count[MYS_NODE_LED_COUNT_FIELD_MAX_LEN];
} CfgData;

typedef void (*cb)(CfgData& cfgData);
bool needToSaveConfig = false;
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensors.h>
#include <MySensorsEEPROM.h>

const uint8_t RGB_SENSOR_ID = 1;
const uint8_t SENSOR_COUNT = 1;
const uint8_t CHILD_TYPES[SENSOR_COUNT] = {S_RGB_LIGHT};
const uint8_t CHILD_SUBTYPES[SENSOR_COUNT] = {V_RGB};
const char *CHILD_ALIASES[SENSOR_COUNT] = {"RGB"};

MySensors mysNode;
// ------------------------ END MySensors---------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#include <Adafruit_NeoPixelBusEsp8266DMA.h>
#include <WS2812FX.h>

//#define INVERSE_SENSOR_LOGIC
// max led count that this node can take - this doesn't reflect the real number
// using this approach to avoid dynamic allocations
#define MAX_LED_COUNT 300

#ifndef LED_STRIP_DATA_PIN
#define LED_STRIP_DATA_PIN  D3
#endif

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

const float LED_STRIP_UPDATE_INTERVAL_S = 0.02; // 20ms

Ticker ledStripUpdateTicker;

WS2812FX ws2812fx(MAX_LED_COUNT, LED_STRIP_DATA_PIN);
// -----------------------------------------------------------------------------

// -------------------------- BATTERY LEVEL REPORTING --------------------------
const float VDD_VOLTAGE_MV = 3300.0;
const float BATTER_LVL_REPORT_INTERVAL_S = 300.0; // 5 mins

Ticker batteryLevelReportTicker;
// -----------------------------------------------------------------------------

// ------------------------------ RSSI REPORTING -------------------------------
const float RSSI_LVL_REPORT_INTERVAL_S = 600.0; // 10 mins

Ticker signalLevelReportTicker;
// -----------------------------------------------------------------------------

// ------------------------- SENSORS STATE REPORTING ---------------------------
const float SENSOR_STATE_REPORT_INTERVAL_S = 180.0; // 3 mins

Ticker sensorStateReportTicker;
// -----------------------------------------------------------------------------

// ------------------------ LED SIGNALING --------------------------------------
#if defined(HAS_BTN_LED) && ! defined(BTN_LED_PIN)
#define BTN_LED_PIN	D5
#endif

#define INVERSE_LED_LOGIC
#ifndef LED_SIGNAL_PIN
#define LED_SIGNAL_PIN  BUILTIN_LED
#endif
const float NOT_CONNECTED_SIGNALING_INTERVAL_S = 0.3; // 300 ms

Ticker noTransportLedTicker;
// -----------------------------------------------------------------------------

// --------------------- ERASE CONFIG BUTTON -----------------------------------
//#define ERASE_CFG_BTN_INVERSE_LOGIC
#ifndef ERASE_CONFIG_BTN_PIN
#define ERASE_CONFIG_BTN_PIN  D1
#endif
// -----------------------------------------------------------------------------

// --------------------- LED STRIP CTRL BUTTON -----------------------------------
//#define LED_STRIP_CTRL_BTN_INVERSE_LOGIC
const uint8_t LED_STRIP_CTRL_BTN = ERASE_CONFIG_BTN_PIN;
const float LED_STRIP_CTRL_BTN_CHECK_INTERVAL_S = 0.1; // 100 ms

Ticker ledStripCtrlBtnCheckTicker;
// -----------------------------------------------------------------------------

// ----------------------------- OTA -------------------------------------------
#ifndef HOSTNAME
#define HOSTNAME  AP_SSID
#endif
#ifndef OTA_PORT
#define OTA_PORT 8266
#endif
static bool otaInProgress = false;
// -----------------------------------------------------------------------------

uint8_t loadState(uint8_t index) {
  return MySensorsEEPROM::hwReadConfig(index);
}

void saveState(uint8_t index, uint8_t value) {
  MySensorsEEPROM::hwWriteConfig(index, value);
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
  uint8_t brightnessSetting =
      loadState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setBrightness(((brightnessSetting >= BRIGHTNESS_MIN_VALUE) &&
                          (brightnessSetting <= BRIGHTNESS_MAX_VALUE))
                             ? brightnessSetting
                             : BRIGHTNESS_DEFAULT_VALUE);

  uint8_t speedSetting = loadState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setSpeed(
      ((speedSetting >= SPEED_MIN_VALUE) && (speedSetting <= SPEED_MAX_VALUE))
          ? speedSetting
          : SPEED_DEFAULT_VALUE);

  uint8_t modeSetting = loadState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setMode(((modeSetting >= MODE_MIN_VALUE) &&
                    (modeSetting <= ws2812fx.getModeCount()))
                       ? modeSetting
                       : MODE_DEFAULT_VALUE);

  uint8_t R_FieldColorSetting =
      loadState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID);
  uint8_t G_FieldColorSetting =
      loadState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID);
  uint8_t B_FieldColorSetting =
      loadState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID);
  ws2812fx.setColor(((R_FieldColorSetting >= R_COLOR_FIELD_MIN_VALUE) &&
                     (R_FieldColorSetting <= R_COLOR_FIELD_MAX_VALUE))
                        ? R_FieldColorSetting
                        : R_COLOR_FIELD_DEFAULT_VALUE,
                    ((G_FieldColorSetting >= G_COLOR_FIELD_MIN_VALUE) &&
                     (G_FieldColorSetting <= G_COLOR_FIELD_MAX_VALUE))
                        ? G_FieldColorSetting
                        : G_COLOR_FIELD_DEFAULT_VALUE,
                    ((B_FieldColorSetting >= B_COLOR_FIELD_MIN_VALUE) &&
                     (B_FieldColorSetting <= B_COLOR_FIELD_MAX_VALUE))
                        ? B_FieldColorSetting
                        : B_COLOR_FIELD_DEFAULT_VALUE);
  ws2812fx.trigger();
}

void sendLedStripState() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  snprintf(
    reply,
    MQTT_MAX_PAYLOAD_LENGTH,
    "%02x%02x%02x",
    (uint8_t)((ws2812fx.getColor() & 0x00FF0000) >> 16),
    (uint8_t)((ws2812fx.getColor() & 0x0000FF00) >> 8),
    (uint8_t)((ws2812fx.getColor() & 0x000000FF) >> 0)
  );
  mysNode.send(RGB_SENSOR_ID, V_RGB, reply);

  uint8_t currentLedStripBrightness =
    round((ws2812fx.getBrightness() * 100.0) / BRIGHTNESS_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripBrightness);
  mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);

  uint8_t currentLedStripSpeed =
    round((ws2812fx.getSpeed() * 100.0) / SPEED_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripSpeed);
  mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);

  uint8_t currentLedStripMode = ws2812fx.getMode();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripMode);
  mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);

  uint8_t currentLedStripState = ws2812fx.isRunning();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripState);
  mysNode.send(RGB_SENSOR_ID, V_STATUS, reply);
}

void ledStripUpdate() {
  if (ws2812fx.isRunning()) {
    ws2812fx.service();
  }
}

void ledStripStart() {
  ws2812fx.start();
  ledStripUpdateTicker.detach();
  ledStripUpdateTicker.attach(LED_STRIP_UPDATE_INTERVAL_S, ledStripUpdate);
}

void ledStripStop() {
  ledStripUpdateTicker.detach();
  ws2812fx.stop();
  digitalWrite(LED_STRIP_DATA_PIN, LOW);
}

void ledStripInit(CfgData& cfgData, bool start = false) {
  // led strip init
  // very important - set led count and pixel buffer first
  uint16_t ledCount = (uint16_t)atoi(cfgData.mys_node_led_count);
#ifdef DEBUG
  DEBUG_OUTPUT.printf("We have %d leds ...\r\n", ledCount);
#endif
  ws2812fx.setLedCount(ledCount);
  ws2812fx.init();

  // load rgb led strip saved settings
  loadRGBLedStripSavedSettings();

  if(!start) {
    // start led strip in OFF state
    ledStripStop();
  } else {
    ledStripStart();
  }
}

CfgData& loadConfig(const char *cfgFilePath) {
  static CfgData data;

  if (SPIFFS.begin()) {
    if (SPIFFS.exists(cfgFilePath)) {
      File configFile = SPIFFS.open(cfgFilePath, "r");
      if (configFile) {
      // read config file
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file found!");
      #endif
        size_t cfgFileSize = configFile.size();
        // Allocate a buffer to store contents of the file.
        char* buff = (char*)malloc(cfgFileSize * sizeof(char));
        if(buff) {
          memset(buff, '\0', cfgFileSize);
          configFile.readBytes(buff, cfgFileSize);
        }
        configFile.close();

        DynamicJsonBuffer jsonBuffer;
        JsonObject &json = jsonBuffer.parseObject(buff);
      #ifdef DEBUG
        json.printTo(DEBUG_OUTPUT);
        DEBUG_OUTPUT.println();
      #endif

        strncpy(data.mqtt_server, json["mqtt_server"], MQTT_SERVER_FIELD_MAX_LEN);
        strncpy(data.mqtt_user, json["mqtt_user"], MQTT_USER_FIELD_MAX_LEN);
        strncpy(data.mqtt_passwd, json["mqtt_passwd"], MQTT_PASS_FIELD_MAX_LEN);
        strncpy(data.mqtt_port, json["mqtt_port"], MQTT_PORT_FIELD_MAX_LEN);
        strncpy(data.mqtt_in_topic_prefix, json["mqtt_in_topic_prefix"],
          MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
        );
        strncpy(data.mqtt_out_topic_prefix, json["mqtt_out_topic_prefix"],
          MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
        );
        strncpy(data.mys_node_id, json["mys_node_id"], MYS_NODE_ID_FIELD_MAX_LEN);
        strncpy(data.mys_node_alias, json["mys_node_alias"],
          MYS_NODE_ALIAS_FIELD_MAX_LEN
        );
        strncpy(data.mys_node_led_count, json["mys_node_led_count"],
          MYS_NODE_LED_COUNT_FIELD_MAX_LEN
        );

        // free dynamically allocated buffer for config file contents
        if(buff) {
          free(buff);
        }
      } else {
      // config file couldn't be opened
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file couldn't be opened!");
      #endif
      }
    } else {
    // config file not found start portal
    #ifdef DEBUG
      DEBUG_OUTPUT.println("Config file wasn't found!");
    #endif
    }
    SPIFFS.end();
  } else {
  // fail to mount spiffs
  #ifdef DEBUG
    DEBUG_OUTPUT.println("SPIFFS mount failed!");
  #endif
  }

  return data;
}

void saveConfig(const char *cfgFilePath, CfgData &data) {
  if (SPIFFS.begin()) {
    if (SPIFFS.exists(cfgFilePath)) {
      File configFile = SPIFFS.open(cfgFilePath, "w");
      if (configFile) {
      // read config file
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file found!");
      #endif

        DynamicJsonBuffer jsonBuffer;
        JsonObject &json = jsonBuffer.createObject();

        json["mqtt_server"] = data.mqtt_server;
        json["mqtt_user"] = data.mqtt_user;
        json["mqtt_passwd"] = data.mqtt_passwd;
        json["mqtt_port"] = data.mqtt_port;
        json["mqtt_in_topic_prefix"] = data.mqtt_in_topic_prefix;
        json["mqtt_out_topic_prefix"] = data.mqtt_out_topic_prefix;
        json["mys_node_id"] = data.mys_node_id;
        json["mys_node_alias"] = data.mys_node_alias;
        json["mys_node_led_count"] = data.mys_node_led_count;

        json.printTo(configFile);
        configFile.close();
      } else {
      // config file couldn't be opened
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file couldn't be opened!");
      #endif
      }
    } else {
    // config file not found start portal
    #ifdef DEBUG
      DEBUG_OUTPUT.println("Config file wasn't found!");
    #endif
    }
    SPIFFS.end();
  } else {
  // fail to mount spiffs
  #ifdef DEBUG
    DEBUG_OUTPUT.println("SPIFFS mount failed!");
  #endif
  }
}

// callback notifying us of the need to save config
void saveConfigCallback() {
  needToSaveConfig = true;
}

void startWiFiConfig(CfgData &cfgData, bool forciblyStart = false) {
  // custom parameters
  AsyncWiFiManagerParameter  mqtt_header_text("<br/><b>MQTT</b><br/><br/>");
  AsyncWiFiManagerParameter  custom_mqtt_server(
    "broker",
    "Broker",
    cfgData.mqtt_server,
    MQTT_SERVER_FIELD_MAX_LEN
  );
  AsyncWiFiManagerParameter  custom_mqtt_server_user(
    "user",
    "User",
    cfgData.mqtt_user,
    MQTT_USER_FIELD_MAX_LEN
  );
  AsyncWiFiManagerParameter  custom_mqtt_server_passwd(
    "password",
    "Password",
    cfgData.mqtt_passwd,
    MQTT_PASS_FIELD_MAX_LEN
  );
  AsyncWiFiManagerParameter  custom_mqtt_port(
    "port",
    "Port",
    cfgData.mqtt_port,
    MQTT_PORT_FIELD_MAX_LEN,
    "min=\"1\" max=\"65535\""
  );
  AsyncWiFiManagerParameter  custom_mqtt_in_topic_prefix(
    "in_topic_prefix",
    "IN Topic Prefix",
    cfgData.mqtt_in_topic_prefix,
    MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
  );
  AsyncWiFiManagerParameter  custom_mqtt_out_topic_prefix(
    "out_topic_prefix",
    "OUT Topic Prefix",
    cfgData.mqtt_out_topic_prefix,
    MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
  );

  AsyncWiFiManagerParameter  mys_header_text("<br/><br/><b>MySensors</b><br/><br/>");
  AsyncWiFiManagerParameter  custom_mys_node_id(
    "node_id",
    "ID",
    cfgData.mys_node_id,
    MYS_NODE_ID_FIELD_MAX_LEN,
    "min=\"1\" max=\"254\""
  );
  AsyncWiFiManagerParameter  custom_mys_node_alias(
    "node_alias",
    "Alias",
    cfgData.mys_node_alias,
    MYS_NODE_ALIAS_FIELD_MAX_LEN
  );
  AsyncWiFiManagerParameter  custom_mys_node_led_count(
    "node_led_count",
    "LEDs",
    cfgData.mys_node_led_count,
    MYS_NODE_LED_COUNT_FIELD_MAX_LEN,
    "min=\"1\" max=\"" STRINGIFY(MAX_LED_COUNT) "\""
  );

  AsyncWiFiManager wifiManager(&server, &dns);
  wifiManager.setSaveConfigCallback(saveConfigCallback);

  wifiManager.addParameter(&mqtt_header_text);
  wifiManager.addParameter(&custom_mqtt_server);
  wifiManager.addParameter(&custom_mqtt_server_user);
  wifiManager.addParameter(&custom_mqtt_server_passwd);
  wifiManager.addParameter(&custom_mqtt_port);
  wifiManager.addParameter(&custom_mqtt_in_topic_prefix);
  wifiManager.addParameter(&custom_mqtt_out_topic_prefix);

  wifiManager.addParameter(&mys_header_text);
  wifiManager.addParameter(&custom_mys_node_id);
  wifiManager.addParameter(&custom_mys_node_alias);
  wifiManager.addParameter(&custom_mys_node_led_count);

  if (forciblyStart) {
#ifdef DEBUG
    DEBUG_OUTPUT.println(
      "Resetting settings and forcing WiFi config portal to start ..."
    );
#endif
    wifiManager.resetSettings();
  }

#ifdef DEBUG
  DEBUG_OUTPUT.printf(
    "Starting WiFi autoconfig portal with %lus timeout...\r\n",
    CFG_PORTAL_TIMEOUT_S
  );
#endif
  wifiManager.setTimeout(CFG_PORTAL_TIMEOUT_S);
  //wifiManager.setConnectTimeout(60);
  wifiManager.setBreakAfterConfig(true); // we want settings saved even if connection to new AP was unsuccessful
  if (!wifiManager.autoConnect(AP_SSID, AP_PASSWD)) {
#ifdef DEBUG
    DEBUG_OUTPUT.println(
      "Failed to connect and configuration portal timeout was reached, rebooting ..."
    );
#endif
    delay(1000);
    // reset and try again, or maybe put it to deep sleep
    //ESP.restart();
  }

  if (needToSaveConfig) {
    #ifdef DEBUG
        DEBUG_OUTPUT.println("Configuration changed need to save it!");
    #endif

      strncpy(
        cfgData.mqtt_server,
        custom_mqtt_server.getValue(),
        MQTT_SERVER_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mqtt_user,
        custom_mqtt_server_user.getValue(),
        MQTT_USER_FIELD_MAX_LEN);
      strncpy(
        cfgData.mqtt_passwd,
        custom_mqtt_server_passwd.getValue(),
        MQTT_PASS_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mqtt_port,
        custom_mqtt_port.getValue(),
        MQTT_PORT_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mqtt_in_topic_prefix,
        custom_mqtt_in_topic_prefix.getValue(),
        MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mqtt_out_topic_prefix,
        custom_mqtt_out_topic_prefix.getValue(),
        MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mys_node_id,
        custom_mys_node_id.getValue(),
        MYS_NODE_ID_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mys_node_alias,
        custom_mys_node_alias.getValue(),
        MYS_NODE_ALIAS_FIELD_MAX_LEN
      );
      strncpy(
        cfgData.mys_node_led_count,
        custom_mys_node_led_count.getValue(),
        MYS_NODE_LED_COUNT_FIELD_MAX_LEN
      );

      // save new cfg data
      saveConfig(CONFIG_FILE, cfgData);
      ESP.restart();
  }
}

void onMessage(MySensorMsg &message) {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  if (message.cmd_type == M_SET) {
    if (strlen(message.payload) > 0) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf(
        "Received M_SET command with value: %s\r\n",
        message.payload
      );
    #endif
      if (message.sub_type == V_RGB) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        ws2812fx.setColor(strtoul(message.payload, NULL, 16));
        ws2812fx.trigger();
        mysNode.send(RGB_SENSOR_ID, V_RGB, message.payload);
      } else if (message.sub_type == V_LIGHT_LEVEL) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t brightnessPercentage = (uint16_t)atoi(message.payload);
        if ((brightnessPercentage >= 0) && (brightnessPercentage <= 100)) {
          ws2812fx.setBrightness(
            round((brightnessPercentage * BRIGHTNESS_MAX_VALUE) / 100.0)
          );
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", brightnessPercentage);
          mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);
        }
      } else if (message.sub_type == V_PERCENTAGE) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t speedPercentage = (uint16_t)atoi(message.payload);
        if ((speedPercentage >= 0) && (speedPercentage <= 100)) {
          ws2812fx.setSpeed(round((speedPercentage * SPEED_MAX_VALUE) / 100.0));
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", speedPercentage);
          mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);
        }
      } else if (message.sub_type == V_CUSTOM) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t modeSetting = (uint16_t)atoi(message.payload);
        if ((modeSetting >= MODE_MIN_VALUE) &&
            (modeSetting < ws2812fx.getModeCount())) {
          ws2812fx.setMode(modeSetting);
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", modeSetting);
          mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);
        }
      } else if (message.sub_type == V_STATUS) {
        uint16_t newLedStripState = (uint16_t)atoi(message.payload);
        if ((newLedStripState == OFF) && (ws2812fx.isRunning())) {
          // get current brightness/color settings for saving them later
          uint8_t previousLedStripBrightness = ws2812fx.getBrightness();
          uint32_t previousLedStripColor = ws2812fx.getColor();

          // turn OFF rgb led strip
          ledStripStop();
    		  #ifdef HAS_BTN_LED
    		  digitalWrite(BTN_LED_PIN, HIGH);
    		  #endif

          saveRGBLedStripCurrentSettings(
            previousLedStripBrightness,
            ws2812fx.getSpeed(),
            ws2812fx.getMode(),
            previousLedStripColor
          );
        }

        if ((newLedStripState == ON) && (!ws2812fx.isRunning())) {
          // load rgb led strip saved settings
          loadRGBLedStripSavedSettings();
          ledStripStart();
    		  #ifdef HAS_BTN_LED
    		  digitalWrite(BTN_LED_PIN, LOW);
    		  #endif
        }
      }
      sendLedStripState();
    }
  }
}

void checkTransportConnection() {
  if (!mysNode.connected()) {
    digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
  } else {
    // make sure led is off when connected
    digitalWrite(LED_SIGNAL_PIN,
  #ifdef INVERSE_LED_LOGIC
      HIGH
  #else
      LOW
  #endif
    );
  }
}

void sendBatteryLevel() {
  uint8_t vccPercent = constrain(
    round((ESP.getVcc() * 100.0) / VDD_VOLTAGE_MV),
    0,
    100
  );
#ifdef DEBUG
  DEBUG_OUTPUT.printf("Sending system voltage level: %d%%\r\n", vccPercent);
#endif
  mysNode.send_battery_level(vccPercent);
}

void sendRSSILevel() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];
// mycontroller supports this for now
#ifdef DEBUG
  DEBUG_OUTPUT.printf("Sending RSSI level: %d ...\r\n", WiFi.RSSI());
#endif
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "rssi:%d dBm", WiFi.RSSI());
  mysNode.send(1, V_VAR5, reply);
}

void sendSensorState() {
  sendLedStripState();
}

void sendReports() {
  sendSensorState();
  sendBatteryLevel();
  sendRSSILevel();
}

void checkLedStripBtn() {
  static uint32_t stillPressedCounter = 0;

#ifdef LED_STRIP_CTRL_BTN_INVERSE_LOGIC
  if(digitalRead(ERASE_CONFIG_BTN_PIN)) {
#else
  if(!digitalRead(ERASE_CONFIG_BTN_PIN)) {
#endif
    if(stillPressedCounter++ > 0) {
      return;
    }
    if(ws2812fx.isRunning()) {
      // turn OFF rgb led strip if it was running before
      ledStripStop();
	  #ifdef HAS_BTN_LED
	  digitalWrite(BTN_LED_PIN, HIGH);
	  #endif
    } else {
      ledStripStart();
	  #ifdef HAS_BTN_LED
	  digitalWrite(BTN_LED_PIN, LOW);
	  #endif
    }
    if(mysNode.connected()) {
      sendLedStripState();
    }
  } else {
    stillPressedCounter = 0;
  }
}

void portsConfig() {
  #ifdef HAS_BTN_LED
  pinMode(BTN_LED_PIN, OUTPUT);
  digitalWrite(BTN_LED_PIN, HIGH);
  #endif
  pinMode(LED_SIGNAL_PIN, OUTPUT);
  pinMode(ERASE_CONFIG_BTN_PIN,
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    INPUT
  #else
    INPUT_PULLUP
  #endif
  );

  pinMode(LED_STRIP_CTRL_BTN,
  #ifdef LED_STRIP_CTRL_BTN_INVERSE_LOGIC
    INPUT
  #else
    INPUT_PULLUP
  #endif
  );

  digitalWrite(LED_SIGNAL_PIN,
  #ifdef INVERSE_LED_LOGIC
    HIGH
  #else
    LOW
  #endif
  );

  ledStripCtrlBtnCheckTicker.detach();
  ledStripCtrlBtnCheckTicker.attach(
    LED_STRIP_CTRL_BTN_CHECK_INTERVAL_S,
    checkLedStripBtn
  );
}

void nodeConfig(CfgData& cfgData) {
  // transport connection signaling
  // enabling this before AsyncWiFiManager in order to have visual feedback ASAP
  noTransportLedTicker.detach();
  noTransportLedTicker.attach(
    NOT_CONNECTED_SIGNALING_INTERVAL_S,
    checkTransportConnection
  );

#ifdef DEBUG
  DEBUG_OUTPUT.println();
  DEBUG_OUTPUT.println("=== CONFIG FILE DATA ===");
  DEBUG_OUTPUT.print("MQTT SERVER: ");
  DEBUG_OUTPUT.println(cfgData.mqtt_server);
  DEBUG_OUTPUT.print("MQTT USER: ");
  DEBUG_OUTPUT.println(cfgData.mqtt_user);
  DEBUG_OUTPUT.print("MQTT PASSWORD: ");
  DEBUG_OUTPUT.println(cfgData.mqtt_passwd);
  DEBUG_OUTPUT.print("MQTT PORT: ");
  DEBUG_OUTPUT.println(cfgData.mqtt_port);
#endif

  // pressing erase config button and then pressing-releasing the reset button
  //  will erase wifi data and starts on demand portal
  // get reset cause first
  bool isExternalReset = (ESP.getResetInfoPtr()->reason == REASON_EXT_SYS_RST);
  startWiFiConfig(cfgData,
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    isExternalReset && digitalRead(ERASE_CONFIG_BTN_PIN),
  #else
    isExternalReset && !digitalRead(ERASE_CONFIG_BTN_PIN)
  #endif
  );
}

void mySensorsInit(CfgData& cfgData) {
  mysNode.begin(
    atoi(cfgData.mys_node_id),
    cfgData.mys_node_alias,
    CHILD_TYPES,
    CHILD_ALIASES,
    SENSOR_COUNT,
    cfgData.mqtt_server,
    cfgData.mqtt_user,
    cfgData.mqtt_passwd,
    atoi(cfgData.mqtt_port),
    cfgData.mqtt_in_topic_prefix,
    cfgData.mqtt_out_topic_prefix
  );
  mysNode.on_message(onMessage);
}

void reportersInit() {
  batteryLevelReportTicker.detach();
  batteryLevelReportTicker.attach(
    BATTER_LVL_REPORT_INTERVAL_S,
    sendBatteryLevel
  );
  signalLevelReportTicker.detach();
  signalLevelReportTicker.attach(
    RSSI_LVL_REPORT_INTERVAL_S,
    sendRSSILevel
  );
  sensorStateReportTicker.detach();
  sensorStateReportTicker.attach(
    SENSOR_STATE_REPORT_INTERVAL_S,
    sendSensorState
  );
}

void disableReporters() {
  batteryLevelReportTicker.detach();
  signalLevelReportTicker.detach();
  sensorStateReportTicker.detach();
}

void disableLedStripControlTickers() {
  ledStripUpdateTicker.detach();
  ledStripCtrlBtnCheckTicker.detach();
}

void otaInit() {
  ArduinoOTA.setHostname(HOSTNAME);
  ArduinoOTA.setPort(OTA_PORT);
#if PLATFORM_VERSION >= 10600
  ArduinoOTA.setRebootOnSuccess(true);
#endif

  ArduinoOTA.onStart([]() {
  #if PLATFORM_VERSION >= 10600
    if (ArduinoOTA.getCommand() == U_FLASH) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println("Start updating flash ...");
    #endif
    } else {
    #ifdef DEBUG
      DEBUG_OUTPUT.println("Start updating filesystem (SPIFFS) ...");
    #endif
      // Unmount SPIFFS using SPIFFS.end() first
      SPIFFS.end();
    }
  #endif
    otaInProgress = true;
  });
  ArduinoOTA.onEnd([]() {
  #ifdef DEBUG
    DEBUG_OUTPUT.println("\nOTA finished.");
  #endif
    otaInProgress = false;
  });
  ArduinoOTA.onProgress([](uint16_t progress, uint16_t total) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Progress: %u%%\r", (progress / (total / 100)));
  #endif
    otaInProgress = true;
  });
  ArduinoOTA.onError([](ota_error_t error) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) DEBUG_OUTPUT.println("Auth Failed");
    else if (error == OTA_BEGIN_ERROR) DEBUG_OUTPUT.println("Begin Failed");
    else if (error == OTA_CONNECT_ERROR) DEBUG_OUTPUT.println("Connect Failed");
    else if (error == OTA_RECEIVE_ERROR) DEBUG_OUTPUT.println("Receive Failed");
    else if (error == OTA_END_ERROR) DEBUG_OUTPUT.println("End Failed");
  #endif
    ESP.restart();
  });

  ArduinoOTA.begin();
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  MySensorsEEPROM::hwInit();
  CfgData& cfgData = loadConfig(CONFIG_FILE);

  portsConfig();
  ledStripInit(cfgData);
  nodeConfig(cfgData);
  mySensorsInit(cfgData);
  reportersInit();
  otaInit();

  // send initial reports on node startup
  if (mysNode.connected()) {
    sendReports();
  }
}

void loop() {
  ArduinoOTA.handle();

  if(!otaInProgress) {
    mysNode.loop();

    static bool needToSendReports = false;
    if (!mysNode.connected()) {
      needToSendReports = true;
    }

    if (mysNode.connected() && needToSendReports) {
      // send reports on node reconnection
      sendReports();
      needToSendReports = false;
    }
  } else {
    disableReporters();
    disableLedStripControlTickers();
    ledStripStop();
  }
}
