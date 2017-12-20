#define DEBUG
#define SERIAL_DEBUG_BAUDRATE 115200

#include <Arduino.h>

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
#define CONFIG_FILE "/config.json"

#define MQTT_SERVER_FIELD_MAX_LEN 40
#define MQTT_USER_FIELD_MAX_LEN 40
#define MQTT_PASS_FIELD_MAX_LEN 40
#define MQTT_PORT_FIELD_MAX_LEN 6
#define MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MYS_NODE_ID_FIELD_MAX_LEN 4
#define MYS_NODE_ALIAS_FIELD_MAX_LEN 40
#define MYS_NODE_CHILD_ALIAS_FIELD_MAX_LEN 40

typedef struct {
  char mqtt_server[MQTT_SERVER_FIELD_MAX_LEN];
  char mqtt_user[MQTT_USER_FIELD_MAX_LEN];
  char mqtt_passwd[MQTT_PASS_FIELD_MAX_LEN];
  char mqtt_port[MQTT_PORT_FIELD_MAX_LEN];
  char mqtt_in_topic_prefix[MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mqtt_out_topic_prefix[MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mys_node_id[MYS_NODE_ID_FIELD_MAX_LEN];
  char mys_node_alias[MYS_NODE_ALIAS_FIELD_MAX_LEN];
  char mys_node_child_alias[MYS_NODE_CHILD_ALIAS_FIELD_MAX_LEN];
} CfgData;

CfgData cfgData;
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MQTT -----------------------------------------------
#include <PubSubClient.h>

#define MQTT_CLIENT_ID_PREFIX  "WaterValveController"
const uint32_t MQTT_RECONNECT_INTERVAL_MS = 3000; // 3s

WiFiClient espClient;
PubSubClient mqtt(espClient);
// ------------------------ END MQTT -------------------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensor.h>

const uint8_t BROADCAST_NODE_ID = 255;  // special node id used for internal messages

const uint8_t SENSOR_COUNT = 1;

const uint16_t VDD_VOLTAGE_MV = 3000;
const uint32_t BATTER_LVL_REPORT_INTERVAL_MS = 300000;  // 5 mins

MySensor mysNode(mqtt);
// ------------------------ END MySensors---------------------------------------

// flag for saving data
bool needToSaveConfig = false;

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
        Serial.println("Config file found!");
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
        strncpy(data.mys_node_child_alias, json["mys_node_child_alias"], MYS_NODE_CHILD_ALIAS_FIELD_MAX_LEN);

      } else {
        // config file couldn't be opened
        #ifdef DEBUG
        Serial.println("Config file couldn't be opened!");
        #endif
      }
    } else {
      // config file not found start portal
      #ifdef DEBUG
      Serial.println("Config file wasn't found!");
      #endif
      //startCustomCaptivePortal();
    }
    SPIFFS.end();
  } else {
    // fail to mount spiffs
    #ifdef DEBUG
    Serial.println("SPIFFS mount failed!");
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
        Serial.println("Config file found!");
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
        json["mys_node_child_alias"] = data.mys_node_child_alias;

        json.printTo(configFile);
        configFile.close();
      } else {
        // config file couldn't be opened
        #ifdef DEBUG
        Serial.println("Config file couldn't be opened!");
        #endif
      }
    } else {
      // config file not found start portal
      #ifdef DEBUG
      Serial.println("Config file wasn't found!");
      #endif
      //startCustomCaptivePortal();
    }
    SPIFFS.end();
  } else {
    // fail to mount spiffs
    #ifdef DEBUG
    Serial.println("SPIFFS mount failed!");
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

  WiFiManagerParameter mys_header_text("<br/><b>MySensors</b>");
  WiFiManagerParameter custom_mys_node_id("node_id", "mys node id", cfgData.mys_node_id, MYS_NODE_ID_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mys_node_alias("node_alias", "mys node alias", cfgData.mys_node_alias, MYS_NODE_ALIAS_FIELD_MAX_LEN);
  WiFiManagerParameter custom_mys_node_child_alias("node_child_alias", "mys node child alias", cfgData.mys_node_child_alias, MYS_NODE_CHILD_ALIAS_FIELD_MAX_LEN);

  WiFiManager wifiManager;
  wifiManager.setSaveConfigCallback(saveConfigCallback);

  wifiManager.addParameter(&mqtt_header_text);
  wifiManager.addParameter(&custom_mqtt_server);
  wifiManager.addParameter(&custom_mqtt_server_user);
  wifiManager.addParameter(&custom_mqtt_server_passwd);
  wifiManager.addParameter(&custom_mqtt_port);

  wifiManager.addParameter(&mys_header_text);
  wifiManager.addParameter(&custom_mys_node_id);
  wifiManager.addParameter(&custom_mys_node_alias);
  wifiManager.addParameter(&custom_mys_node_child_alias);

  if (!wifiManager.autoConnect(AP_SSID, AP_PASSWD)) {
    // fail to connect
    delay(3000);
    // reset and try again, or maybe put it to deep sleep
    ESP.reset();
  }

  if(needToSaveConfig) {
    #ifdef DEBUG
    Serial.println("Configuration changed need to save it!");
    #endif

    strncpy(cfgData.mqtt_server, custom_mqtt_server.getValue(), MQTT_SERVER_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_user, custom_mqtt_server_user.getValue(), MQTT_USER_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_passwd, custom_mqtt_server_passwd.getValue(), MQTT_PASS_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_port, custom_mqtt_port.getValue(), MQTT_PORT_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_in_topic_prefix, custom_mqtt_in_topic_prefix.getValue(), MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
    strncpy(cfgData.mqtt_out_topic_prefix, custom_mqtt_out_topic_prefix.getValue(), MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);
    strncpy(cfgData.mys_node_id, custom_mys_node_id.getValue(), MYS_NODE_ID_FIELD_MAX_LEN);
    strncpy(cfgData.mys_node_alias, custom_mys_node_alias.getValue(), MYS_NODE_ALIAS_FIELD_MAX_LEN);
    strncpy(cfgData.mys_node_child_alias, custom_mys_node_child_alias.getValue(), MYS_NODE_CHILD_ALIAS_FIELD_MAX_LEN);

    saveConfig(CONFIG_FILE, cfgData);

    needToSaveConfig = false;
  }
}

void mqtt_callback(char* topic, byte* payload, uint16_t length) {
  MySensorMsg data;
  mysNode.read(topic, data);

  // #ifdef DEBUG
  // Serial.printf("Received mqtt data: %s of length: %d, on topic: %s\r\n", payload, length, topic);
  // Serial.printf("Command type: %d\r\n", data.cmd_type);
  // #endif

  if(data.cmd_type == M_SET) {
    #ifdef DEBUG
    Serial.printf("Received M_SET command with value: %d on topic: %s\r\n", (payload[0] - 48), topic);
    #endif
  }

  if(data.cmd_type == M_REQ) {
    #ifdef DEBUG
    Serial.printf("Received M_REQ command on topic: %s\r\n", topic);
    #endif
  }
}

void setup() {
#ifdef DEBUG
  Serial.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  loadConfig(CONFIG_FILE, cfgData);

#ifdef DEBUG
  Serial.println();
  Serial.println("=== CONFIG FILE DATA ===");
  Serial.print("MQTT SERVER: ");
  Serial.println(cfgData.mqtt_server);
  Serial.print("MQTT USER: ");
  Serial.println(cfgData.mqtt_user);
  Serial.print("MQTT PASSWORD: ");
  Serial.println(cfgData.mqtt_passwd);
  Serial.print("MQTT PORT: ");
  Serial.println(cfgData.mqtt_port);
#endif

#ifdef DEBUG
  Serial.println("=== Starting WiFi autoconfig ===");
#endif
  startWiFiAutoConfig(cfgData);

  mqtt.setServer(cfgData.mqtt_server, atoi(cfgData.mqtt_port));
  mqtt.setCallback(mqtt_callback);

  const uint8_t CHILD_TYPES[SENSOR_COUNT] = { S_BINARY };
  const char* CHILD_ALIASES[SENSOR_COUNT] = { cfgData.mys_node_child_alias };
  mysNode.set_params(atoi(cfgData.mys_node_id),
                    cfgData.mys_node_alias,
                    CHILD_TYPES,
                    CHILD_ALIASES,
                    SENSOR_COUNT,
                    cfgData.mqtt_in_topic_prefix,
                    cfgData.mqtt_out_topic_prefix);
}

void loop() {
  static bool needToSendPresentation = false;
  static bool needToSubscribeMqtt = false;

  if (!mqtt.connected()) {
    // reconnect to mqtt
    static uint32_t lastMqttBrokerConnectTimestamp = millis();
    if(millis() - lastMqttBrokerConnectTimestamp >= MQTT_RECONNECT_INTERVAL_MS) {
      char mqttClientId[40];
      snprintf(mqttClientId, sizeof(mqttClientId), "%s-%d", MQTT_CLIENT_ID_PREFIX, random(0xFFFF));
      mqtt.connect(mqttClientId, cfgData.mqtt_user, cfgData.mqtt_passwd);

      #ifdef DEBUG
      Serial.println("Not connected to mqtt broker, retrying ...");
      #endif
      lastMqttBrokerConnectTimestamp = millis();
    }

    needToSendPresentation = true;
    needToSubscribeMqtt = true;
  }

  if(mqtt.connected()) {
    if(needToSendPresentation) {
      mysNode.send_presentation();
      needToSendPresentation = false;
    }

    if(needToSubscribeMqtt) {
      char mqtt_topic[40];
      snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", cfgData.mqtt_in_topic_prefix, cfgData.mys_node_id);
      mqtt.subscribe(mqtt_topic);

      snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", cfgData.mqtt_in_topic_prefix, BROADCAST_NODE_ID);
      mqtt.subscribe(mqtt_topic);

      needToSubscribeMqtt = false;
    }

    static uint32_t lastVccReportTimestamp = millis();
    if(millis() - lastVccReportTimestamp >= BATTER_LVL_REPORT_INTERVAL_MS) {
      uint8_t vccPercent = (ESP.getVcc() * 100) / VDD_VOLTAGE_MV;
      #ifdef DEBUG
      Serial.printf("System voltage level: %d%%\r\n", vccPercent);
      #endif
      mysNode.send_battery_level(vccPercent);
      lastVccReportTimestamp = millis();
    }

    mqtt.loop();
  }
}
