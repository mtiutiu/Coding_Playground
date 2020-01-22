#ifndef NODE_CONF_H
#define NODE_CONF_H

#define HOLYIOT_BOARD_TYPE
#define MY_CUSTOM_BOARD_TYPE

#define LIGHT_CHANNELS 1
#define LIGHT_CHANNEL_1_INDEX 0
#define LIGHT_CHANNEL_2_INDEX 1


#if defined(HOLYIOT_BOARD_TYPE)
  // Touch sensor configuration
  #if LIGHT_CHANNELS == 1
    #define S1_LED_PIN 8
    #define TS1_PIN 29
    #define MTSA_PIN 28
    #define MTPM_PIN 30
    #define RELAY1_SET_PIN 0
    #define RELAY1_RESET_PIN 6
  #elif LIGHT_CHANNELS == 2
    #define S1_LED_PIN 18
    #define S2_LED_PIN 5
    #define TS1_PIN 1
    #define TS2_PIN 0
    #define MTSA_PIN 21
    #define MTPM_PIN 15
    #define RELAY1_SET_PIN 6
    #define RELAY1_RESET_PIN 8
    #define RELAY2_SET_PIN 30
    #define RELAY2_RESET_PIN 29
  #else
    #error "Unsupported number of channels!"
  #endif
#elif defined(MY_CUSTOM_BOARD_TYPE)
  #if LIGHT_CHANNELS == 1
    #define S1_LED_PIN 8
    #define TS1_PIN 29
    #define MTSA_PIN 28
    #define RELAY1_SET_PIN 0
    #define RELAY1_RESET_PIN 6
  #elif LIGHT_CHANNELS == 2
    #define S1_LED_PIN 8
    #define S2_LED_PIN 8
    #define TS1_PIN 29
    #define TS2_PIN 29
    #define MTSA_PIN 28
    #define RELAY1_SET_PIN 0
    #define RELAY1_RESET_PIN 6
    #define RELAY2_SET_PIN 0
    #define RELAY2_RESET_PIN 6
  #else
    #error "Unsupported number of channels!"
  #endif
#else
  #error "Unknown board type!"
#endif

#endif
