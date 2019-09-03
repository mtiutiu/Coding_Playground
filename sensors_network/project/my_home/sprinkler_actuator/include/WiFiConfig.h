#ifndef WIFICONFIG_H
#define WIFICONFIG_H

#include <Arduino.h>
#include <Ticker.h>
#include "common.h"
#include <ESPAsyncWebServer.h>
#include <ESPAsyncWiFiManager.h>


// --------------------------- LED SIGNALING ----------------------------------
#define INVERSE_LED_LOGIC

#ifndef WIFI_STATUS_LED_PIN
#define WIFI_STATUS_LED_PIN  LED_BUILTIN
#endif
// -----------------------------------------------------------------------------


namespace WiFiConfig {
  const uint32_t NOT_CONNECTED_SIGNALING_INTERVAL_MS = 100; // 100 ms
  Ticker noWiFiLedTicker;
  AsyncWebServer server(80);
  DNSServer dns;

  void init() {
    pinMode(WIFI_STATUS_LED_PIN, OUTPUT);
    digitalWrite(WIFI_STATUS_LED_PIN,
  #ifdef INVERSE_LED_LOGIC
      HIGH
  #else
      LOW
  #endif
    );

    // WiFi connection signaling
    noWiFiLedTicker.detach();
    noWiFiLedTicker.attach_ms(NOT_CONNECTED_SIGNALING_INTERVAL_MS, []() {
      if (WiFi.status() != WL_CONNECTED) {
        digitalWrite(WIFI_STATUS_LED_PIN, !digitalRead(WIFI_STATUS_LED_PIN));
      } else {
        // make sure led is off when connected
        digitalWrite(WIFI_STATUS_LED_PIN,
      #ifdef INVERSE_LED_LOGIC
          HIGH
      #else
          LOW
      #endif
        );
      }
    });

    AsyncWiFiManager wifiManager(&server, &dns);
    wifiManager.autoConnect("Sprinkler");
  }

  void disableTickers() {
    noWiFiLedTicker.detach();
  }
}

#endif
