#ifndef CONFIGS_H
#define CONFIGS_H

#include <Arduino.h>
#include <FS.h>
#include <ArduinoJson.h>

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

namespace Configs {
  CfgData _cfgData = {0};
  bool _initialized = false;

  bool load(const char *cfgFilePath) {
    bool success = false;

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
          success = false;
        }
      } else {
      // config file not found start portal
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file wasn't found!");
      #endif
        success = false;
      }
      SPIFFS.end();
    } else {
    // fail to mount spiffs
    #ifdef DEBUG
      DEBUG_OUTPUT.println("SPIFFS mount failed!");
    #endif
      success = false;
    }

    success = true;

    return success;
  }

  bool save(const char *cfgFilePath, CfgData* cfgData) {
    if(!cfgData) {
      return false;
    }

    bool success = false;

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

          json["mqtt_server"] = cfgData->mqtt_server;
          json["mqtt_user"] = cfgData->mqtt_user;
          json["mqtt_passwd"] = cfgData->mqtt_passwd;
          json["mqtt_port"] = cfgData->mqtt_port;
          json["mqtt_in_topic_prefix"] = cfgData->mqtt_in_topic_prefix;
          json["mqtt_out_topic_prefix"] = cfgData->mqtt_out_topic_prefix;
          json["mys_node_id"] = cfgData->mys_node_id;
          json["mys_node_alias"] = cfgData->mys_node_alias;
          json["mys_node_led_count"] = cfgData->mys_node_led_count;

          json.printTo(configFile);
          configFile.close();
        } else {
        // config file couldn't be opened
        #ifdef DEBUG
          DEBUG_OUTPUT.println("Config file couldn't be opened!");
        #endif
          success = false;
        }
      } else {
      // config file not found start portal
      #ifdef DEBUG
        DEBUG_OUTPUT.println("Config file wasn't found!");
      #endif
        success = false;
      }
      SPIFFS.end();
    } else {
    // fail to mount spiffs
    #ifdef DEBUG
      DEBUG_OUTPUT.println("SPIFFS mount failed!");
    #endif
      success = false;
    }
    success = true;

    return success;
  }


  CfgData* getConfiguration() {
    return &_cfgData;
  }

  bool initialized() {
    return _initialized;
  }

  bool init() {
    _initialized = load(CONFIG_FILE);
    return _initialized;
  }
}

#endif
