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
        DEBUG_OUTPUT.println(F("[OTA] Start updating flash ..."));
    #endif
      } else {
    #ifdef DEBUG
        DEBUG_OUTPUT.println(F("[OTA] Start updating filesystem (SPIFFS) ..."));
    #endif
        // Unmount SPIFFS using SPIFFS.end() first
        SPIFFS.end();
      }
      otaInProgress = true;
    });
    ArduinoOTA.onEnd([]() {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("\n[OTA] finished."));
    #endif
      otaInProgress = false;
    });
    ArduinoOTA.onProgress([](uint16_t progress, uint16_t total) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf_P(PSTR("[OTA] Progress: %u%%\r"), (progress / (total / 100)));
    #endif
      otaInProgress = true;
    });
    ArduinoOTA.onError([](ota_error_t error) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf_P(PSTR("[OTA] Error: [%u]"), error);
      if (error == OTA_AUTH_ERROR) DEBUG_OUTPUT.println(F("[OTA] Auth Failed!"));
      else if (error == OTA_BEGIN_ERROR) DEBUG_OUTPUT.println(F("[OTA] Begin Failed!"));
      else if (error == OTA_CONNECT_ERROR) DEBUG_OUTPUT.println(F("[OTA] Connect Failed!"));
      else if (error == OTA_RECEIVE_ERROR) DEBUG_OUTPUT.println(F("[OTA] Receive Failed!"));
      else if (error == OTA_END_ERROR) DEBUG_OUTPUT.println(F("[OTA] End Failed!"));
    #endif
      ESP.restart();
    });

    ArduinoOTA.begin();
  }

  void loop() {
    ArduinoOTA.handle();
  }
}

#endif
