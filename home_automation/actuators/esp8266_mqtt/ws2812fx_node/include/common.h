#ifndef COMMON_H
#define COMMON_H

#ifndef AP_SSID
#define AP_SSID "WS2812FXController"
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

// max led count that this node can take
#define MAX_LED_COUNT 300

#ifndef LED_STRIP_DATA_PIN
#define LED_STRIP_DATA_PIN  D3
#endif

#endif
