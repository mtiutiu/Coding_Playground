#ifndef MYSENSORS_NODE_H
#define MYSENSORS_NODE_H

#include <Arduino.h>
#include <MTypes.h>
#include <MySensors.h>
#include "common.h"

// enable reading of Vcc
ADC_MODE(ADC_VCC);

namespace MySensorsNode {
  // -------------------------- BATTERY LEVEL REPORTING --------------------------
  const float VDD_VOLTAGE_MV = 3300.0;
  const uint32_t BATTER_LVL_REPORT_INTERVAL_MS = 300000; // 5 mins
  // -----------------------------------------------------------------------------

  // ------------------------------ RSSI REPORTING -------------------------------
  const uint32_t RSSI_LVL_REPORT_INTERVAL_MS = 600000; // 10 mins
  // -----------------------------------------------------------------------------

  // ------------------------- SENSORS STATE REPORTING ---------------------------
  const uint32_t SENSOR_STATE_REPORT_INTERVAL_MS = 180000; // 3 mins
  // -----------------------------------------------------------------------------

  const uint8_t RELAY_SENSOR_ID = 1;

  MySensors mysNode;
  AppCfg* _appCfg;
  MqttCfg _mqtt_cfg;

  void sendBatteryLevel() {
    uint8_t vccPercent = constrain(round((ESP.getVcc() * 100.0) / VDD_VOLTAGE_MV), 0, 100);
  #ifdef DEBUG
    DEBUG_OUTPUT.printf_P(PSTR("[MySensorsNode] Sending system voltage level: %d%%\r\n"), vccPercent);
  #endif
    mysNode.send_battery_level(vccPercent);
  }

  void sendRSSILevel() {
    char reply[MQTT_MAX_PAYLOAD_LENGTH];
  // mycontroller supports this for now
  #ifdef DEBUG
    DEBUG_OUTPUT.printf_P(PSTR("[MySensorsNode] Sending RSSI level: %d ...\r\n"), WiFi.RSSI());
  #endif
    snprintf_P(reply, MQTT_MAX_PAYLOAD_LENGTH, PSTR("rssi:%d dBm"), WiFi.RSSI());
    mysNode.send(1, V_VAR5, reply);
  }

  void sendSprinklerState() {
    char reply[MQTT_MAX_PAYLOAD_LENGTH];

    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", GET_SPRINKLER_STATE());
    mysNode.send(RELAY_SENSOR_ID, V_STATUS, reply);
  }

  void sendSensorState() {
    if( !mysNode.connected() ) {
      return;
    }

    sendSprinklerState();
  }

  void sendReports() {
    if( !mysNode.connected() ) {
      return;
    }

    static uint32_t lastSensorStateReportTimestamp = millis();
    if ((millis() - lastSensorStateReportTimestamp) >= SENSOR_STATE_REPORT_INTERVAL_MS) {
      sendSensorState();
      lastSensorStateReportTimestamp = millis();
    }

    static uint32_t lastBatteryReportTimestamp = millis();
    if ((millis() - lastBatteryReportTimestamp) >= BATTER_LVL_REPORT_INTERVAL_MS) {
      sendBatteryLevel();
      lastBatteryReportTimestamp = millis();
    }

    static uint32_t lastRssiReportTimestamp = millis();
    if ((millis() - lastRssiReportTimestamp) >= RSSI_LVL_REPORT_INTERVAL_MS) {
      sendRSSILevel();
      lastRssiReportTimestamp = millis();
    }
  }

  void onPresentation() {
    mysNode.send_sketch_name(_appCfg->mys_node_alias);
    mysNode.send_sketch_version();
    mysNode.present(RELAY_SENSOR_ID, S_BINARY, "SprinklerRelay");
  }

  void onMessage(MySensorsMsg &message) {
    //char reply[MQTT_MAX_PAYLOAD_LENGTH];

    if (message.cmd_type == M_SET) {
      if (strlen(message.payload) > 0) {
      #ifdef DEBUG
        DEBUG_OUTPUT.printf_P(PSTR("[MySensorsNode] Received M_SET command with value: %s\r\n"), message.payload);
      #endif
        if (message.sub_type == V_STATUS) {
          uint8_t newState = (uint8_t)atoi(message.payload);
          // check if received data is valid
          if(newState == ON || newState == OFF) {
            SET_SPRINKLER_STATE(newState);
            sendSprinklerState();
          }
        }
      }
    }

    if (message.cmd_type == M_REQ) {
      if (strlen(message.payload) > 0) {
      #ifdef DEBUG
        DEBUG_OUTPUT.printf_P(PSTR("[MySensorsNode] Received M_GET command with value: %s\r\n"), message.payload);
      #endif
        if (message.sub_type == V_STATUS) {
          sendSprinklerState();
        }
      }
    }
  }

  bool connected() {
    return mysNode.connected();
  }

  void init(AppCfg* appCfg) {
    _appCfg = appCfg;

    if (!_appCfg) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[MySensorsNode] Received invalid configuration data, aborting!"));
    #endif
      return;
    }

    _mqtt_cfg = {
      _appCfg->mqtt_server,
      _appCfg->mqtt_user,
      _appCfg->mqtt_passwd,
      (uint16_t)atoi(_appCfg->mqtt_port),
      _appCfg->mqtt_in_topic_prefix,
      _appCfg->mqtt_out_topic_prefix
    };

    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[MySensorsNode] MQTT configuration"));
      DEBUG_OUTPUT.println(F("=== MQTT CONFIG ==="));
      DEBUG_OUTPUT.print(F("MQTT SERVER: "));
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_server);
      DEBUG_OUTPUT.print(F("MQTT USER: "));
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_user);
      DEBUG_OUTPUT.print(F("MQTT PASSWORD: "));
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_passwd);
      DEBUG_OUTPUT.print(F("MQTT PORT: "));
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_port);
      DEBUG_OUTPUT.println(F("[MySensorsNode] End MQTT configuration"));
    #endif

    mysNode.begin((uint8_t)atoi(_appCfg->mys_node_id), &_mqtt_cfg);
    mysNode.register_on_message_cb(onMessage);
    mysNode.register_presentation_cb(onPresentation);

    // send initial reports on node startup
    if (mysNode.connected()) {
      sendSensorState();
      sendBatteryLevel();
      sendRSSILevel();
    }
  }

  void loop() {
    mysNode.loop();
    sendReports();
  }
}
#endif
