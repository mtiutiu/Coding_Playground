/*******************************************************************************

Bare Conductive MPR121 library
------------------------------

SimpleTouch.ino - simple MPR121 touch detection demo with serial output

Based on code by Jim Lindblom and plenty of inspiration from the Freescale
Semiconductor datasheets and application notes.

Bare Conductive code written by Stefan Dzisiewski-Smith and Peter Krige.

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0
Unported License (CC BY-SA 3.0) http://creativecommons.org/licenses/by-sa/3.0/

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*******************************************************************************/
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

static void pushTouchChannel(uint8_t channel) {
  static uint8_t touchDataIndex = 0;

  currentTouchData[touchDataIndex] = channel;
  if(++touchDataIndex >= TOUCH_CHANNEL_MAX_COMBINATIONS) {
    touchDataIndex = 0;
  }
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
        pushTouchChannel(channel);
      } else if(MPR121.isNewRelease(channel)){
        #ifdef DEBUG
        Serial.print(F("electrode "));
        Serial.print(channel, DEC);
        Serial.println(F(" released"));
        #endif
        int8_t combination = checkTouchCombination();
        if(combination >= 0) {
          #ifdef DEBUG
          Serial.print(F("Found combination index: "));
          Serial.println(combination);
          #endif
        }
      }
    }
  }
}

void loop() {
  checkMPR121Touch();
}
