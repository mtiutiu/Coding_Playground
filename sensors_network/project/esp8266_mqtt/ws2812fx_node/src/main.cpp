//#define DEBUG

#ifdef DEBUG
#define SERIAL_DEBUG_BAUDRATE 115200
#endif

#define STRINGIFY(a) str(a)
#define str(a) #a

#include <Arduino.h>
#include <FS.h>
#include <ESP8266WiFi.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
#include <ArduinoJson.h>
#include <Ticker.h>

// enable reading of Vcc
ADC_MODE(ADC_VCC);

// ------------------------ Module CONFIG --------------------------------------
#define AP_SSID "WS2812FXController"
#define AP_PASSWD "test1234"
#define CFG_PORTAL_TIMEOUT_S 60UL
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

// flag for saving data
bool configurationUpdated = false;
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensor.h>
#include <MySensorsEEPROM.h>

const uint8_t RGB_SENSOR_ID = 1;
const uint8_t SENSOR_COUNT = 1;
const uint8_t CHILD_TYPES[SENSOR_COUNT] = {S_RGB_LIGHT};
const uint8_t CHILD_SUBTYPES[SENSOR_COUNT] = {V_RGB};
const char *CHILD_ALIASES[SENSOR_COUNT] = {"RGB"};

MySensor mysNode;
// ------------------------ END MySensors---------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#include <WS2812FX.h>

//#define INVERSE_SENSOR_LOGIC
// max led count that this node can take - this doesn't reflect the real number
// using this approach to avoid dynamic allocations
#define MAX_LED_COUNT 300
uint8_t pix_buff[MAX_LED_COUNT * 3];

const uint8_t LED_STRIP_DATA_PIN = D15;

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

const float LED_STRIP_UPDATE_INTERVAL_S = 0.05; // 50ms

Ticker ledStripUpdateTicker;

// we don't know the number of leds here so pass 0 and NULL for pixels buffer
// later we call setPixels from the Adafruit Neopixel modified library
WS2812FX ws2812fx = WS2812FX(0, LED_STRIP_DATA_PIN, NEO_GRB + NEO_KHZ800, NULL);
// -----------------------------------------------------------------------------

// -------------------------- BATTERY LEVEL REPORTING --------------------------
const float VDD_VOLTAGE_MV = 3000.0;
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
#define INVERSE_LED_LOGIC
const uint8_t LED_SIGNAL_PIN = BUILTIN_LED;
const float NOT_CONNECTED_SIGNALING_INTERVAL_S = 0.3; // 300 ms

Ticker noTransportLedTicker;
// -----------------------------------------------------------------------------

// --------------------- ERASE CONFIG BUTTON -----------------------------------
//#define ERASE_CFG_BTN_INVERSE_LOGIC
const uint8_t ERASE_CONFIG_BTN_PIN = D14;
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
  // wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripBrightness =
    round((ws2812fx.getBrightness() * 100.0) / BRIGHTNESS_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripBrightness);
  mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);
  // wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripSpeed =
    round((ws2812fx.getSpeed() * 100.0) / SPEED_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripSpeed);
  mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);
  // wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripMode = ws2812fx.getMode();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripMode);
  mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);
  // wait(SUCCESSIVE_SENSOR_DATA_SEND_DELAY_MS);

  uint8_t currentLedStripState = ws2812fx.isRunning();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripState);
  mysNode.send(RGB_SENSOR_ID, V_STATUS, reply);
}

// callback notifying us of the need to save config
void saveConfigCallback() {
  configurationUpdated = true;
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

        size_t size = configFile.size();
        // Allocate a buffer to store contents of the file.
        std::unique_ptr<char[]> buf(new char[size]);
        configFile.readBytes(buf.get(), size);
        configFile.close();

        StaticJsonBuffer<512> jsonBuffer;
        JsonObject &json = jsonBuffer.parseObject(buf.get());
      #ifdef DEBUG
        json.printTo(Serial);
        Serial.println();
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

        StaticJsonBuffer<512> jsonBuffer;
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

void onWiFiConfigPostHook(CfgData& cfgData) {
  // update led strip data after wifi config finished
  // led strip init
  // very important - set led count and pixel buffer first
  uint16_t ledCount = (uint16_t)atoi(cfgData.mys_node_led_count);
#ifdef DEBUG
  Serial.printf("We have %d leds ...\r\n", ledCount);
#endif
  ws2812fx.setPixels(ws2812fx.setLedCount(ledCount), pix_buff);
  ws2812fx.init();
}

void startWiFiConfig(CfgData &cfgData, bool forciblyStart = false,
                      cb wifiPostConfigCallback = NULL) {
  // custom parameters
  WiFiManagerParameter mqtt_header_text("<br/><b>MQTT</b>");
  WiFiManagerParameter custom_mqtt_server(
    "server",
    "mqtt server",
    cfgData.mqtt_server,
    MQTT_SERVER_FIELD_MAX_LEN
  );
  WiFiManagerParameter custom_mqtt_server_user(
    "user",
    "mqtt user",
    cfgData.mqtt_user,
    MQTT_USER_FIELD_MAX_LEN
  );
  WiFiManagerParameter custom_mqtt_server_passwd(
    "passwd",
    "mqtt passwd",
    cfgData.mqtt_passwd,
    MQTT_PASS_FIELD_MAX_LEN
  );
  WiFiManagerParameter custom_mqtt_port(
    "port",
    "mqtt port",
    cfgData.mqtt_port,
    MQTT_PORT_FIELD_MAX_LEN,
    "min=\"1\" max=\"65535\""
  );
  WiFiManagerParameter custom_mqtt_in_topic_prefix(
    "in_topic_prefix",
    "mqtt in topic prefix",
    cfgData.mqtt_in_topic_prefix,
    MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
  );
  WiFiManagerParameter custom_mqtt_out_topic_prefix(
    "out_topic_prefix",
    "mqtt out topic prefix",
    cfgData.mqtt_out_topic_prefix,
    MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
  );

  WiFiManagerParameter mys_header_text("<br/><br/><b>MySensors</b>");
  WiFiManagerParameter custom_mys_node_id(
    "node_id",
    "node id",
    cfgData.mys_node_id,
    MYS_NODE_ID_FIELD_MAX_LEN,
    "min=\"1\" max=\"254\""
  );
  WiFiManagerParameter custom_mys_node_alias(
    "node_alias",
    "node alias",
    cfgData.mys_node_alias,
    MYS_NODE_ALIAS_FIELD_MAX_LEN
  );
  WiFiManagerParameter custom_mys_node_led_count(
    "node_led_count",
    "led count",
    cfgData.mys_node_led_count,
    MYS_NODE_LED_COUNT_FIELD_MAX_LEN,
    "min=\"1\" max=\"" STRINGIFY(MAX_LED_COUNT) "\""
  );

  WiFiManager wifiManager;
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
  if (!wifiManager.autoConnect(AP_SSID, AP_PASSWD)) {
#ifdef DEBUG
    DEBUG_OUTPUT.println(
      "Failed to connect and configuration portal timeout was reached, rebooting ..."
    );
#endif
    // fail to connect
    delay(1000);
    // reset and try again, or maybe put it to deep sleep
    ESP.restart();
  }

  if (configurationUpdated) {
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

    if(wifiPostConfigCallback) {
      wifiPostConfigCallback(cfgData);
    }

    configurationUpdated = false;
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
          ws2812fx.stop();
          digitalWrite(LED_STRIP_DATA_PIN, LOW);

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
          ws2812fx.start();
          sendLedStripState();
        }
      }
    }
  }

  /*if(message.cmd_type == M_REQ) {
  #ifdef DEBUG
    DEBUG_OUTPUT.println("Received M_REQ command");
  #endif
  }*/
}

void checkTransportConnection() {
  if (!mysNode.connected()) {
    digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
  }

// make sure signaling led is off if transport is connected
#ifdef INVERSE_LED_LOGIC
  if (mysNode.connected() && !digitalRead(LED_SIGNAL_PIN)) {
    digitalWrite(LED_SIGNAL_PIN, HIGH);
  }
#else
  if (mysNode.connected() && digitalRead(LED_SIGNAL_PIN)) {
    digitalWrite(LED_SIGNAL_PIN, LOW);
  }
#endif
}

void sendBatteryLevel() {
  uint8_t vccPercent = round((ESP.getVcc() * 100.0) / VDD_VOLTAGE_MV);
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

void ledStripUpdate() {
  if (ws2812fx.isRunning()) {
    ws2812fx.service();
  }
}

void portsConfig() {
  pinMode(LED_SIGNAL_PIN, OUTPUT);
  pinMode(ERASE_CONFIG_BTN_PIN,
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
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
}

void ledStripInit(CfgData& cfgData) {
  // led strip init
  // very important - set led count and pixel buffer first
  uint16_t ledCount = (uint16_t)atoi(cfgData.mys_node_led_count);
#ifdef DEBUG
  Serial.printf("We have %d leds ...\r\n", ledCount);
#endif
  ws2812fx.setPixels(ws2812fx.setLedCount(ledCount), pix_buff);
  ws2812fx.init();

  // load rgb led strip saved settings
  loadRGBLedStripSavedSettings();

  // start led strip in OFF state
  ws2812fx.stop();
  digitalWrite(LED_STRIP_DATA_PIN, LOW);

  ledStripUpdateTicker.attach(LED_STRIP_UPDATE_INTERVAL_S, ledStripUpdate);
}

void nodeConfig(CfgData& cfgData) {
  // transport connection signaling
  // enabling this before WiFiManager in order to have visual feedback ASAP
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
    isExternalReset && !digitalRead(ERASE_CONFIG_BTN_PIN),
  #endif
    onWiFiConfigPostHook
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
  batteryLevelReportTicker.attach(
    BATTER_LVL_REPORT_INTERVAL_S,
    sendBatteryLevel
  );
  signalLevelReportTicker.attach(
    RSSI_LVL_REPORT_INTERVAL_S,
    sendRSSILevel
  );
  sensorStateReportTicker.attach(
    SENSOR_STATE_REPORT_INTERVAL_S,
    sendSensorState
  );
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

  // send initial reports on node startup
  if (mysNode.connected()) {
    sendReports();
  }
}

void loop() {
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
}
