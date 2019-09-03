#ifndef APPCONFIG_H
#define APPCONFIG_H

#include <Arduino.h>
#include <FS.h>
#include <ArduinoJson.h>

#define JSON_FILE_BUFFER_SIZE 512
#define MQTT_SERVER_FIELD_MAX_LEN 40
#define MQTT_USER_FIELD_MAX_LEN 40
#define MQTT_PASS_FIELD_MAX_LEN 40
#define MQTT_PORT_FIELD_MAX_LEN 6
#define MQTT_TOPIC_FIELD_MAX_LEN 40


typedef struct {
  char mqtt_server[MQTT_SERVER_FIELD_MAX_LEN];
  char mqtt_user[MQTT_USER_FIELD_MAX_LEN];
  char mqtt_passwd[MQTT_PASS_FIELD_MAX_LEN];
  char mqtt_port[MQTT_PORT_FIELD_MAX_LEN];
  char zone_1_mqtt_topic[MQTT_TOPIC_FIELD_MAX_LEN];
  char zone_2_mqtt_topic[MQTT_TOPIC_FIELD_MAX_LEN];
} AppCfg;


namespace AppConfig {
  AppCfg _cfgData = {0};
  bool _initialized = false;

  bool load(const char *cfgFilePath) {
    if(!cfgFilePath) {
      return false;
    }

    if (!SPIFFS.begin()) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] SPIFFS mount failed!"));
    #endif
      return false;
    }

    if (!SPIFFS.exists(cfgFilePath)) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] JSON configuration file wasn't found!"));
    #endif
      SPIFFS.end();
      return false;
    }

    File configFile = SPIFFS.open(cfgFilePath, "r");
    if (!configFile) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] JSON configuration file couldn't be opened!"));
    #endif
      SPIFFS.end();
      return false;
    }

  #ifdef DEBUG
    DEBUG_OUTPUT.println(F("[AppConfig] Configuration file found!"));
  #endif
    StaticJsonDocument<JSON_FILE_BUFFER_SIZE> json;
    // Deserialize the JSON document
    DeserializationError deserializationError = deserializeJson(json, configFile);
    if (deserializationError) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] Failed to deserialize JSON configuration file!"));
    #endif
      configFile.close();
      SPIFFS.end();
      return false;
    }

    strncpy(_cfgData.mqtt_server, json["mqtt_server"], MQTT_SERVER_FIELD_MAX_LEN);
    strncpy(_cfgData.mqtt_user, json["mqtt_user"], MQTT_USER_FIELD_MAX_LEN);
    strncpy(_cfgData.mqtt_passwd, json["mqtt_passwd"], MQTT_PASS_FIELD_MAX_LEN);
    strncpy(_cfgData.mqtt_port, json["mqtt_port"], MQTT_PORT_FIELD_MAX_LEN);
    strncpy(_cfgData.zone_1_mqtt_topic, json["zone_1_mqtt_topic"], MQTT_TOPIC_FIELD_MAX_LEN);
    strncpy(_cfgData.zone_2_mqtt_topic, json["zone_2_mqtt_topic"], MQTT_TOPIC_FIELD_MAX_LEN);

    configFile.close();
    SPIFFS.end();

    return true;
  }

  bool save(const char *cfgFilePath, AppCfg* cfgData) {
    if(!cfgData) {
      return false;
    }

    if (!SPIFFS.begin()) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] SPIFFS mount failed!"));
    #endif
      return false;
    }

    if (!SPIFFS.exists(cfgFilePath)) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] JSON configuration file wasn't found!"));
    #endif
      SPIFFS.end();
      return false;
    }

    File configFile = SPIFFS.open(cfgFilePath, "w");
    if (!configFile) {
    #ifdef DEBUG
      DEBUG_OUTPUT.println(F("[AppConfig] JSON configuration file couldn't be opened!"));
    #endif
      SPIFFS.end();
      return false;
    }

  #ifdef DEBUG
    DEBUG_OUTPUT.println(F("[AppConfig] JSON configuration file found!"));
  #endif

    StaticJsonDocument<JSON_FILE_BUFFER_SIZE> json;

    json["mqtt_server"] = cfgData->mqtt_server;
    json["mqtt_user"] = cfgData->mqtt_user;
    json["mqtt_passwd"] = cfgData->mqtt_passwd;
    json["mqtt_port"] = cfgData->mqtt_port;
    json["zone_1_mqtt_topic"] = cfgData->zone_1_mqtt_topic;
    json["zone_2_mqtt_topic"] = cfgData->zone_2_mqtt_topic;

    // Serialize JSON to file
   if (serializeJson(json, configFile) == 0) {
   #ifdef DEBUG
    DEBUG_OUTPUT.println(F("[AppConfig] Failed to serialize JSON configuration file!"));
   #endif
     configFile.close();
     SPIFFS.end();
     return false;
   }

    configFile.close();
    SPIFFS.end();
    return true;
  }


  AppCfg* getConfig() {
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
