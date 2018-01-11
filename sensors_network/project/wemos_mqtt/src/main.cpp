//#define DEBUG

#ifdef DEBUG
#define SERIAL_DEBUG_BAUDRATE 115200
#endif

#include <Arduino.h>
#include <Ticker.h>

// enable reading of Vcc
ADC_MODE(ADC_VCC);

// ------------------------ Module CONFIG --------------------------------------
#include <FS.h>
#include <ESP8266WiFi.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>
#include <ArduinoJson.h>

#define AP_SSID "WaterValveController"
#define AP_PASSWD "test1234"
#define CFG_PORTAL_TIMEOUT_S  30UL
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
// flag for saving data
bool needToSaveConfig = false;
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensor.h>

const uint8_t SENSOR_COUNT = 1;
const uint8_t CHILD_TYPES[SENSOR_COUNT] = { S_BINARY };
const uint8_t CHILD_SUBTYPES[SENSOR_COUNT] = { V_STATUS };
const char* CHILD_ALIASES[SENSOR_COUNT] = { "Valve" };

MySensor mysNode;
// ------------------------ END MySensors---------------------------------------

// ------------------------ ACTUATOR -------------------------------------------
//#define INVERSE_LOGIC
const uint8_t RELAY_PINS[SENSOR_COUNT] = { D1 };
// -----------------------------------------------------------------------------

// -------------------------- BATTERY LEVEL REPORTING --------------------------
const float VDD_VOLTAGE_MV = 3000.0;
const float BATTER_LVL_REPORT_INTERVAL_S = 300.0;  // 5 mins

Ticker batteryLevelReportTicker;
// -----------------------------------------------------------------------------

// ------------------------- ACTUATOR STATE REPORTING --------------------------
const float ACTUATOR_STATE_REPORT_INTERVAL_S = 300.0;  // 5 mins

Ticker actuatorStateReportTicker;
// -----------------------------------------------------------------------------

// ------------------------ LED SIGNALING --------------------------------------
#define INVERSE_LED_LOGIC
const uint8_t LED_SIGNAL_PIN = BUILTIN_LED;
const float NOT_CONNECTED_SIGNALING_INTERVAL_S = 0.2;

Ticker noTransportConnectedLedTicker;
// -----------------------------------------------------------------------------

// callback notifying us of the need to save config
void saveConfigCallback() {
  needToSaveConfig = true;
}

void loadConfig(const char* cfgFilePath, CfgData& data) {
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
        JsonObject& json = jsonBuffer.parseObject(buf.get());
      #ifdef DEBUG
        json.printTo(Serial);
      #endif

        strncpy(data.mqtt_server, json["mqtt_server"], MQTT_SERVER_FIELD_MAX_LEN);
        strncpy(data.mqtt_user, json["mqtt_user"], MQTT_USER_FIELD_MAX_LEN);
        strncpy(data.mqtt_passwd, json["mqtt_passwd"], MQTT_PASS_FIELD_MAX_LEN);
        strncpy(data.mqtt_port, json["mqtt_port"], MQTT_PORT_FIELD_MAX_LEN);
        strncpy(data.mqtt_in_topic_prefix, json["mqtt_in_topic_prefix"], MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
        strncpy(data.mqtt_out_topic_prefix, json["mqtt_out_topic_prefix"], MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);
        strncpy(data.mys_node_id, json["mys_node_id"], MYS_NODE_ID_FIELD_MAX_LEN);
        strncpy(data.mys_node_alias, json["mys_node_alias"], MYS_NODE_ALIAS_FIELD_MAX_LEN);

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
      //startCustomCaptivePortal();
    }
    SPIFFS.end();
  } else {
    // fail to mount spiffs
  #ifdef DEBUG
    DEBUG_OUTPUT.println("SPIFFS mount failed!");
  #endif
  }
}

void saveConfig(const char* cfgFilePath, CfgData& data) {
  if (SPIFFS.begin()) {
    if (SPIFFS.exists(cfgFilePath)) {
      File configFile = SPIFFS.open(cfgFilePath, "w");
      if (configFile) {
        // read config file
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file found!");
      #endif

        StaticJsonBuffer<512> jsonBuffer;
        JsonObject& json = jsonBuffer.createObject();

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
      //startCustomCaptivePortal();
    }
    SPIFFS.end();
  } else {
    // fail to mount spiffs
  #ifdef DEBUG
    DEBUG_OUTPUT.println("SPIFFS mount failed!");
  #endif
  }
}

void startWiFiAutoConfig(CfgData& cfgData) {
  // custom parameters
  WiFiManagerParameter mqtt_header_text("<br/><b>MQTT</b>");
  WiFiManagerParameter custom_mqtt_server("server", "mqtt server", cfgData.mqtt_server, MQTT_SERVER_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mqtt_server_user("user", "mqtt user", cfgData.mqtt_user, MQTT_USER_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mqtt_server_passwd("passwd", "mqtt passwd", cfgData.mqtt_passwd, MQTT_PASS_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mqtt_port("port", "mqtt port", cfgData.mqtt_port, MQTT_PORT_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mqtt_in_topic_prefix("in_topic_prefix", "mqtt in topic prefix", cfgData.mqtt_in_topic_prefix, MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mqtt_out_topic_prefix("out_topic_prefix", "mqtt out topic prefix", cfgData.mqtt_out_topic_prefix, MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);

  WiFiManagerParameter mys_header_text("<br/><br/><b>MySensors</b>");
  WiFiManagerParameter custom_mys_node_id("node_id", "mys node id", cfgData.mys_node_id, MYS_NODE_ID_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mys_node_alias("node_alias", "mys node alias", cfgData.mys_node_alias, MYS_NODE_ALIAS_FIELD_MAX_LEN);

  WiFiManager wifiManager;
  wifiManager.setSaveConfigCallback(saveConfigCallback);
  wifiManager.setTimeout(CFG_PORTAL_TIMEOUT_S);

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

  if (!wifiManager.autoConnect(AP_SSID, AP_PASSWD)) {
  #ifdef DEBUG
    DEBUG_OUTPUT.println("Failed to connect and configuration portal timeout was reached, rebooting ...");
  #endif
    // fail to connect
    delay(1000);
    // reset and try again, or maybe put it to deep sleep
    ESP.reset();
  }

  if(needToSaveConfig) {
  #ifdef DEBUG
    DEBUG_OUTPUT.println("Configuration changed need to save it!");
  #endif

    strncpy(cfgData.mqtt_server, custom_mqtt_server.getValue(), MQTT_SERVER_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_user, custom_mqtt_server_user.getValue(), MQTT_USER_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_passwd, custom_mqtt_server_passwd.getValue(), MQTT_PASS_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_port, custom_mqtt_port.getValue(), MQTT_PORT_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_in_topic_prefix, custom_mqtt_in_topic_prefix.getValue(), MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_out_topic_prefix, custom_mqtt_out_topic_prefix.getValue(), MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);
    strncpy(cfgData.mys_node_id, custom_mys_node_id.getValue(), MYS_NODE_ID_FIELD_MAX_LEN);
    strncpy(cfgData.mys_node_alias, custom_mys_node_alias.getValue(), MYS_NODE_ALIAS_FIELD_MAX_LEN);

    saveConfig(CONFIG_FILE, cfgData);

    needToSaveConfig = false;
  }
}

void onMessage(MySensorMsg& msg) {
  if(msg.cmd_type == M_SET) {
    if(strlen(msg.payload) > 0) {
      uint8_t newState = atoi(msg.payload); // convert to number
    #ifdef DEBUG
      DEBUG_OUTPUT.printf("Received M_SET command with value: %d\r\n", newState);
    #endif

    #ifdef INVERSE_LOGIC
      digitalWrite(RELAY_PINS[msg.child_id - 1], !newState);
    #else
      digitalWrite(RELAY_PINS[msg.child_id - 1], newState);
    #endif

      // send reply with new state
      char reply[MQTT_MAX_PAYLOAD_LENGTH];
    #ifdef INVERSE_LOGIC
      snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", !digitalRead(RELAY_PINS[msg.child_id - 1]));
    #else
      snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", digitalRead(RELAY_PINS[msg.child_id - 1]));
    #endif
      mysNode.send(msg.child_id, CHILD_SUBTYPES[msg.child_id - 1], reply);
    }
  }

  /*if(msgType == M_REQ) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Received M_REQ command\r\n");
  #endif
  }*/
}

void checkTransportConnection() {
  if(!mysNode.connected()) {
    digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
  }

  // make sure signaling led is off if transport is connected
#ifdef INVERSE_LED_LOGIC
  if(mysNode.connected() && !digitalRead(LED_SIGNAL_PIN)) {
    digitalWrite(LED_SIGNAL_PIN, HIGH);
  }
#else
  if(mysNode.connected() && digitalRead(LED_SIGNAL_PIN)) {
    digitalWrite(LED_SIGNAL_PIN, LOW);
  }
#endif
}

void sendBatteryLevel() {
  uint8_t vccPercent = round((ESP.getVcc() * 100) / VDD_VOLTAGE_MV);
#ifdef DEBUG
  DEBUG_OUTPUT.printf("Sending system voltage level: %d%%\r\n", vccPercent);
#endif
  mysNode.send_battery_level(vccPercent);
}

void sendActuatorState() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  for(uint8_t i = 0; i < SENSOR_COUNT; i++) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Sending actuator %d state ...\r\n", (i + 1));
  #endif
  #ifdef INVERSE_LOGIC
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", !digitalRead(RELAY_PINS[i]));
  #else
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", digitalRead(RELAY_PINS[i]));
  #endif
    mysNode.send(i + 1, CHILD_SUBTYPES[i], reply);
  }
}

void setup() {
  for(uint8_t i = 0; i < SENSOR_COUNT; i++) {
    pinMode(RELAY_PINS[i], OUTPUT);
  #ifdef INVERSE_LOGIC
    digitalWrite(RELAY_PINS[i], HIGH);
  #else
    digitalWrite(RELAY_PINS[i], LOW);
  #endif
  }

  pinMode(LED_SIGNAL_PIN, OUTPUT);
#ifdef INVERSE_LOGIC
  digitalWrite(LED_SIGNAL_PIN, HIGH);
#else
  digitalWrite(LED_SIGNAL_PIN, LOW);
#endif

#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  loadConfig(CONFIG_FILE, cfgData);

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

#ifdef DEBUG
  DEBUG_OUTPUT.println("=== Starting WiFi autoconfig ===");
#endif
  startWiFiAutoConfig(cfgData);

  mysNode.begin(atoi(cfgData.mys_node_id),
                cfgData.mys_node_alias,
                CHILD_TYPES,
                CHILD_ALIASES,
                SENSOR_COUNT,
                cfgData.mqtt_server,
                cfgData.mqtt_user,
                cfgData.mqtt_passwd,
                atoi(cfgData.mqtt_port),
                cfgData.mqtt_in_topic_prefix,
                cfgData.mqtt_out_topic_prefix);
  mysNode.on_message(onMessage);

  noTransportConnectedLedTicker.attach(NOT_CONNECTED_SIGNALING_INTERVAL_S,
    checkTransportConnection);
  batteryLevelReportTicker.attach(BATTER_LVL_REPORT_INTERVAL_S,
    sendBatteryLevel);
  actuatorStateReportTicker.attach(ACTUATOR_STATE_REPORT_INTERVAL_S,
    sendActuatorState);

  // send initial reports on node startup
  sendActuatorState();
  sendBatteryLevel();
}

void loop() {
  static bool needToSendReports = false;
  if(!mysNode.connected()) {
    needToSendReports = true;
  }

  if(mysNode.connected() && needToSendReports) {
    // send reports on node reconnection
    sendActuatorState();
    sendBatteryLevel();

    needToSendReports = false;
  }

  mysNode.loop();
}
