#ifndef MY_SENSOR_H
#define MY_SENSOR_H

#include <Arduino.h>
#include <MTypes.h>
#include <MQTT.h>
#include <Preferences.h>

#define MQTT_CLIENT_ID_PREFIX  "ESP"
#define MQTT_MAX_PAYLOAD_LENGTH  64
#define MAX_MQTT_SPLIT_COUNT  6

void* mqtt_cb_obj;
WiFiClient espClient;
MQTTClient mqtt(MQTT_MAX_PAYLOAD_LENGTH);

typedef struct {
  uint8_t node_id;
  uint8_t child_id;
  uint8_t cmd_type;
  uint8_t ack;
  uint8_t sub_type;
  char payload[MQTT_MAX_PAYLOAD_LENGTH];
} MySensorMsg;

typedef struct {
  char* mqtt_server;
  char* mqtt_user;
  char* mqtt_passwd;
  uint16_t mqtt_port;
  char* mqtt_in_topic_prefix;
  char* mqtt_out_topic_prefix;
} MqttCfg;

typedef void (*mys_msg_cb)(MySensorMsg& msg);

class MySensors {
  public:
    MySensors(){}

    void begin( const uint8_t node_id,
                const char* node_alias,
                const uint8_t* node_childs_subtype,
                const char** node_childs_alias,
                const uint8_t child_count,
                const MqttCfg& mqtt_cfg) {
      this->node_id = node_id;
      this->node_alias = node_alias;
      this->node_childs_subtype = node_childs_subtype;
      this->node_childs_alias = node_childs_alias;
      this->child_count = child_count;
      this->mqtt_server = mqtt_cfg.mqtt_server;
      this->mqtt_user = mqtt_cfg.mqtt_user;
      this->mqtt_passwd = mqtt_cfg.mqtt_passwd;
      this->mqtt_port = mqtt_cfg.mqtt_port;
      this->mqtt_in_topic_prefix = mqtt_cfg.mqtt_in_topic_prefix;
      this->mqtt_out_topic_prefix = mqtt_cfg.mqtt_out_topic_prefix;

      //Preferences::hwInit();

      // dirty hack to allow callbacks to member functions using a global pointer variable
      // http://www.newty.de/fpt/callback.html#static
      mqtt_cb_obj = (void*) this;
      mqtt.onMessageAdvanced(MySensors::_mqtt_callback_wrapper);

      mqtt.begin(mqtt_server, mqtt_port, espClient);
    }

    void on_message(mys_msg_cb cb) {
      this->on_msg_cb = cb;
    }

    void send_presentation(bool present_node_name = true, bool present_node_version = true, uint8_t ack = 0) {
      // present this node as a MySensors node first
      _send_presentation(NODE_SENSOR_ID, S_ARDUINO_NODE, "", ack);
      if(present_node_name) {
        send_sketch_name(this->node_alias);
      }
      if(present_node_version) {
        send_sketch_version();
      }
      for (uint8_t i = 0; i < this->child_count; i++) {
        _send_presentation(i + 1, this->node_childs_subtype[i], this->node_childs_alias[i], ack);
      }
    }

    void send_sketch_name(const char* name, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, name, MQTT_MAX_PAYLOAD_LENGTH);

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_NAME, payload, ack);
    }

    void send_sketch_version(const char* version = "2.0", uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, version, MQTT_MAX_PAYLOAD_LENGTH);

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_VERSION, payload, ack);
    }

    void send_heartbeat(uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%lu", millis());

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_HEARTBEAT_RESPONSE, payload, ack);
    }

    void send_battery_level(const uint8_t value, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_BATTERY_LEVEL, payload, ack);
    }

    void send_discovery_response(uint8_t parent_node_id = 0, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", parent_node_id);

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_DISCOVER_RESPONSE, payload, ack);
    }

    void send_signal_strength(const uint8_t value, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

      _send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_SIGNAL_REPORT_RESPONSE, payload, ack);
    }

    void send(uint8_t child_sensor_id, uint8_t sub_type, const char* payload, uint8_t ack = 0) {
      if(child_sensor_id <= this->child_count) {
        _send(this->node_id, child_sensor_id, M_SET, sub_type, payload, ack);
      }
    }

    bool connected() {
      return mqtt.connected();
    }

    void loop() {
      static bool needToSendPresentation = false;
      static bool needToSubscribeMqtt = false;

      if (!mqtt.connected()) {
        // reconnect to mqtt
        static uint32_t lastMqttBrokerConnectTimestamp = millis();
        if(millis() - lastMqttBrokerConnectTimestamp >= MQTT_RECONNECT_INTERVAL_MS) {
          char mqttClientId[40];
          snprintf(mqttClientId, sizeof(mqttClientId), "%s-%lu", MQTT_CLIENT_ID_PREFIX, random(0xFFFF));
          mqtt.connect(mqttClientId, mqtt_user, mqtt_passwd);

          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Not connected to mqtt broker: %s:%d, retrying ...\r\n",
            this->mqtt_server, this->mqtt_port);
          #endif
          lastMqttBrokerConnectTimestamp = millis();
        }

        needToSendPresentation = true;
        needToSubscribeMqtt = true;
      }

      if(mqtt.connected()) {
        if(needToSendPresentation) {
          send_presentation();
          needToSendPresentation = false;
        }

        if(needToSubscribeMqtt) {
          char mqtt_topic[40];
          snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", mqtt_in_topic_prefix, node_id);
          mqtt.subscribe(mqtt_topic);

          snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", mqtt_in_topic_prefix, BROADCAST_NODE_ID);
          mqtt.subscribe(mqtt_topic);

          needToSubscribeMqtt = false;
        }
      }
      mqtt.loop();
      delay(10);  // for stability after mqtt loop
    }

  private:
    uint8_t node_id;
    const char* node_alias;
    const uint8_t* node_childs_subtype;
    const char** node_childs_alias;
    uint8_t child_count;
    const char* mqtt_server;
    const char* mqtt_user;
    const char* mqtt_passwd;
    uint16_t mqtt_port;
    const char* mqtt_in_topic_prefix;
    const char* mqtt_out_topic_prefix;
    mys_msg_cb on_msg_cb;
    uint8_t NODE_SENSOR_ID = 255;     // special child id used for internal messages
    const uint8_t BROADCAST_NODE_ID = 255;  // special node id used for internal messages
    char* mqtt_split_buff[MAX_MQTT_SPLIT_COUNT];
    const uint32_t MQTT_RECONNECT_INTERVAL_MS = 3000; // 3s

    uint8_t _split_message(char* str, const char* delim) {
      uint8_t split_count = 0; //number of words
      char* item = strtok (str, delim); //getting first word (uses space & comma as delimeter)

      while (item != NULL) {
        if (split_count >= MAX_MQTT_SPLIT_COUNT) {
          break;
        }
        mqtt_split_buff[split_count] = item;
        item = strtok (NULL, delim); //getting subsequence word
        split_count++;
      }
      return  split_count;
    }

    static void _mqtt_callback_wrapper(MQTTClient *client, char* topic, char* payload, int length) {
      // use global variable to access member function by casting it first
      // http://www.newty.de/fpt/callback.html#static
      ((MySensors*)mqtt_cb_obj)->_mqtt_callback(topic, payload, length);
    }

    void _mqtt_callback(char* topic, char* payload, int length) {
      _split_message(topic, "/");
      uint8_t node_id = atoi(mqtt_split_buff[1]);
      uint8_t child_id = atoi(mqtt_split_buff[2]);
      uint8_t cmd_type = atoi(mqtt_split_buff[3]);
      uint8_t ack = atoi(mqtt_split_buff[4]);
      uint8_t sub_type = atoi(mqtt_split_buff[5]);

      // treat internal stuff here
      if(cmd_type == M_INTERNAL) {
        switch (sub_type) {
          case I_PRESENTATION:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_PRESENTATION internal command on topic: %s\r\n", topic);
            #endif
            send_presentation();
            break;
          case I_DISCOVER_REQUEST:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_DISCOVER_REQUEST internal command on topic: %s\r\n", topic);
            #endif
            send_discovery_response();
            break;
          case I_HEARTBEAT_REQUEST:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_HEARTBEAT_REQUEST internal command on topic: %s\r\n", topic);
            #endif
            send_heartbeat();
            break;
          case I_REBOOT:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_REBOOT internal command on topic: %s\r\n", topic);
            #endif
            ESP.restart();
            break;
          case I_SIGNAL_REPORT_REQUEST:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_SIGNAL_REPORT_REQUEST internal command on topic: %s\r\n", topic);
            #endif
            send_signal_strength(WiFi.RSSI());
            break;
          default:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Unrecognized internal command on topic: %s\r\n", topic);
            #endif
            ;
        }
      }

      MySensorMsg msg_data;
      msg_data.node_id = node_id;
      msg_data.child_id = child_id;
      msg_data.cmd_type = cmd_type;
      msg_data.ack = ack;
      msg_data.sub_type = sub_type;
      memset(msg_data.payload, '\0', MQTT_MAX_PAYLOAD_LENGTH);
      strncpy(msg_data.payload, (char*)payload, length);
      on_msg_cb(msg_data);
    }

    void _mys_mycontroller_out(MySensorMsg& data) {
      char mqtt_topic[128];
      snprintf(mqtt_topic,
              sizeof(mqtt_topic),
              "%s/%d/%d/%d/%d/%d",
              mqtt_out_topic_prefix,
              data.node_id,
              data.child_id,
              data.cmd_type,
              data.ack,
              data.sub_type);

      if(mqtt.connected()) {
        #ifdef DEBUG
        DEBUG_OUTPUT.printf("Publishing: %s on topic: %s\r\n", data.payload, mqtt_topic);
        #endif
        mqtt.publish(mqtt_topic, data.payload);
      }
    }

    void _send_presentation(const uint8_t child_sensor_id, const uint8_t child_sub_type, const char* child_sensor_alias, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, child_sensor_alias, MQTT_MAX_PAYLOAD_LENGTH);

      _send(this->node_id, child_sensor_id, M_PRESENTATION, child_sub_type, payload, ack);
    }

    void _send(uint8_t node_id, uint8_t child_sensor_id, uint8_t cmd_type, uint8_t variable_type, const char* payload, uint8_t ack = 0) {
      MySensorMsg data;
      data.node_id = node_id;
      data.child_id = child_sensor_id;
      data.cmd_type = cmd_type;
      data.ack = ack;
      data.sub_type = variable_type; // e.g. V_STATUS
      strncpy(data.payload, payload, MQTT_MAX_PAYLOAD_LENGTH);;

      _mys_mycontroller_out(data);
    }
};
#endif
