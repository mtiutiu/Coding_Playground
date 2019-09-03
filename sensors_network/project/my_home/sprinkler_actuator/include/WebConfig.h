#ifndef WEBCONFIG_H
#define WEBCONFIG_H

#include <Arduino.h>
#include <ESPAsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include <Ticker.h>
#include "Utils.h"
#include "AppConfig.h"
#include "common.h"


namespace WebConfig {
  AppCfg* _appCfg = NULL;
  AsyncWebServer server(HTTP_CFG_SERVER_PORT);
  Ticker restartTicker;

  String htmlProcessor(const String& var) {
    char uptime_buff[128];
    memset(uptime_buff, '\0', sizeof(uptime_buff));

    DEBUG_OUTPUT.print(var);

    if(var == "mqtt_server")
      return String(_appCfg->mqtt_server);
    if(var == "mqtt_port")
      return String(_appCfg->mqtt_port);
    if(var == "mqtt_user")
      return String(_appCfg->mqtt_user);
    if(var == "mqtt_passwd")
      return String(_appCfg->mqtt_passwd);
    if(var == "zone_1_mqtt_topic")
      return String(_appCfg->zone_1_mqtt_topic);
    if(var == "zone_2_mqtt_topic")
      return String(_appCfg->zone_2_mqtt_topic);
    if(var == "uptime")
      return String(Utils::timeToString(uptime_buff, sizeof(uptime_buff)));
    if(var == "core_version")
      return ESP.getCoreVersion();

    return String();
  }

  void init(AppCfg* appCfg) {
    _appCfg = appCfg;

    if (!_appCfg) {
      #ifdef DEBUG
        DEBUG_OUTPUT.println(F("[WebConfig] Received invalid configuration data, aborting!"));
      #endif
      return;
    }

    if (!SPIFFS.begin()) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] SPIFFS mount failed!"));
    #endif
      return;
    }

    server.onNotFound([](AsyncWebServerRequest *request) {
      request->send(404, "text/plain", "Not found");
    });


    server.on("/config", HTTP_GET, [](AsyncWebServerRequest *request) {
      request->send(SPIFFS, "/www/config.html", "text/html", false, htmlProcessor);
    });

    server.on("/save", HTTP_GET, [](AsyncWebServerRequest *request) {
      if (request->params() == 0) {
        return request->send(500, "text/plain", "BAD ARGS");
      }

      if(request->hasParam("mqtt_server")) {
        strncpy(_appCfg->mqtt_server, request->getParam("mqtt_server")->value().c_str(), MQTT_SERVER_FIELD_MAX_LEN);
      }

      if(request->hasParam("mqtt_port")) {
        strncpy(_appCfg->mqtt_port, request->getParam("mqtt_port")->value().c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(request->hasParam("mqtt_user")) {
        strncpy(_appCfg->mqtt_user, request->getParam("mqtt_user")->value().c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(request->hasParam("mqtt_passwd")) {
        strncpy(_appCfg->mqtt_passwd, request->getParam("mqtt_passwd")->value().c_str(), MQTT_PASS_FIELD_MAX_LEN);
      }

      if(request->hasParam("zone_1_mqtt_topic")) {
        strncpy(_appCfg->zone_1_mqtt_topic, request->getParam("zone_1_mqtt_topic")->value().c_str(), MQTT_TOPIC_FIELD_MAX_LEN);
      }

      if(request->hasParam("zone_2_mqtt_topic")) {
        strncpy(_appCfg->zone_2_mqtt_topic, request->getParam("zone_2_mqtt_topic")->value().c_str(), MQTT_TOPIC_FIELD_MAX_LEN);
      }

      AppConfig::save(CONFIG_FILE, _appCfg);

      request->send(200, "text/html", "<h3>Settings saved! System will restart in 3s ...</h3>");
      restartTicker.once_ms(3000, []() {
        #ifdef DEBUG
          DEBUG_OUTPUT.println(F("[WebConfig] Restarting system ..."));
        #endif
        ESP.restart();
      });
    });

    server.begin();
  }

  void loop() {
  }
}

#endif
