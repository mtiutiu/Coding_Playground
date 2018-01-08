#ifndef MY_SENSOR_H
#define MY_SENSOR_H

#include <Arduino.h>
#include <MTypes.h>
#include <PubSubClient.h>

void* mqtt_cb_obj;
WiFiClient espClient;
PubSubClient mqtt(espClient);

#define MQTT_CLIENT_ID_PREFIX  "ESP"
#define MQTT_MAX_PAYLOAD_LENGTH  64
#define MAX_MQTT_SPLIT_COUNT  6

typedef struct {
  uint8_t node_id;
  uint8_t child_id;
  uint8_t cmd_type;
  uint8_t ack;
  uint8_t sub_type;
  char payload[MQTT_MAX_PAYLOAD_LENGTH];
} MySensorMsg;

typedef void (*mys_msg_cb)(uint8_t cmd_type, byte* data, uint16_t length);

class MySensor {
  public:
    MySensor(){}

    void begin(const uint8_t node_id,
                const char* node_alias,
                const uint8_t* node_childs_subtype,
                const char** node_childs_alias,
                const uint8_t child_count,
                const char* mqtt_server,
                const char* mqtt_user,
                const char* mqtt_passwd,
                const uint16_t mqtt_port,
                const char* mqtt_in_topic_prefix,
                const char* mqtt_out_topic_prefix) {
      this->node_id = node_id;
      this->node_alias = node_alias;
      this->node_childs_subtype = node_childs_subtype;
      this->node_childs_alias = node_childs_alias;
      this->child_count = child_count;
      this->mqtt_server = mqtt_server;
      this->mqtt_user = mqtt_user;
      this->mqtt_passwd = mqtt_passwd;
      this->mqtt_port = mqtt_port;
      this->mqtt_in_topic_prefix = mqtt_in_topic_prefix;
      this->mqtt_out_topic_prefix = mqtt_out_topic_prefix;

      // dirty hack to allow callbacks to member functions using a global pointer variable
      // http://www.newty.de/fpt/callback.html#static
      mqtt_cb_obj = (void*) this;
      mqtt.setCallback(MySensor::_mqtt_callback_wrapper);

      mqtt.setServer(mqtt_server, mqtt_port);
    }

    void on_message(mys_msg_cb cb) {
      this->on_msg_cb = cb;
    }

    void send_presentation(bool present_node_name = true, bool present_node_version = true, uint8_t ack = 0) {
      // present this node as a MySensors node first
      _send_presentation(NODE_SENSOR_ID, S_ARDUINO_NODE, "", ack);
      if(present_node_name) {
        send_sketch_name(node_alias);
      }
      if(present_node_version) {
        send_sketch_version();
      }
      for (uint8_t i = 0; i < child_count; i++) {
        _send_presentation(i + 1, node_childs_subtype[i], node_childs_alias[i], ack);
      }
    }

    void send_sketch_name(const char* name, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, name, MQTT_MAX_PAYLOAD_LENGTH);

      send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_NAME, payload, ack);
    }

    void send_sketch_version(const char* version = "2.0", uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, version, MQTT_MAX_PAYLOAD_LENGTH);

      send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_VERSION, payload, ack);
    }

    void send_heartbeat(uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%lu", millis());

      send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_HEARTBEAT_RESPONSE, payload, ack);
    }

    void send_battery_level(uint8_t value, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

      send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_BATTERY_LEVEL, payload, ack);
    }

    void send_discovery_response(uint8_t parent_node_id = 0, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", parent_node_id);

      send(this->node_id, NODE_SENSOR_ID, M_INTERNAL, I_DISCOVER_RESPONSE, payload, ack);
    }

    void send(uint8_t node_id, uint8_t child_sensor_id, uint8_t cmd_type, uint8_t variable_type, char* payload, uint8_t ack = 0) {
      MySensorMsg data;
      data.node_id = node_id;
      data.child_id = child_sensor_id;
      data.cmd_type = cmd_type;
      data.ack = ack;
      data.sub_type = variable_type; // e.g. V_STATUS
      strncpy(data.payload, payload, MQTT_MAX_PAYLOAD_LENGTH);;

      _mys_mycontroller_out(data);
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
          mqtt.connect(mqttClientId, mqtt_user, mqtt_passwd);

          #ifdef DEBUG
          DEBUG_OUTPUT.println("Not connected to mqtt broker, retrying ...");
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

        mqtt.loop();
      }
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

    static void _mqtt_callback_wrapper(char* topic, byte* payload, uint16_t length) {
      // use global variable to access member function by casting it first
      // http://www.newty.de/fpt/callback.html#static
      ((MySensor*)mqtt_cb_obj)->_mqtt_callback(topic, payload, length);
    }

    void _mqtt_callback(char* topic, byte* payload, uint16_t length) {
      _split_message(topic, "/");
      uint8_t node_id = atoi(mqtt_split_buff[1]);
      uint8_t child_id = atoi(mqtt_split_buff[2]);
      uint8_t cmd_type = atoi(mqtt_split_buff[3]);
      uint8_t ack = atoi(mqtt_split_buff[4]);
      uint8_t sub_type = atoi(mqtt_split_buff[5]);

      // treat internal stuff here
      if(cmd_type == M_INTERNAL) {
        if(sub_type == I_PRESENTATION) {
          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Received I_PRESENTATION internal command on topic: %s\r\n", topic);
          #endif
          send_presentation();
        } else if(sub_type == I_DISCOVER_REQUEST) {
          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Received I_DISCOVER_REQUEST internal command on topic: %s\r\n", topic);
          #endif
          send_discovery_response();
        } else if(sub_type == I_HEARTBEAT_REQUEST) {
          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Received I_HEARTBEAT_REQUEST internal command on topic: %s\r\n", topic);
          #endif
          send_heartbeat();
        } else if(sub_type == I_REBOOT) {
          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Received I_REBOOT internal command on topic: %s\r\n", topic);
          #endif
          ESP.reset();
        }
      }

      // #ifdef DEBUG
      // DEBUG_OUTPUT.printf("Received mqtt data: %s of length: %d, on topic: %s\r\n", payload, length, topic);
      // #endif

      on_msg_cb(cmd_type, payload, length);
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

      #ifdef DEBUG
      DEBUG_OUTPUT.printf("Publishing: %s on topic: %s\r\n", data.payload, mqtt_topic);
      #endif
      if(mqtt.connected()) {
        mqtt.publish(mqtt_topic, data.payload);
      }
    }

    void _send_presentation(const uint8_t child_sensor_id, const uint8_t child_sub_type, const char* child_sensor_alias, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, child_sensor_alias, MQTT_MAX_PAYLOAD_LENGTH);

      send(this->node_id, child_sensor_id, M_PRESENTATION, child_sub_type, payload, ack);
    }
};
#endif
