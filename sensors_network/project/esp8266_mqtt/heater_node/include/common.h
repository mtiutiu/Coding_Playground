#ifndef COMMON_H
#define COMMON_H

#ifndef AP_SSID
#define AP_SSID "HeaterController"
#endif
#ifndef AP_PASSWD
#define AP_PASSWD "test1234"
#endif

#ifndef HOSTNAME
#define HOSTNAME  AP_SSID
#endif
#ifndef OTA_PORT
#define OTA_PORT 8266
#endif

#define CONFIG_FILE "/config.json"

#ifndef HTTP_CFG_SERVER_PORT
#define HTTP_CFG_SERVER_PORT 8080
#endif

#ifndef NODE_NAME
#define NODE_NAME "HeaterController"
#endif

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#ifndef HEATER_CTRL_RELAY_PIN
#define HEATER_CTRL_RELAY_PIN D2
#endif

#define OFF  0
#define ON   1

#define HEATER_ON()               digitalWrite(HEATER_CTRL_RELAY_PIN, HIGH)
#define HEATER_OFF()              digitalWrite(HEATER_CTRL_RELAY_PIN, LOW)
#define TOGGLE_HEATER()           digitalWrite(HEATER_CTRL_RELAY_PIN, !digitalRead(HEATER_CTRL_RELAY_PIN))
#define GET_HEATER_STATE()        digitalRead(HEATER_CTRL_RELAY_PIN)
#define SET_HEATER_STATE(state)   digitalWrite(HEATER_CTRL_RELAY_PIN, state)
// -----------------------------------------------------------------------------

#endif
