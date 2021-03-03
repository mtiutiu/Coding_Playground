#ifndef WIFICONFIG_H
#define WIFICONFIG_H

#include <Arduino.h>
#include <ESPAsyncWebServer.h>
#include <ESPAsyncWiFiManager.h>
#include "common.h"

namespace WiFiConfig {
  AsyncWebServer server(80);
  DNSServer dns;
  AsyncWiFiManager wifiManager(&server, &dns);

  void startWiFiConfig() {
    wifiManager.autoConnect(AP_SSID, AP_PASSWD);
  }

  void reset() {
    #ifdef DEBUG
        DEBUG_OUTPUT.println(
          "Resetting settings and forcing WiFi config portal to start ..."
        );
    #endif
        //wifiManager.erase();
        //wifiManager.reboot();
        wifiManager.resetSettings();
  }
}

#endif
