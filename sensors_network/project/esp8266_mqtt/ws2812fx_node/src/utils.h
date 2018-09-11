#ifndef UTILS_H
#define UTILS_H

#include <Arduino.h>
#include "common.h"

#define STRINGIFY(a) str(a)
#define str(a) #a

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

namespace Utils {
  CfgData _cfgData = {0};

  void loadConfig(const char *cfgFilePath = CONFIG_FILE) {
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

          strncpy(_cfgData.mqtt_server, json["mqtt_server"], MQTT_SERVER_FIELD_MAX_LEN);
          strncpy(_cfgData.mqtt_user, json["mqtt_user"], MQTT_USER_FIELD_MAX_LEN);
          strncpy(_cfgData.mqtt_passwd, json["mqtt_passwd"], MQTT_PASS_FIELD_MAX_LEN);
          strncpy(_cfgData.mqtt_port, json["mqtt_port"], MQTT_PORT_FIELD_MAX_LEN);
          strncpy(_cfgData.mqtt_in_topic_prefix, json["mqtt_in_topic_prefix"],
            MQTT_IN_TOPIC_PREFIX_FIELD_MAX_LEN
          );
          strncpy(_cfgData.mqtt_out_topic_prefix, json["mqtt_out_topic_prefix"],
            MQTT_OUT_TOPIC_PREFIX_FIELD_MAX_LEN
          );
          strncpy(_cfgData.mys_node_id, json["mys_node_id"], MYS_NODE_ID_FIELD_MAX_LEN);
          strncpy(_cfgData.mys_node_alias, json["mys_node_alias"],
            MYS_NODE_ALIAS_FIELD_MAX_LEN
          );
          strncpy(_cfgData.mys_node_led_count, json["mys_node_led_count"],
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

  void saveConfig(const char *cfgFilePath = CONFIG_FILE) {
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

          json["mqtt_server"] = _cfgData.mqtt_server;
          json["mqtt_user"] = _cfgData.mqtt_user;
          json["mqtt_passwd"] = _cfgData.mqtt_passwd;
          json["mqtt_port"] = _cfgData.mqtt_port;
          json["mqtt_in_topic_prefix"] = _cfgData.mqtt_in_topic_prefix;
          json["mqtt_out_topic_prefix"] = _cfgData.mqtt_out_topic_prefix;
          json["mys_node_id"] = _cfgData.mys_node_id;
          json["mys_node_alias"] = _cfgData.mys_node_alias;
          json["mys_node_led_count"] = _cfgData.mys_node_led_count;

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


  CfgData* getConfiguration() {
    return &_cfgData;
  }

  char* timeToString(char* string, size_t size) {
    uint32_t days = 0;
    uint32_t hours = 0;
    uint32_t mins = 0;
    uint32_t secs = 0;

    secs = millis() / 1000; // set the seconds remaining
    mins = secs / 60; //convert seconds to minutes
    hours = mins / 60; //convert minutes to hours
    days = hours / 24; //convert hours to days
    secs = secs - (mins * 60); //subtract the coverted seconds to minutes in order to display 59 secs max
    mins = mins - (hours * 60); //subtract the coverted minutes to hours in order to display 59 minutes max
    hours = hours - (days * 24); //subtract the coverted hours to days in order to display 23 hours max

    snprintf(string, size, "%dd, %dh, %dm, %ds", days, hours, mins, secs);
    return string;
  }

  void init() {
    loadConfig(CONFIG_FILE);
  }
}

#endif
