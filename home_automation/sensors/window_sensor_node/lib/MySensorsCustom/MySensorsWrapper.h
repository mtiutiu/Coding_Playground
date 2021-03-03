#ifndef MY_SENSORS_WRAPPER_H
#define MY_SENSORS_WRAPPER_H

#include <Arduino.h>
#include <MTypes.h>
#include <RFM69.h>

#define GATEWAYID 1
#define MAX_PAYLOAD_LENGTH RF69_MAX_DATA_LEN

class MySensors {
  public:
    MySensors(RFM69 &radioTransport): _radioTransport(radioTransport) {}

    void begin(const uint8_t freqBand, const uint16_t id, const uint8_t networkID) {
      _node_id = id;
      _radioTransport.initialize(freqBand, id, networkID);
    #ifdef RFM69_HIGH_POWER
      _radioTransport.setHighPower(); // Always use this for RFM69HW
    #endif
      _radioTransport.setPowerLevel(31);
    }

    void present(const uint8_t id, const uint8_t sub_type, const char* alias, uint8_t ack = 0) {
      // present this node as a MySensors node first
      _send_presentation(NODE_SENSOR_ID, S_ARDUINO_NODE, "", ack);
      _send_presentation(id, sub_type, alias, ack);
    }

    void send_sketch_name(const char* name, uint8_t ack = 0) {
      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_NAME, name, ack);
    }

    void send_sketch_version(const char* version = "2.0", uint8_t ack = 0) {
      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SKETCH_VERSION, version, ack);
    }

    void send_battery_level(uint8_t batt_lvl_value, uint8_t ack = 0) {
      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_BATTERY_LEVEL, batt_lvl_value, ack);
    }

    void send_signal_strength(uint8_t rssi_value, uint8_t ack = 0) {
      _send(_node_id, NODE_SENSOR_ID, M_INTERNAL, I_SIGNAL_REPORT_RESPONSE, rssi_value, ack);
    }

    void send(uint8_t child_sensor_id, uint8_t sub_type, uint8_t payload, uint8_t ack = 0) {
      _send(_node_id, child_sensor_id, M_SET, sub_type, payload, ack);
    }

    void sleep() {
      _radioTransport.sleep();
    }

  private:
    uint8_t _node_id;
    RFM69& _radioTransport;
    uint8_t NODE_SENSOR_ID = 255;     // special child id used for internal messages
    const uint8_t BROADCAST_NODE_ID = 255;  // special node id used for internal messages

    void _send_presentation(const uint8_t sensor_id, const uint8_t sub_type, const char* sensor_alias, uint8_t ack = 0) {
      _send(_node_id, sensor_id, M_PRESENTATION, sub_type, sensor_alias, ack);
    }

    void _send(uint8_t node_id, uint8_t child_sensor_id, uint8_t cmd_type, uint8_t variable_type, uint8_t payload, uint8_t ack = 0) {
      char message[MAX_PAYLOAD_LENGTH];
      memset(message, '\0', sizeof(message));

      snprintf(message, sizeof(message), "%hhu;%hhu;%hhu;%hhu;%hhu;%hhu", node_id, child_sensor_id, cmd_type, ack, variable_type, payload);
      _radioTransport.sendWithRetry(GATEWAYID, message, sizeof(message));
    }

    void _send(uint8_t node_id, uint8_t child_sensor_id, uint8_t cmd_type, uint8_t variable_type, const char* payload, uint8_t ack = 0) {
      char message[MAX_PAYLOAD_LENGTH];
      memset(message, '\0', sizeof(message));

      snprintf(message, sizeof(message), "%hhu;%hhu;%hhu;%hhu;%hhu;%s", node_id, child_sensor_id, cmd_type, ack, variable_type, payload);
      _radioTransport.sendWithRetry(GATEWAYID, message, sizeof(message));
    }
};
#endif
