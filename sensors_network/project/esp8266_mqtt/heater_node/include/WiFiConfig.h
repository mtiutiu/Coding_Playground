#ifndef WIFICONFIG_H
#define WIFICONFIG_H

#include <Arduino.h>
#include <WiFiManager.h>
#include "common.h"

namespace WiFiConfig {
  WiFiManager wifiManager;

  void startWiFiConfig() {
    wifiManager.autoConnect(AP_SSID, AP_PASSWD);
  }

  void reset() {
    #ifdef DEBUG
        DEBUG_OUTPUT.println(
          "Resetting settings and forcing WiFi config portal to start ..."
        );
    #endif
        wifiManager.erase();
        wifiManager.reboot();
  }
}

#endif
