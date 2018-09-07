#ifndef LEDSTRIP_H
#define LEDSTRIP_H

#include <Arduino.h>
#include <Ticker.h>
#include <NeoAnimationFX.h>

#include <MySensors.h>
#include <Preferences.h>

//#define INVERSE_SENSOR_LOGIC
// max led count that this node can take
#define MAX_LED_COUNT 300

#ifndef LED_STRIP_DATA_PIN
#define LED_STRIP_DATA_PIN  D3
#endif

const bool OFF = false;
const bool ON = true;

const uint8_t BRIGHTNESS_MIN_VALUE = 0;
const uint8_t BRIGHTNESS_MAX_VALUE = 255;
const uint8_t BRIGHTNESS_DEFAULT_VALUE = 100;
const uint8_t SPEED_MIN_VALUE = 0;
const uint8_t SPEED_MAX_VALUE = 255;
const uint8_t SPEED_DEFAULT_VALUE = 100;
const uint8_t MODE_MIN_VALUE = 0;
const uint8_t MODE_DEFAULT_VALUE = 0;
const uint8_t R_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t R_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t R_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t G_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t G_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t G_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t B_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t B_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t B_COLOR_FIELD_DEFAULT_VALUE = 100;

const uint8_t RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID = 1;
const uint8_t RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID = 2;
const uint8_t RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID = 3;
const uint8_t RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID = 4;
const uint8_t RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID = 5;
const uint8_t RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID = 6;

const float LED_STRIP_UPDATE_INTERVAL_S = 0.04; // 40ms

namespace LedStrip {
  Ticker ledStripUpdateTicker;

  NeoPBBGRB800 strip(MAX_LED_COUNT);
  NeoAnimationFX<NeoPBBGRB800> ws2812fx(strip);


  uint8_t loadState(uint8_t index) {
    return Preferences::hwReadConfig(index);
  }

  void saveState(uint8_t index, uint8_t value) {
    Preferences::hwWriteConfig(index, value);
  }

  void saveSettings() {
    uint32_t color = ws2812fx.getColor();

    saveState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID, ws2812fx.getBrightness());
    saveState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID, ws2812fx.getSpeed());
    saveState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID, ws2812fx.getMode());
    saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x00FF0000) >> 16);
    saveState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x0000FF00) >> 8);
    saveState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x000000FF) >> 0);
  }

  void loadSettings() {
    ws2812fx.setBrightness(
      constrain(loadState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID), BRIGHTNESS_MIN_VALUE, BRIGHTNESS_MAX_VALUE)
    );
    ws2812fx.setSpeed(
      constrain(loadState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID), SPEED_MIN_VALUE, SPEED_MAX_VALUE)
    );
    ws2812fx.setMode(
      constrain(loadState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID), MODE_MIN_VALUE, ws2812fx.getModeCount())
    );
    ws2812fx.setColor(
      constrain(loadState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID), R_COLOR_FIELD_MIN_VALUE, R_COLOR_FIELD_MAX_VALUE),
      constrain(loadState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID), G_COLOR_FIELD_MIN_VALUE, G_COLOR_FIELD_MAX_VALUE),
      constrain(loadState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID), B_COLOR_FIELD_MIN_VALUE, B_COLOR_FIELD_MAX_VALUE)
    );
    ws2812fx.trigger();
  }

  void update() {
    if (ws2812fx.isRunning()) {
      ws2812fx.service();
    }
  }

  void start() {
    ws2812fx.start();
    ledStripUpdateTicker.detach();
    ledStripUpdateTicker.attach(LED_STRIP_UPDATE_INTERVAL_S, update);
  }

  void stop() {
    ledStripUpdateTicker.detach();
    ws2812fx.stop();
    digitalWrite(LED_STRIP_DATA_PIN, LOW);
  }

  bool isRunning() {
    return ws2812fx.isRunning();
  }

  NeoAnimationFX<NeoPBBGRB800>& getInstance() {
    return ws2812fx;
  }

  Ticker& getUpdateTicker() {
    return ledStripUpdateTicker;
  }

  void init(CfgData& cfgData, bool start = false) {
    Preferences::hwInit();

    // led strip init
    uint16_t ledCount = (uint16_t)atoi(cfgData.mys_node_led_count);
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("We have %d leds ...\r\n", ledCount);
  #endif
    ws2812fx.setLength(ledCount);
    ws2812fx.init();

    // load rgb led strip saved settings
    loadSettings();

    if(!start) {
      // start led strip in OFF state
      LedStrip::stop();
    } else {
      LedStrip::start();
    }
  }
}

#endif
