#ifndef NODE_CONF_H
#define NODE_CONF_H

#define NRF52_TS_BOARD_TYPE

#define LIGHT_CHANNELS 1
#define LIGHT_CHANNEL_1_INDEX 0
#define LIGHT_CHANNEL_2_INDEX 1
//#define VSENSE_FEATURE

#if defined(NRF52_TS_BOARD_TYPE)
  #if LIGHT_CHANNELS == 1
    #define S1_LED_PIN 17
    #define TS1_PIN 12
    #ifdef VSENSE_FEATURE
      #define VSENSE_PIN 18
    #endif
    #define RELAY1_SET_PIN 14
    #define RELAY1_RESET_PIN 13
  #elif LIGHT_CHANNELS == 2
    #define S1_LED_PIN 20
    #define S2_LED_PIN 11
    #define TS1_PIN 19
    #define TS2_PIN 17
    #ifdef VSENSE_FEATURE
      #define VSENSE_PIN 22
    #endif
    #define RELAY1_SET_PIN 13
    #define RELAY1_RESET_PIN 12
    #define RELAY2_SET_PIN 15
    #define RELAY2_RESET_PIN 14
  #else
    #error "Unsupported number of channels!"
  #endif
#else
  #error "Unknown board type!"
#endif

#endif
