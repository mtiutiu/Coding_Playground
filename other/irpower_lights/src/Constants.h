#ifndef CONSTANTS_H
#define CONSTANTS_H

// ------------------- IR RECEIVER CONSTANTS --------------------------------
const uint8_t IR_SENSOR_RECV_PIN = 4;
const uint16_t IR_DATA_SAMPLE_TIME_MS = 600;
const uint8_t SHORT_KEYPRESS_MIN_THRESHOLD = 1;
const uint8_t SHORT_KEYPRESS_MAX_THRESHOLD = 2;
const uint8_t LONG_KEYPRESS_THRESHOLD = 5;
// --------------------------------------------------------------------------

// ------------------ Power Controller Constants ----------------------------
const uint8_t PWR_DIMMER_CHANNELS_NO = 3;
const uint8_t PWR_DIMMER_CHANNELS_PINS[PWR_DIMMER_CHANNELS_NO] = {5, 6, 7};
// --------------------------------------------------------------------------

#endif
