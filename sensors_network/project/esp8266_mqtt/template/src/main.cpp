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
#include <WiFiManager.h>
#include <ArduinoOTA.h>
#include <ArduinoJson.h>
#include <Ticker.h>

WiFiManager wifiManager;

// enable reading of Vcc
ADC_MODE(ADC_VCC);

// ------------------------ Module CONFIG --------------------------------------
#ifndef AP_SSID
#define AP_SSID "ESPController"
#endif
#ifndef AP_PASSWD
#define AP_PASSWD "test1234"
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

typedef struct {
  char mqtt_server[MQTT_SERVER_FIELD_MAX_LEN];
  char mqtt_user[MQTT_USER_FIELD_MAX_LEN];
  char mqtt_passwd[MQTT_PASS_FIELD_MAX_LEN];
  char mqtt_port[MQTT_PORT_FIELD_MAX_LEN];
  char mqtt_in_topic_prefix[MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mqtt_out_topic_prefix[MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mys_node_id[MYS_NODE_ID_FIELD_MAX_LEN];
  char mys_node_alias[MYS_NODE_ALIAS_FIELD_MAX_LEN];
} CfgData;

CfgData cfgData;
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
#define LED_SIGNAL_PIN  LED_BUILTIN
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

void loadConfig(const char *cfgFilePath, CfgData& data) {
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
  WiFiManagerParameter  mqtt_header_text("<br/><b>MQTT</b><br/>");
  WiFiManagerParameter  custom_mqtt_server(
    "broker",
    "Broker",
    cfgData.mqtt_server,
    MQTT_SERVER_FIELD_MAX_LEN
  );
  WiFiManagerParameter  custom_mqtt_server_user(
    "user",
    "User",
    cfgData.mqtt_user,
    MQTT_USER_FIELD_MAX_LEN
  );
  WiFiManagerParameter  custom_mqtt_server_passwd(
    "password",
    "Password",
    cfgData.mqtt_passwd,
    MQTT_PASS_FIELD_MAX_LEN
  );
  WiFiManagerParameter  custom_mqtt_port(
    "port",
    "Port",
    cfgData.mqtt_port,
    MQTT_PORT_FIELD_MAX_LEN,
    "min=\"1\" max=\"65535\""
  );
  WiFiManagerParameter  custom_mqtt_in_topic_prefix(
    "in_topic_prefix",
    "IN Topic Prefix",
    cfgData.mqtt_in_topic_prefix,
    MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
  );
  WiFiManagerParameter  custom_mqtt_out_topic_prefix(
    "out_topic_prefix",
    "OUT Topic Prefix",
    cfgData.mqtt_out_topic_prefix,
    MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
  );

  WiFiManagerParameter  mys_header_text("<br/><br/><b>MySensors</b><br/>");
  WiFiManagerParameter  custom_mys_node_id(
    "node_id",
    "ID",
    cfgData.mys_node_id,
    MYS_NODE_ID_FIELD_MAX_LEN,
    "min=\"1\" max=\"254\""
  );
  WiFiManagerParameter  custom_mys_node_alias(
    "node_alias",
    "Alias",
    cfgData.mys_node_alias,
    MYS_NODE_ALIAS_FIELD_MAX_LEN
  );

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

  if (forciblyStart) {
#ifdef DEBUG
    DEBUG_OUTPUT.println(
      "Resetting settings and forcing WiFi config portal to start ..."
    );
#endif
    wifiManager.resetSettings();
  }

  wifiManager.autoConnect(AP_SSID, AP_PASSWD);

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

      // save new cfg data
      saveConfig(CONFIG_FILE, cfgData);
      delay(1000);
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

}

void sendReports() {
  sendSensorState();
  sendBatteryLevel();
  sendRSSILevel();
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

void nodeConfig(CfgData& cfgData) {
  // transport connection signaling
  // enabling this before WiFiManager in order to have visual feedback ASAP
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

  mySensorsInit(cfgData);
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
  portsConfig();
  MySensorsEEPROM::hwInit();
  loadConfig(CONFIG_FILE, cfgData);

  nodeConfig(cfgData); // this blocks untill networking is configured and active

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
  }
}
