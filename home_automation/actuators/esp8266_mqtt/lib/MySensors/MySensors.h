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
WiFiClient _espClient;
MQTTClient _mqtt(MQTT_MAX_PAYLOAD_LENGTH);

typedef struct {
  uint8_t node_id;
  uint8_t child_id;
  uint8_t cmd_type;
  uint8_t ack;
  uint8_t sub_type;
  char payload[MQTT_MAX_PAYLOAD_LENGTH];
} MySensorsMsg;

typedef struct {
  char* mqtt_server;
  char* mqtt_user;
  char* mqtt_passwd;
  uint16_t mqtt_port;
  char* mqtt_in_topic_prefix;
  char* mqtt_out_topic_prefix;
} MqttCfg;

typedef void (*mys_msg_cb)(MySensorsMsg& msg);
typedef void (*presentation_cb)(void);

class MySensors {
  public:
    MySensors() {
      // dirty hack to allow callbacks to member functions using a global pointer variable
      // http://www.newty.de/fpt/callback.html#static
      mqtt_cb_obj = (void*) this;
      _send_presentation_cb = NULL;
      _on_msg_cb = NULL;
      _mqtt_cfg = NULL;
    }

    void begin(const uint8_t node_id, const MqttCfg* mqtt_cfg) {
      _node_id = node_id;
      _mqtt_cfg = mqtt_cfg;

      if (!_mqtt_cfg) {
        #ifdef DEBUG
          DEBUG_OUTPUT.printf(
            "[MySensors] MQTT configuration data is invalid, delaying for 3s!\r\n");
          delay(3000);
        #endif
        return;
      }

      //Preferences::hwInit();
      _mqtt.onMessageAdvanced(MySensors::_mqtt_callback_wrapper);
      _mqtt.begin(_mqtt_cfg->mqtt_server, _mqtt_cfg->mqtt_port, _espClient);
    }

    void register_on_message_cb(mys_msg_cb cb) {
      _on_msg_cb = cb;
    }

    void register_presentation_cb(presentation_cb cb) {
      _send_presentation_cb = cb;
    }

    void present(const uint8_t id, const uint8_t sub_type, const char* alias, uint8_t ack = 0) {
      // present this node as a MySensors node first
      _send_presentation(NODE_SENSOR_ID, S_ARDUINO_NODE, "", ack);
      _send_presentation(id, sub_type, alias, ack);
    }

    void send_sketch_name(const char* name, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, name, MQTT_MAX_PAYLOAD_LENGTH);

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_NAME, payload, ack);
    }

    void send_sketch_version(const char* version = "2.0", uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, version, MQTT_MAX_PAYLOAD_LENGTH);

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_VERSION, payload, ack);
    }

    void send_battery_level(const uint8_t value, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_BATTERY_LEVEL, payload, ack);
    }

    void send_signal_strength(const uint8_t value, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", value);

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SIGNAL_REPORT_RESPONSE, payload, ack);
    }

    void send(uint8_t child_sensor_id, uint8_t sub_type, const char* payload, uint8_t ack = 0) {
      _send(_node_id, child_sensor_id, M_SET, sub_type, payload, ack);
    }

    bool connected() {
      return _mqtt.connected();
    }

    void loop() {
      static bool needToSendPresentation = false;
      static bool needToSubscribeMqtt = false;

      if (!_mqtt.connected()) {
        // reconnect to mqtt
        static uint32_t lastMqttBrokerConnectTimestamp = millis();
        if(millis() - lastMqttBrokerConnectTimestamp >= MQTT_RECONNECT_INTERVAL_MS) {
          #ifdef DEBUG
          DEBUG_OUTPUT.printf("Not connected to mqtt broker: %s:%d, retrying ...\r\n", _mqtt_cfg->mqtt_server, _mqtt_cfg->mqtt_port);
          #endif
          char mqttClientId[40];
          snprintf(mqttClientId, sizeof(mqttClientId), "%s-%lu", MQTT_CLIENT_ID_PREFIX, random(0xFFFF));
          _mqtt.connect(mqttClientId, _mqtt_cfg->mqtt_user, _mqtt_cfg->mqtt_passwd);
          lastMqttBrokerConnectTimestamp = millis();
        }

        needToSendPresentation = true;
        needToSubscribeMqtt = true;
      }

      if(_mqtt.connected()) {
        if(needToSendPresentation && _send_presentation_cb) {
            _send_presentation_cb();
            needToSendPresentation = false;
        }

        if(needToSubscribeMqtt) {
          char mqtt_topic[40];
          snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", _mqtt_cfg->mqtt_in_topic_prefix, _node_id);
          _mqtt.subscribe(mqtt_topic);

          snprintf(mqtt_topic, sizeof(mqtt_topic), "%s/%d/#", _mqtt_cfg->mqtt_in_topic_prefix, BROADCAST_NODE_ID);
          _mqtt.subscribe(mqtt_topic);

          needToSubscribeMqtt = false;
        }
      }
      _mqtt.loop();
      delay(10);  // for stability after mqtt loop
    }

  private:
    uint8_t _node_id;
    const MqttCfg* _mqtt_cfg = NULL;
    mys_msg_cb _on_msg_cb = NULL;
    presentation_cb _send_presentation_cb = NULL;
    uint8_t NODE_SENSOR_ID = 255;     // special child id used for internal messages
    const uint8_t BROADCAST_NODE_ID = 255;  // special node id used for internal messages
    char* _mqtt_split_buff[MAX_MQTT_SPLIT_COUNT];
    const uint32_t MQTT_RECONNECT_INTERVAL_MS = 3000; // 3s

    uint8_t _split_message(char* str, const char* delim) {
      uint8_t split_count = 0; //number of words
      char* item = strtok (str, delim); //getting first word (uses space & comma as delimeter)

      while (item != NULL) {
        if (split_count >= MAX_MQTT_SPLIT_COUNT) {
          break;
        }
        _mqtt_split_buff[split_count] = item;
        item = strtok (NULL, delim); //getting subsequence word
        split_count++;
      }
      return  split_count;
    }

    static void _mqtt_callback_wrapper(MQTTClient* client, char* topic, char* payload, int length) {
      // use global variable to access member function by casting it first
      // http://www.newty.de/fpt/callback.html#static
      ((MySensors*)mqtt_cb_obj)->_mqtt_callback(topic, payload, length);
    }

    void _mqtt_callback(char* topic, char* payload, int length) {
      _split_message(topic, "/");
      uint8_t node_id = atoi(_mqtt_split_buff[1]);
      uint8_t child_id = atoi(_mqtt_split_buff[2]);
      uint8_t cmd_type = atoi(_mqtt_split_buff[3]);
      uint8_t ack = atoi(_mqtt_split_buff[4]);
      uint8_t sub_type = atoi(_mqtt_split_buff[5]);

      // treat internal stuff here
      if(cmd_type == M_INTERNAL) {
        switch (sub_type) {
          case I_PRESENTATION:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_PRESENTATION internal command on topic: %s\r\n", topic);
            #endif
            if (_send_presentation_cb) {
              _send_presentation_cb();
            }
            break;
          case I_DISCOVER_REQUEST:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_DISCOVER_REQUEST internal command on topic: %s\r\n", topic);
            #endif
            _send_discovery_response();
            break;
          case I_HEARTBEAT_REQUEST:
            #ifdef DEBUG
            DEBUG_OUTPUT.printf("Received I_HEARTBEAT_REQUEST internal command on topic: %s\r\n", topic);
            #endif
            _send_heartbeat();
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

      MySensorsMsg msg_data;
      msg_data.node_id = node_id;
      msg_data.child_id = child_id;
      msg_data.cmd_type = cmd_type;
      msg_data.ack = ack;
      msg_data.sub_type = sub_type;
      memset(msg_data.payload, '\0', MQTT_MAX_PAYLOAD_LENGTH);
      strncpy(msg_data.payload, (char*)payload, length);
      if (_on_msg_cb) {
        _on_msg_cb(msg_data);
      }
    }

    void _mys_mycontroller_out(MySensorsMsg& data) {
      char mqtt_topic[128];
      snprintf(mqtt_topic,
              sizeof(mqtt_topic),
              "%s/%d/%d/%d/%d/%d",
              _mqtt_cfg->mqtt_out_topic_prefix,
              data.node_id,
              data.child_id,
              data.cmd_type,
              data.ack,
              data.sub_type);

      if(_mqtt.connected()) {
        #ifdef DEBUG
        DEBUG_OUTPUT.printf("Publishing: %s on topic: %s\r\n", data.payload, mqtt_topic);
        #endif
        _mqtt.publish(mqtt_topic, data.payload);
      }
    }

    void _send_heartbeat(uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%lu", millis());

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_HEARTBEAT_RESPONSE, payload, ack);
    }

    void _send_discovery_response(uint8_t parent_node_id = 0, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      snprintf(payload, MQTT_MAX_PAYLOAD_LENGTH, "%d", parent_node_id);

      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_DISCOVER_RESPONSE, payload, ack);
    }

    void _send_presentation(const uint8_t sensor_id, const uint8_t sub_type, const char* sensor_alias, uint8_t ack = 0) {
      char payload[MQTT_MAX_PAYLOAD_LENGTH];
      strncpy(payload, sensor_alias, MQTT_MAX_PAYLOAD_LENGTH);

      _send(_node_id, sensor_id, M_PRESENTATION, sub_type, payload, ack);
    }

    void _send(uint8_t node_id, uint8_t child_sensor_id, uint8_t cmd_type, uint8_t variable_type, const char* payload, uint8_t ack = 0) {
      MySensorsMsg data;
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
