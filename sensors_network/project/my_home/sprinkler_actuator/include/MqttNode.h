#ifndef MYSENSORS_NODE_H
#define MYSENSORS_NODE_H

#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <MQTT.h>
#include <Ticker.h>
#include "common.h"

#define MQTT_CLIENT_ID_PREFIX  "sprinkler"
#define MQTT_MAX_PAYLOAD_LENGTH  64
#define MQTT_RECONNECT_INTERVAL_MS 3000

// --------------------------- LED SIGNALING ----------------------------------
#define INVERSE_LED_LOGIC

#ifndef MQTT_STATUS_LED_PIN
#define MQTT_STATUS_LED_PIN  LED_BUILTIN
#endif
// -----------------------------------------------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#ifndef SPRINKLER_CTRL_RELAY_PIN
#define SPRINKLER_CTRL_RELAY_PIN D2
#endif

#define OFF  0
#define ON   1

#define SPRINKLER_ON()                digitalWrite(SPRINKLER_CTRL_RELAY_PIN, HIGH)
#define SPRINKLER_OFF()               digitalWrite(SPRINKLER_CTRL_RELAY_PIN, LOW)
#define TOGGLE_HEATER()               digitalWrite(SPRINKLER_CTRL_RELAY_PIN, !digitalRead(SPRINKLER_CTRL_RELAY_PIN))
#define GET_SPRINKLER_STATE()         digitalRead(SPRINKLER_CTRL_RELAY_PIN)
#define SET_SPRINKLER_STATE(state)    digitalWrite(SPRINKLER_CTRL_RELAY_PIN, state)
// -----------------------------------------------------------------------------


namespace MqttNode {
  const uint32_t NOT_CONNECTED_SIGNALING_INTERVAL_MS = 1000; // 1000 ms
  Ticker noTransportLedTicker;
  AppCfg* _appCfg;
  WiFiClientSecure _net;
  MQTTClient _mqtt;

  void messageReceived(String &topic, String &payload) {
    DEBUG_OUTPUT.printf(PSTR("[MqttNode] Incoming: %s - %s"), topic.c_str(), payload.c_str());
  }

  void init(AppCfg* appCfg) {
    // signaling LED setup
    pinMode(MQTT_STATUS_LED_PIN, OUTPUT);
    digitalWrite(MQTT_STATUS_LED_PIN,
  #ifdef INVERSE_LED_LOGIC
      HIGH
  #else
      LOW
  #endif
    );

    // relay setup
    pinMode(SPRINKLER_CTRL_RELAY_PIN, OUTPUT);
    SPRINKLER_OFF();

    _appCfg = appCfg;

    _net.setInsecure();
    _mqtt.begin(_appCfg->mqtt_server, (uint16_t)atoi(_appCfg->mqtt_port), _net);
    _mqtt.onMessage(messageReceived);

    // MQTT transport connection signaling
    noTransportLedTicker.detach();
    noTransportLedTicker.attach_ms(NOT_CONNECTED_SIGNALING_INTERVAL_MS, []() {
      if (!_mqtt.connected()) {
        digitalWrite(MQTT_STATUS_LED_PIN, !digitalRead(MQTT_STATUS_LED_PIN));
        // make sure relay turns off for safety when there's no remote control over it
        SPRINKLER_OFF();
      } else {
        // make sure led is off when connected
        digitalWrite(MQTT_STATUS_LED_PIN,
      #ifdef INVERSE_LED_LOGIC
          HIGH
      #else
          LOW
      #endif
        );
      }
    });

    if (!_appCfg) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[MqttNode] Received invalid configuration data, aborting!"));
    #endif
      return;
    }

    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[MqttNode] MQTT configuration"));
      DEBUG_OUTPUT.println(F("=== MQTT CONFIG ==="));
      DEBUG_OUTPUT.print(F("MQTT SERVER: "));
      DEBUG_OUTPUT.println(_appCfg->mqtt_server);
      DEBUG_OUTPUT.print(F("MQTT USER: "));
      DEBUG_OUTPUT.println(_appCfg->mqtt_user);
      DEBUG_OUTPUT.print(F("MQTT PASSWORD: "));
      DEBUG_OUTPUT.println(_appCfg->mqtt_passwd);
      DEBUG_OUTPUT.print(F("MQTT PORT: "));
      DEBUG_OUTPUT.println(_appCfg->mqtt_port);
      DEBUG_OUTPUT.println(F("[MqttNode] End MQTT configuration"));
    #endif
  }

  void disableTickers() {
    noTransportLedTicker.detach();
  }

  void loop() {
    static bool needToSubscribeMqtt = false;

    if (!_mqtt.connected()) {
      // reconnect to mqtt
      static uint32_t lastMqttBrokerConnectTimestamp = millis();
      if(millis() - lastMqttBrokerConnectTimestamp >= MQTT_RECONNECT_INTERVAL_MS) {
        #ifdef DEBUG
        DEBUG_OUTPUT.printf(PSTR("Not connected to mqtt broker: %s:%d, retrying ...\r\n"), _appCfg->mqtt_server, (uint16_t)atoi(_appCfg->mqtt_port));
        #endif
        char mqttClientId[40];
        snprintf(mqttClientId, sizeof(mqttClientId), "%s-%lu", MQTT_CLIENT_ID_PREFIX, random(0xFFFF));
        _mqtt.connect(mqttClientId, _appCfg->mqtt_user, _appCfg->mqtt_passwd);
        lastMqttBrokerConnectTimestamp = millis();
      }
      needToSubscribeMqtt = true;
    }

    if(_mqtt.connected() && needToSubscribeMqtt) {
      DEBUG_OUTPUT.printf(PSTR("Connected to mqtt broker: %s:%d!\r\n"), _appCfg->mqtt_server, (uint16_t)atoi(_appCfg->mqtt_port));
      _mqtt.subscribe("/myHome/sprinkler/lock");
      _mqtt.subscribe(_appCfg->zone_1_mqtt_topic);
      _mqtt.subscribe(_appCfg->zone_2_mqtt_topic);

      needToSubscribeMqtt = false;
    }
    _mqtt.loop();
    delay(10);  // for stability after mqtt loop
  }
}
#endif
