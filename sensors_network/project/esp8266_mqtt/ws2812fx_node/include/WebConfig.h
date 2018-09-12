#ifndef WEBCONFIG_H
#define WEBCONFIG_H

#include <Arduino.h>
#include <ESP8266WebServer.h>
#include "Utils.h"
#include "AppConfig.h"
#include "common.h"

namespace WebConfig {
  AppCfg* _appCfg = NULL;
  ESP8266WebServer server(HTTP_CFG_SERVER_PORT);

  void begin(AppCfg* appCfg) {
    _appCfg = appCfg;

    if (!_appCfg) {
      #ifdef DEBUG
        DEBUG_OUTPUT.printf(
          "[WebConfig] Received invalid configuration data, delaying for 3s!\r\n");
        delay(3000);
      #endif
      return;
    }

    server.on("/", []() {
      String index_html = R"=====(
        <!DOCTYPE html><html lang="en"> <head> <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/> <title>Config</title> <style>div, input{padding: 5px; font-size: 1em;}input{width: 95%;}body{text-align: center; font-family: verdana;}button{border: 0; border-radius: 0.3rem; background-color: #1fa3ec; color: #fff; line-height: 2.4rem; font-size: 1.2rem; width: 100%;}</style> </head> <body> <div> <form method='get' action='save'> <p>MySensors</p><input id='mys_node_id' name='mys_node_id' length=4 placeholder='<your node id here>' value='{mys_node_id}'><br/> <input id='mys_node_alias' name='mys_node_alias' length=32 placeholder='<your node alias here>' value='{mys_node_alias}'><br/> <input id='mys_node_led_count' name='mys_node_led_count' length=4 placeholder='<number of leds>' value='{mys_node_led_count}'><br/> <p>MQTT</p><input id='mqtt_server' name='mqtt_server' length=16 placeholder='<broker ip here>' value='{mqtt_server}'><br/> <input id='mqtt_port' name='mqtt_port' length=5 placeholder='<broker port here>' value='{mqtt_port}'><br/> <input id='mqtt_user' name='mqtt_user' length=32 placeholder='<broker user here>' value='{mqtt_user}'><br/> <input id='mqtt_passwd' name='mqtt_passwd' length=32 type='password' placeholder='<broker password here>' value='{mqtt_passwd}'><br/> <input id='mqtt_in_topic_prefix' name='mqtt_in_topic_prefix' length=128 placeholder='<mqtt in topic prefix here>' value='{mqtt_in_topic_prefix}'><br/> <input id='mqtt_out_topic_prefix' name='mqtt_out_topic_prefix' length=128 placeholder='<mqtt out topic prefix here>' value='{mqtt_out_topic_prefix}'><br/><br/> <button type='submit'>save</button> </form> <div><h4>Uptime:{uptime}</h4><h4>Core version: {core_version}</h4></div></div></body></html>
      )=====";

      index_html.replace("{mys_node_id}", _appCfg->mys_node_id);
      index_html.replace("{mys_node_alias}", _appCfg->mys_node_alias);
      index_html.replace("{mys_node_led_count}", _appCfg->mys_node_led_count);

      index_html.replace("{mqtt_server}", _appCfg->mqtt_server);
      index_html.replace("{mqtt_port}", _appCfg->mqtt_port);
      index_html.replace("{mqtt_user}", _appCfg->mqtt_user);
      index_html.replace("{mqtt_passwd}", _appCfg->mqtt_passwd);
      index_html.replace("{mqtt_in_topic_prefix}", _appCfg->mqtt_in_topic_prefix);
      index_html.replace("{mqtt_out_topic_prefix}", _appCfg->mqtt_out_topic_prefix);

      char uptime_buff[128];
      memset(uptime_buff, '\0', sizeof(uptime_buff));
      index_html.replace("{uptime}", Utils::timeToString(uptime_buff, sizeof(uptime_buff)));
      index_html.replace("{core_version}", ESP.getCoreVersion());
      server.send(200, "text/html", index_html);
    });

    server.on("/save", []() {
      if (server.args() == 0) {
        return server.send(500, "text/plain", "BAD ARGS");
      }

      if(server.hasArg("mys_node_id")) {
        strncpy(_appCfg->mys_node_id, server.arg("mys_node_id").c_str(), MYS_NODE_ID_FIELD_MAX_LEN);
      }

      if(server.hasArg("mys_node_alias")) {
        strncpy(_appCfg->mys_node_alias, server.arg("mys_node_alias").c_str(), MYS_NODE_ALIAS_FIELD_MAX_LEN);
      }

      if(server.hasArg("mys_node_led_count")) {
        strncpy(_appCfg->mys_node_led_count, server.arg("mys_node_led_count").c_str(), MYS_NODE_LED_COUNT_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_server")) {
        strncpy(_appCfg->mqtt_server, server.arg("mqtt_server").c_str(), MQTT_SERVER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_port")) {
        strncpy(_appCfg->mqtt_port, server.arg("mqtt_port").c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_user")) {
        strncpy(_appCfg->mqtt_user, server.arg("mqtt_user").c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_passwd")) {
        strncpy(_appCfg->mqtt_passwd, server.arg("mqtt_passwd").c_str(), MQTT_PASS_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_in_topic_prefix")) {
        strncpy(_appCfg->mqtt_in_topic_prefix, server.arg("mqtt_in_topic_prefix").c_str(), MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_out_topic_prefix")) {
        strncpy(_appCfg->mqtt_out_topic_prefix, server.arg("mqtt_out_topic_prefix").c_str(), MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);
      }

      AppConfig::save(CONFIG_FILE, _appCfg);

      server.send(200, "text/html", "<h3>Settings saved! Restarting ...</h3>");
      delay(1000);
      ESP.restart();
    });

    server.begin();
  }

  void loop() {
    server.handleClient();
  }
}

#endif
