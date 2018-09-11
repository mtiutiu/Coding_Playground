#ifndef OTA_H
#define OTA_H

#include <Arduino.h>
#include <ArduinoOTA.h>
#include <FS.h>
#include "common.h"

namespace Ota {
  bool otaInProgress = false;

  bool inProgress() {
    return otaInProgress;
  }

  void handle() {
    ArduinoOTA.handle();
  }

  ArduinoOTAClass& getInstance() {
    return ArduinoOTA;
  }

  void init() {
    ArduinoOTA.setHostname(HOSTNAME);
    ArduinoOTA.setPort(OTA_PORT);
    ArduinoOTA.setRebootOnSuccess(true);

    ArduinoOTA.onStart([]() {
      if (ArduinoOTA.getCommand() == U_FLASH) {
    #ifdef DEBUG
        DEBUG_OUTPUT.println("Start updating flash ...");
    #endif
      } else {
    #ifdef DEBUG
        DEBUG_OUTPUT.println("Start updating filesystem (SPIFFS) ...");
    #endif
        // Unmount SPIFFS using SPIFFS.end() first
        SPIFFS.end();
      }
      otaInProgress = true;
    });
    ArduinoOTA.onEnd([]() {
    #ifdef DEBUG
      DEBUG_OUTPUT.println("\nOTA finished.");
    #endif
      otaInProgress = false;
    });
    ArduinoOTA.onProgress([](uint16_t progress, uint16_t total) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf("Progress: %u%%\r", (progress / (total / 100)));
    #endif
      otaInProgress = true;
    });
    ArduinoOTA.onError([](ota_error_t error) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf("Error[%u]: ", error);
      if (error == OTA_AUTH_ERROR) DEBUG_OUTPUT.println("Auth Failed");
      else if (error == OTA_BEGIN_ERROR) DEBUG_OUTPUT.println("Begin Failed");
      else if (error == OTA_CONNECT_ERROR) DEBUG_OUTPUT.println("Connect Failed");
      else if (error == OTA_RECEIVE_ERROR) DEBUG_OUTPUT.println("Receive Failed");
      else if (error == OTA_END_ERROR) DEBUG_OUTPUT.println("End Failed");
    #endif
      ESP.restart();
    });

    ArduinoOTA.begin();
  }
}

#endif
