#ifndef WIFICONFIG_H
#define WIFICONFIG_H

#include <Arduino.h>
#include <WiFiManager.h>

#ifndef AP_SSID
#define AP_SSID "WS2812FXController"
#endif
#ifndef AP_PASSWD
#define AP_PASSWD "test1234"
#endif

namespace WiFiConfig {
  WiFiManager wifiManager;

  void startWiFiConfig(bool resetCredentials = false) {
    if (resetCredentials) {
  #ifdef DEBUG
      DEBUG_OUTPUT.println(
        "Resetting settings and forcing WiFi config portal to start ..."
      );
  #endif
      wifiManager.resetSettings();
    }

    wifiManager.autoConnect(AP_SSID, AP_PASSWD);
  }
}

#endif
