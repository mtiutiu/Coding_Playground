#ifndef WIFICONFIG_H
#define WIFICONFIG_H

#include <Arduino.h>
#include <Ticker.h>
#include "common.h"

#define INVERSE_LED_LOGIC
#ifndef LED_SIGNAL_PIN
#define LED_SIGNAL_PIN  LED_BUILTIN
#endif

namespace WiFiConfig {
  const uint32_t NOT_CONNECTED_SIGNALING_INTERVAL_MS = 300; // 300 ms
  Ticker noTransportLedTicker;

  void checkTransportConnection() {
    if (WiFi.status() != WL_CONNECTED) {
      digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
      // make sure relay turns off for safety when there's no remote control over it
      SPRINKLER_OFF();
    } else {
      // make sure led is off when connected
      digitalWrite(LED_SIGNAL_PIN,
    #ifdef INVERSE_LED_LOGIC
        HIGH
    #else
        LOW
    #endif
      );
    }
  }

  void init() {
    // transport connection signaling
    // enabling this before WiFiManager in order to have visual feedback ASAP
    noTransportLedTicker.detach();
    noTransportLedTicker.attach_ms(
      NOT_CONNECTED_SIGNALING_INTERVAL_MS,
      checkTransportConnection
    );

    WiFi.mode(WIFI_STA);
    WiFi.begin(STASSID, STAPSK);

    #ifdef DEBUG
      DEBUG_OUTPUT.printf("Connecting to WiFi using SSID: %s\r\n", STASSID);
    #endif
    while (WiFi.status() != WL_CONNECTED) {
      delay(1000);
      #ifdef DEBUG
        DEBUG_OUTPUT.print(".");
      #endif
    }
    #ifdef DEBUG
      DEBUG_OUTPUT.printf("Connected to %s\r\n", STASSID);
    #endif
  }

  void disableTickers() {
    noTransportLedTicker.detach();
  }
}

#endif
