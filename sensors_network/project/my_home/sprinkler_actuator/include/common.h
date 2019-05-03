#ifndef COMMON_H
#define COMMON_H

#ifndef STASSID
#define STASSID "test"
#define STAPSK  "test1234"
#endif

#ifndef HOSTNAME
#define HOSTNAME  "sprinkler"
#endif
#ifndef OTA_PORT
#define OTA_PORT 8266
#endif

#define CONFIG_FILE "/config.json"

#ifndef HTTP_CFG_SERVER_PORT
#define HTTP_CFG_SERVER_PORT 8080
#endif

#ifndef NODE_NAME
#define NODE_NAME "SprinklerController"
#endif

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#ifndef SPRINKLER_CTRL_RELAY_PIN
#define SPRINKLER_CTRL_RELAY_PIN D2
#endif

#define OFF  0
#define ON   1

#define SPRINKLER_ON()                digitalWrite(SPRINKLER_CTRL_RELAY_PIN, HIGH)
#define SPRINKLER_OFF()               digitalWrite(SPRINKLER_CTRL_RELAY_PIN, LOW)
#define TOGGLE_HEATER()               digitalWrite(SPRINKLER_CTRL_RELAY_PIN, !digitalRead(SPRINKLER_CTRL_RELAY_PIN))
#define GET_SPRINKLER_STATE()         digitalRead(SPRINKLER_CTRL_RELAY_PIN)
#define SET_SPRINKLER_STATE(state)    digitalWrite(SPRINKLER_CTRL_RELAY_PIN, state)
// -----------------------------------------------------------------------------

#endif
