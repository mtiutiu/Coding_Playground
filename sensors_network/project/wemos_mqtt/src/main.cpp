#define DEBUG
#define SERIAL_DEBUG_BAUDRATE 115200

#include <Arduino.h>

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

typedef struct {
  char wifi_ssid[40];
  char wifi_passwd[40];
  char mqtt_server[40];
  char mqtt_user[40];
  char mqtt_passwd[40];
  char mqtt_port[5];
} CfgData;

CfgData cfgData;
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MQTT -----------------------------------------------
#include <PubSubClient.h>

#define MQTT_CLIENT_ID_PREFIX  "WaterValveController"
#define MQTT_SERVER_FIELD_MAX_LEN 40
#define MQTT_USER_FIELD_MAX_LEN 40
#define MQTT_PASS_FIELD_MAX_LEN 40
#define MQTT_PORT_FIELD_MAX_LEN 5
const char* MQTT_IN_TOPIC_PREFIX = "mys-in";
const char* MQTT_OUT_TOPIC_PREFIX = "mys-out";
const uint32_t MQTT_RECONNECT_INTERVAL_MS = 3000; // 3s

WiFiClient espClient;
PubSubClient mqtt(espClient);
// ------------------------ END MQTT -------------------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensor.h>

const uint8_t BROADCAST_NODE_ID = 255;  // special node id used for internal messages
const uint8_t NODE_ID = 100;
const char* NODE_ALIAS = "WaterValveActuator";
const uint8_t CHILD_TYPES[] = { S_BINARY };
const char* CHILD_ALIASES[] = { "Valve" };

const uint16_t VDD_VOLTAGE_MV = 3000;
const uint32_t BATTER_LVL_REPORT_INTERVAL_MS = 300000;  // 5 mins

MySensor mysNode(NODE_ID,
                NODE_ALIAS,
                CHILD_TYPES,
                CHILD_ALIASES,
                1,
                mqtt,
                MQTT_IN_TOPIC_PREFIX,
                MQTT_OUT_TOPIC_PREFIX);
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

  WiFiManager wifiManager;
  wifiManager.setSaveConfigCallback(saveConfigCallback);

  wifiManager.addParameter(&mqtt_header_text);
  wifiManager.addParameter(&custom_mqtt_server);
  wifiManager.addParameter(&custom_mqtt_server_user);
  wifiManager.addParameter(&custom_mqtt_server_passwd);
  wifiManager.addParameter(&custom_mqtt_port);

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
      snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", MQTT_IN_TOPIC_PREFIX, NODE_ID);
      mqtt.subscribe(mqtt_topic);

      snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", MQTT_IN_TOPIC_PREFIX, BROADCAST_NODE_ID);
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
