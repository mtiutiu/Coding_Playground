#ifndef MY_SENSOR_H
#define MY_SENSOR_H

#include <Arduino.h>
#include <MTypes.h>
#include <PubSubClient.h>

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

class MySensor {
  public:
  MySensor( const uint8_t node_id,
            const char* node_alias,
            const uint8_t* node_childs_subtype,
            const char** node_childs_alias,
            const uint8_t child_count,
            PubSubClient& mqtt_instance,
            const char* mqtt_in_topic_prefix,
            const char* mqtt_out_topic_prefix
            ):mqtt(mqtt_instance),
              node_id(node_id),
              node_alias(node_alias),
              node_childs_subtype(node_childs_subtype),
              node_childs_alias(node_childs_alias),
              child_count(child_count),
              mqtt_in_topic_prefix(mqtt_in_topic_prefix),
              mqtt_out_topic_prefix(mqtt_out_topic_prefix){}

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
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = NODE_SENSOR_ID;
    data.cmd_type = M_INTERNAL;
    data.ack = ack;
    data.sub_type = I_SKETCH_NAME; // e.g. S_BINARY
    strncpy(data.payload, name, MQTT_MAX_PAYLOAD_LENGTH);

    _mys_mycontroller_out(data);
  }

  void send_sketch_version(const char* version = "2.0", uint8_t ack = 0) {
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = NODE_SENSOR_ID;
    data.cmd_type = M_INTERNAL;
    data.ack = ack;
    data.sub_type = I_SKETCH_VERSION; // e.g. S_BINARY
    strncpy(data.payload, version, MQTT_MAX_PAYLOAD_LENGTH);

    _mys_mycontroller_out(data);
  }

  void send_heartbeat(uint8_t ack = 0) {
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = NODE_SENSOR_ID;
    data.cmd_type = M_INTERNAL;
    data.ack = ack;
    data.sub_type = I_HEARTBEAT_RESPONSE; // e.g. S_BINARY
    snprintf(data.payload, MQTT_MAX_PAYLOAD_LENGTH, "%lu", millis());

    _mys_mycontroller_out(data);
  }

  void send_battery_level(uint8_t value, uint8_t ack = 0) {
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = NODE_SENSOR_ID;
    data.cmd_type = M_INTERNAL;
    data.ack = ack;
    data.sub_type = I_BATTERY_LEVEL; // e.g. S_BINARY
    snprintf(data.payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

    _mys_mycontroller_out(data);
  }

  void send_discovery_response(uint8_t parent_node_id = 0, uint8_t ack = 0) {
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = NODE_SENSOR_ID;
    data.cmd_type = M_INTERNAL;
    data.ack = ack;
    data.sub_type = I_DISCOVER_RESPONSE; // e.g. S_BINARY
    snprintf(data.payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", parent_node_id);

    _mys_mycontroller_out(data);
  }

  void send(uint8_t child_sensor_id, uint8_t variable_type, char* payload, uint8_t ack = 0) {
    MySensorMsg data;
    data.node_id = node_id;
    data.child_id = child_sensor_id;
    data.cmd_type = M_SET;
    data.ack = ack;
    data.sub_type = variable_type; // e.g. V_STATUS
    strncpy(data.payload, payload, MQTT_MAX_PAYLOAD_LENGTH);;

    _mys_mycontroller_out(data);
  }

  MySensorMsg& read(char* topic, MySensorMsg& mysMsg) {
    return _mys_mycontroller_in(topic, mysMsg);
  }

  private:
    const uint8_t node_id;
    const char* node_alias;
    const uint8_t* node_childs_subtype;
    const char** node_childs_alias;
    const uint8_t child_count;
    PubSubClient& mqtt;
    const char* mqtt_in_topic_prefix;
    const char* mqtt_out_topic_prefix;
    const uint8_t NODE_SENSOR_ID = 255;     // special child id used for internal messages
    char* mqtt_split_buff[MAX_MQTT_SPLIT_COUNT];

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

    MySensorMsg&  _mys_mycontroller_in(char* topic, MySensorMsg& mysMsg) {
      _split_message(topic, "/");
      mysMsg.node_id = atoi(mqtt_split_buff[1]);
      mysMsg.child_id = atoi(mqtt_split_buff[2]);
      mysMsg.cmd_type = atoi(mqtt_split_buff[3]);
      mysMsg.ack = atoi(mqtt_split_buff[4]);
      mysMsg.sub_type = atoi(mqtt_split_buff[5]);

      // treat internal stuff here
      if(mysMsg.cmd_type == M_INTERNAL) {
        if(mysMsg.sub_type == I_PRESENTATION) {
          #ifdef DEBUG
          Serial.printf("Received I_PRESENTATION internal command on topic: %s\r\n", topic);
          #endif
          send_presentation();
        } else if(mysMsg.sub_type == I_DISCOVER_REQUEST) {
          #ifdef DEBUG
          Serial.printf("Received I_DISCOVER_REQUEST internal command on topic: %s\r\n", topic);
          #endif
          send_discovery_response();
        } else if(mysMsg.sub_type == I_HEARTBEAT_REQUEST) {
          #ifdef DEBUG
          Serial.printf("Received I_HEARTBEAT_REQUEST internal command on topic: %s\r\n", topic);
          #endif
          send_heartbeat();
        } else if(mysMsg.sub_type == I_REBOOT) {
          #ifdef DEBUG
          Serial.printf("Received I_REBOOT internal command on topic: %s\r\n", topic);
          #endif
          ESP.reset();
        }
      }

      return mysMsg;
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
      Serial.printf("Publishing: %s on topic: %s\r\n", data.payload, mqtt_topic);
      #endif
      mqtt.publish(mqtt_topic, data.payload);
    }

    void _send_presentation(const uint8_t child_sensor_id, const uint8_t child_sub_type, const char* child_sensor_alias, uint8_t ack = 0) {
      MySensorMsg data;
      data.node_id = node_id;
      data.child_id = child_sensor_id;
      data.cmd_type = M_PRESENTATION;
      data.ack = ack;
      data.sub_type = child_sub_type; // e.g. S_BINARY
      strncpy(data.payload, child_sensor_alias, MQTT_MAX_PAYLOAD_LENGTH);

      _mys_mycontroller_out(data);
    }
};
#endif
