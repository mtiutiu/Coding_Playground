#ifndef WEBCONFIG_H
#define WEBCONFIG_H

#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <FS.h>
#include <ArduinoJson.h>
#include "utils.h"

#define CONFIG_FILE "/config.json"

#ifndef HTTP_PORT
#define HTTP_PORT 8080
#endif

#define MQTT_SERVER_FIELD_MAX_LEN 40
#define MQTT_USER_FIELD_MAX_LEN 40
#define MQTT_PASS_FIELD_MAX_LEN 40
#define MQTT_PORT_FIELD_MAX_LEN 6
#define MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN 40
#define MYS_NODE_ID_FIELD_MAX_LEN 4
#define MYS_NODE_ALIAS_FIELD_MAX_LEN 40
#define MYS_NODE_LED_COUNT_FIELD_MAX_LEN 20

typedef struct {
  char mqtt_server[MQTT_SERVER_FIELD_MAX_LEN];
  char mqtt_user[MQTT_USER_FIELD_MAX_LEN];
  char mqtt_passwd[MQTT_PASS_FIELD_MAX_LEN];
  char mqtt_port[MQTT_PORT_FIELD_MAX_LEN];
  char mqtt_in_topic_prefix[MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mqtt_out_topic_prefix[MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN];
  char mys_node_id[MYS_NODE_ID_FIELD_MAX_LEN];
  char mys_node_alias[MYS_NODE_ALIAS_FIELD_MAX_LEN];
  char mys_node_led_count[MYS_NODE_LED_COUNT_FIELD_MAX_LEN];
} CfgData;

namespace WebConfig {
  CfgData cfgData;
  ESP8266WebServer server(HTTP_PORT);

  void loadConfig(const char *cfgFilePath, CfgData& data) {
    if (SPIFFS.begin()) {
      if (SPIFFS.exists(cfgFilePath)) {
        File configFile = SPIFFS.open(cfgFilePath, "r");
        if (configFile) {
        // read config file
        #ifdef DEBUG
          DEBUG_OUTPUT.println("Config file found!");
        #endif
          size_t cfgFileSize = configFile.size();
          // Allocate a buffer to store contents of the file.
          char* buff = (char*)malloc(cfgFileSize * sizeof(char));
          if(buff) {
            memset(buff, '\0', cfgFileSize);
            configFile.readBytes(buff, cfgFileSize);
          }
          configFile.close();

          DynamicJsonBuffer jsonBuffer;
          JsonObject &json = jsonBuffer.parseObject(buff);
        #ifdef DEBUG
          json.printTo(DEBUG_OUTPUT);
          DEBUG_OUTPUT.println();
        #endif

          strncpy(data.mqtt_server, json["mqtt_server"], MQTT_SERVER_FIELD_MAX_LEN);
          strncpy(data.mqtt_user, json["mqtt_user"], MQTT_USER_FIELD_MAX_LEN);
          strncpy(data.mqtt_passwd, json["mqtt_passwd"], MQTT_PASS_FIELD_MAX_LEN);
          strncpy(data.mqtt_port, json["mqtt_port"], MQTT_PORT_FIELD_MAX_LEN);
          strncpy(data.mqtt_in_topic_prefix, json["mqtt_in_topic_prefix"],
            MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
          );
          strncpy(data.mqtt_out_topic_prefix, json["mqtt_out_topic_prefix"],
            MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
          );
          strncpy(data.mys_node_id, json["mys_node_id"], MYS_NODE_ID_FIELD_MAX_LEN);
          strncpy(data.mys_node_alias, json["mys_node_alias"],
            MYS_NODE_ALIAS_FIELD_MAX_LEN
          );
          strncpy(data.mys_node_led_count, json["mys_node_led_count"],
            MYS_NODE_LED_COUNT_FIELD_MAX_LEN
          );

          // free dynamically allocated buffer for config file contents
          if(buff) {
            free(buff);
          }
        } else {
        // config file couldn't be opened
        #ifdef DEBUG
          DEBUG_OUTPUT.println("Config file couldn't be opened!");
        #endif
        }
      } else {
      // config file not found start portal
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file wasn't found!");
      #endif
      }
      SPIFFS.end();
    } else {
    // fail to mount spiffs
    #ifdef DEBUG
      DEBUG_OUTPUT.println("SPIFFS mount failed!");
    #endif
    }
  }

  void saveConfig(const char *cfgFilePath, CfgData &data) {
    if (SPIFFS.begin()) {
      if (SPIFFS.exists(cfgFilePath)) {
        File configFile = SPIFFS.open(cfgFilePath, "w");
        if (configFile) {
        // read config file
        #ifdef DEBUG
          DEBUG_OUTPUT.println("Config file found!");
        #endif

          DynamicJsonBuffer jsonBuffer;
          JsonObject &json = jsonBuffer.createObject();

          json["mqtt_server"] = data.mqtt_server;
          json["mqtt_user"] = data.mqtt_user;
          json["mqtt_passwd"] = data.mqtt_passwd;
          json["mqtt_port"] = data.mqtt_port;
          json["mqtt_in_topic_prefix"] = data.mqtt_in_topic_prefix;
          json["mqtt_out_topic_prefix"] = data.mqtt_out_topic_prefix;
          json["mys_node_id"] = data.mys_node_id;
          json["mys_node_alias"] = data.mys_node_alias;
          json["mys_node_led_count"] = data.mys_node_led_count;

          json.printTo(configFile);
          configFile.close();
        } else {
        // config file couldn't be opened
        #ifdef DEBUG
          DEBUG_OUTPUT.println("Config file couldn't be opened!");
        #endif
        }
      } else {
      // config file not found start portal
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file wasn't found!");
      #endif
      }
      SPIFFS.end();
    } else {
    // fail to mount spiffs
    #ifdef DEBUG
      DEBUG_OUTPUT.println("SPIFFS mount failed!");
    #endif
    }
  }

  void begin() {
    loadConfig(CONFIG_FILE, cfgData);

    #ifdef DEBUG
      DEBUG_OUTPUT.println();
      DEBUG_OUTPUT.println("=== CONFIG FILE DATA ===");
      DEBUG_OUTPUT.print("MQTT SERVER: ");
      DEBUG_OUTPUT.println(cfgData.mqtt_server);
      DEBUG_OUTPUT.print("MQTT USER: ");
      DEBUG_OUTPUT.println(cfgData.mqtt_user);
      DEBUG_OUTPUT.print("MQTT PASSWORD: ");
      DEBUG_OUTPUT.println(cfgData.mqtt_passwd);
      DEBUG_OUTPUT.print("MQTT PORT: ");
      DEBUG_OUTPUT.println(cfgData.mqtt_port);
    #endif

    server.on("/", []() {
      String index_html = R"=====(
        <!DOCTYPE html><html lang="en"> <head> <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/> <title>Config</title> <style>div, input{padding: 5px; font-size: 1em;}input{width: 95%;}body{text-align: center; font-family: verdana;}button{border: 0; border-radius: 0.3rem; background-color: #1fa3ec; color: #fff; line-height: 2.4rem; font-size: 1.2rem; width: 100%;}</style> </head> <body> <div> <form method='get' action='save'> <p>MySensors</p><input id='mys_node_id' name='mys_node_id' length=4 placeholder='<your node id here>' value='{mys_node_id}'><br/> <input id='mys_node_alias' name='mys_node_alias' length=32 placeholder='<your node alias here>' value='{mys_node_alias}'><br/> <input id='mys_node_led_count' name='mys_node_led_count' length=4 placeholder='<number of leds>' value='{mys_node_led_count}'><br/> <p>MQTT</p><input id='mqtt_server' name='mqtt_server' length=16 placeholder='<broker ip here>' value='{mqtt_server}'><br/> <input id='mqtt_port' name='mqtt_port' length=5 placeholder='<broker port here>' value='{mqtt_port}'><br/> <input id='mqtt_user' name='mqtt_user' length=32 placeholder='<broker user here>' value='{mqtt_user}'><br/> <input id='mqtt_passwd' name='mqtt_passwd' length=32 type='password' placeholder='<broker password here>' value='{mqtt_passwd}'><br/> <input id='mqtt_in_topic_prefix' name='mqtt_in_topic_prefix' length=128 placeholder='<mqtt in topic prefix here>' value='{mqtt_in_topic_prefix}'><br/> <input id='mqtt_out_topic_prefix' name='mqtt_out_topic_prefix' length=128 placeholder='<mqtt out topic prefix here>' value='{mqtt_out_topic_prefix}'><br/><br/> <button type='submit'>save</button> </form> <div><h4>Uptime:{uptime}</h4></div></div></body></html>
      )=====";

      index_html.replace("{mys_node_id}", cfgData.mys_node_id);
      index_html.replace("{mys_node_alias}", cfgData.mys_node_alias);
      index_html.replace("{mys_node_led_count}", cfgData.mys_node_led_count);

      index_html.replace("{mqtt_server}", cfgData.mqtt_server);
      index_html.replace("{mqtt_port}", cfgData.mqtt_port);
      index_html.replace("{mqtt_user}", cfgData.mqtt_user);
      index_html.replace("{mqtt_passwd}", cfgData.mqtt_passwd);
      index_html.replace("{mqtt_in_topic_prefix}", cfgData.mqtt_in_topic_prefix);
      index_html.replace("{mqtt_out_topic_prefix}", cfgData.mqtt_out_topic_prefix);

      char uptime_buff[128];
      memset(uptime_buff, '\0', sizeof(uptime_buff));
      index_html.replace("{uptime}", Utils::timeToString(uptime_buff, sizeof(uptime_buff)));
      server.send(200, "text/html", index_html);
    });

    server.on("/save", []() {
      if (server.args() == 0) {
        return server.send(500, "text/plain", "BAD ARGS");
      }

      if(server.hasArg("mys_node_id")) {
        strncpy(cfgData.mys_node_id, server.arg("mys_node_id").c_str(), MYS_NODE_ID_FIELD_MAX_LEN);
      }

      if(server.hasArg("mys_node_alias")) {
        strncpy(cfgData.mys_node_alias, server.arg("mys_node_alias").c_str(), MYS_NODE_ALIAS_FIELD_MAX_LEN);
      }

      if(server.hasArg("mys_node_led_count")) {
        strncpy(cfgData.mys_node_led_count, server.arg("mys_node_led_count").c_str(), MYS_NODE_LED_COUNT_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_server")) {
        strncpy(cfgData.mqtt_server, server.arg("mqtt_server").c_str(), MQTT_SERVER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_port")) {
        strncpy(cfgData.mqtt_port, server.arg("mqtt_port").c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_user")) {
        strncpy(cfgData.mqtt_user, server.arg("mqtt_user").c_str(), MQTT_USER_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_passwd")) {
        strncpy(cfgData.mqtt_passwd, server.arg("mqtt_passwd").c_str(), MQTT_PASS_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_in_topic_prefix")) {
        strncpy(cfgData.mqtt_in_topic_prefix, server.arg("mqtt_in_topic_prefix").c_str(), MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN);
      }

      if(server.hasArg("mqtt_out_topic_prefix")) {
        strncpy(cfgData.mqtt_out_topic_prefix, server.arg("mqtt_out_topic_prefix").c_str(), MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN);
      }

      saveConfig(CONFIG_FILE, cfgData);

      server.send_P(200, "text/html", "<h3>Settings saved! Restarting ...</h3>");
      delay(1000);
      ESP.restart();
    });

    server.begin();
  }

  CfgData& getConfig() {
    return cfgData;
  }

  void loop() {
    server.handleClient();
  }
}

#endif
