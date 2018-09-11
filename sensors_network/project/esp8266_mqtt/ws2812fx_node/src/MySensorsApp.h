#ifndef MYSENSORS_APP_H
#define MYSENSORS_APP_H

#include <Arduino.h>
#include <MTypes.h>
#include <MySensors.h>
#include "LedStrip.h"

// enable reading of Vcc
ADC_MODE(ADC_VCC);

namespace MySensorsApp {
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

  const uint8_t RGB_SENSOR_ID = 1;

  MySensors mysNode;
  AppCfg* _appCfg;
  MqttCfg _mqtt_cfg;

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

  void sendLedStripState() {
    char reply[MQTT_MAX_PAYLOAD_LENGTH];

    snprintf(
      reply,
      MQTT_MAX_PAYLOAD_LENGTH,
      "%02x%02x%02x",
      (uint8_t)((LedStrip::getInstance().getColor() & 0x00FF0000) >> 16),
      (uint8_t)((LedStrip::getInstance().getColor() & 0x0000FF00) >> 8),
      (uint8_t)((LedStrip::getInstance().getColor() & 0x000000FF) >> 0)
    );
    mysNode.send(RGB_SENSOR_ID, V_RGB, reply);

    uint8_t currentLedStripBrightness =
      round((LedStrip::getInstance().getBrightness() * 100.0) / LedStrip::BRIGHTNESS_MAX_VALUE);
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripBrightness);
    mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);

    uint8_t currentLedStripSpeed =
      round((LedStrip::getInstance().getSpeed() * 100.0) / LedStrip::SPEED_MAX_VALUE);
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripSpeed);
    mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);

    uint8_t currentLedStripMode = LedStrip::getInstance().getMode();
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripMode);
    mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);

    uint8_t currentLedStripState = LedStrip::isRunning();
    snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripState);
    mysNode.send(RGB_SENSOR_ID, V_STATUS, reply);
  }

  void sendSensorState() {
    sendLedStripState();
  }

  void sendReports() {
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
    mysNode.present(RGB_SENSOR_ID, S_RGB_LIGHT, "RGB");
  }

  void onMessage(MySensorsMsg &message) {
    char reply[MQTT_MAX_PAYLOAD_LENGTH];

    if (message.cmd_type == M_SET) {
      if (strlen(message.payload) > 0) {
      #ifdef DEBUG
        DEBUG_OUTPUT.printf(
          "Received M_SET command with value: %s\r\n",
          message.payload
        );
      #endif
        if (message.sub_type == V_RGB) {
          if (!LedStrip::isRunning()) {
            return;
          }

          LedStrip::getInstance().setColor(strtoul(message.payload, NULL, 16));
          LedStrip::getInstance().trigger();
          mysNode.send(RGB_SENSOR_ID, V_RGB, message.payload);
        } else if (message.sub_type == V_LIGHT_LEVEL) {
          if (!LedStrip::isRunning()) {
            return;
          }

          uint16_t brightnessPercentage = (uint16_t)atoi(message.payload);
          if ((brightnessPercentage >= 0) && (brightnessPercentage <= 100)) {
            LedStrip::getInstance().setBrightness(
              round((brightnessPercentage * LedStrip::BRIGHTNESS_MAX_VALUE) / 100.0)
            );
            LedStrip::getInstance().trigger();
            snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", brightnessPercentage);
            mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);
          }
        } else if (message.sub_type == V_PERCENTAGE) {
          if (!LedStrip::isRunning()) {
            return;
          }

          uint16_t speedPercentage = (uint16_t)atoi(message.payload);
          if ((speedPercentage >= 0) && (speedPercentage <= 100)) {
            LedStrip::getInstance().setSpeed(round((speedPercentage * LedStrip::SPEED_MAX_VALUE) / 100.0));
            LedStrip::getInstance().trigger();
            snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", speedPercentage);
            mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);
          }
        } else if (message.sub_type == V_CUSTOM) {
          if (!LedStrip::isRunning()) {
            return;
          }

          uint16_t modeSetting = (uint16_t)atoi(message.payload);
          if ((modeSetting >= LedStrip::MODE_MIN_VALUE) &&
              (modeSetting < LedStrip::getInstance().getModeCount())) {
            LedStrip::getInstance().setMode(modeSetting);
            LedStrip::getInstance().trigger();
            snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", modeSetting);
            mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);
          }
        } else if (message.sub_type == V_STATUS) {
          uint16_t newLedStripState = (uint16_t)atoi(message.payload);
          if ((newLedStripState == LedStrip::OFF) && (LedStrip::isRunning())) {
            LedStrip::saveSettings(); // save current settings

            // turn OFF rgb led strip
            LedStrip::stop();
      		  #ifdef HAS_BTN_LED
      		  digitalWrite(BTN_LED_PIN, HIGH);
      		  #endif
          }

          if ((newLedStripState == LedStrip::ON) && (!LedStrip::isRunning())) {
            // load rgb led strip saved settings
            LedStrip::loadSettings();
            LedStrip::start();
      		  #ifdef HAS_BTN_LED
      		  digitalWrite(BTN_LED_PIN, LOW);
      		  #endif
          }
        }
        sendLedStripState();
      }
    }
  }

  bool connected() {
    return mysNode.connected();
  }

  void loop() {
    mysNode.loop();
  }

  void init(AppCfg* appCfg) {
    _appCfg = appCfg;

    if (!_appCfg) {
      #ifdef DEBUG
        DEBUG_OUTPUT.printf(
          "[MySensorsApp] Received invalid configuration data, delaying for 3s!\r\n");
        delay(3000);
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
      DEBUG_OUTPUT.println();
      DEBUG_OUTPUT.println("=== MQTT CONFIG ===");
      DEBUG_OUTPUT.print("MQTT SERVER: ");
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_server);
      DEBUG_OUTPUT.print("MQTT USER: ");
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_user);
      DEBUG_OUTPUT.print("MQTT PASSWORD: ");
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_passwd);
      DEBUG_OUTPUT.print("MQTT PORT: ");
      DEBUG_OUTPUT.println(_mqtt_cfg.mqtt_port);
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
}
#endif
