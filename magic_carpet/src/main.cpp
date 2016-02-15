#include <Arduino.h>
#include <MPR121.h>
#include <Wire.h>
#include <LowPower.h>

#define DEBUG

const uint8_t TOUCH_CHANNELS = 12;
const uint8_t MPR121_I2C_ADDRESS = 0x5A;
const uint8_t MPR121_INTERRUPT_PIN = 2;
const uint8_t MPR121_TOUCH_THRESHOLD = 2;
const uint8_t MPR121_RELEASE_THRESHOLD = 1;

const uint8_t LED1_PIN = 4;
const uint8_t LED2_PIN = 5;

const uint8_t TOUCH_CHANNEL_MAX_COMBINATIONS = 2;
const uint8_t TOUCH_CHANNELS_MATRIX[][TOUCH_CHANNEL_MAX_COMBINATIONS] = {
  {5, 10},
  {5, 11},
  {8, 10}
};

static uint8_t currentTouchData[TOUCH_CHANNEL_MAX_COMBINATIONS] = { 0, 0 };

void setup() {
  #ifdef DEBUG
  Serial.begin(9600);
  #endif

  pinMode(LED1_PIN, OUTPUT);
  pinMode(LED2_PIN, OUTPUT);

  Wire.begin();

  if(!MPR121.begin(MPR121_I2C_ADDRESS)){
    #ifdef DEBUG
    Serial.print(F("MPR121 init failed! "));
    #endif
    while(true) {
      digitalWrite(LED1_PIN, !digitalRead(LED1_PIN));
      digitalWrite(LED2_PIN, !digitalRead(LED2_PIN));
      LowPower.powerDown(SLEEP_500MS, ADC_OFF, BOD_OFF);
    }
  }

  MPR121.setInterruptPin(MPR121_INTERRUPT_PIN);

  // touch threshold - lower means more sensitivity
  MPR121.setTouchThreshold(MPR121_TOUCH_THRESHOLD);

  // release threshold - must ALWAYS be smaller than the touch threshold
  MPR121.setReleaseThreshold(MPR121_RELEASE_THRESHOLD);

  // initial data update
  MPR121.updateTouchData();
}

static uint8_t pushTouchChannel(uint8_t channel) {
  static uint8_t touchDataIndex = 0;
  static uint8_t channelDataCount = 0;

  currentTouchData[touchDataIndex] = channel;
  ++channelDataCount;

  if(++touchDataIndex >= TOUCH_CHANNEL_MAX_COMBINATIONS) {
    touchDataIndex = 0;
    channelDataCount = 0;
  }

  return channelDataCount;
}

static int8_t checkTouchCombination() {
  uint8_t matches = 0;

  for (uint8_t i = 0; i < (sizeof(TOUCH_CHANNELS_MATRIX) / TOUCH_CHANNEL_MAX_COMBINATIONS); i++) {
    for (uint8_t j = 0; j < TOUCH_CHANNEL_MAX_COMBINATIONS; j++) {
      if(currentTouchData[j] == TOUCH_CHANNELS_MATRIX[i][j]) {
        if(++matches == TOUCH_CHANNEL_MAX_COMBINATIONS) {
          return (int8_t)i;
        }
      }
    }
  }

  return -1;
}

static void resetTouchDataBuffer() {
  for(uint8_t i = 0; i < TOUCH_CHANNEL_MAX_COMBINATIONS; i++) {
    currentTouchData[i] = 0;
  }
}

static void checkMPR121Touch() {
  if(MPR121.touchStatusChanged()){
    MPR121.updateTouchData();
    for(uint8_t channel = 0; channel < TOUCH_CHANNELS; channel++) {
      if(MPR121.isNewTouch(channel)){
        #ifdef DEBUG
        Serial.print(F("electrode "));
        Serial.print(channel, DEC);
        Serial.println(F(" touched "));
        #endif
      } else if(MPR121.isNewRelease(channel)){
        #ifdef DEBUG
        Serial.print(F("electrode "));
        Serial.print(channel, DEC);
        Serial.println(F(" released"));
        #endif
        // check if channel data buffer is filled
        // we need to get 2 consecutive readings before continuing
        if(pushTouchChannel(channel) == TOUCH_CHANNEL_MAX_COMBINATIONS) {
          // we got 2 consecutive readings - check if it's a known combination
          int8_t combination = checkTouchCombination();
          if(combination >= 0) {
            #ifdef DEBUG
            Serial.print(F("Found combination index: "));
            Serial.println(combination);
            #endif
          }
          resetTouchDataBuffer();
        }
      }
    }
  }
}

void loop() {
  checkMPR121Touch();
}
