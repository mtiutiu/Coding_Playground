#ifndef ADAFRUIT_FASTLED
#define ADAFRUIT_FASTLED

#include <FastLED.h>

class Adafruit_NeoPixelFastLED {
 private:
  CRGB* _leds;
  
 public:
    Adafruit_NeoPixelFastLED(CRGB* leds) : _leds(leds) {
    }
    
    void begin() {
      
    }
    
    void show() {
      FastLED.show();
    }
    
    void setPixelColor(uint16_t n, uint32_t c) {
      _leds[n] = c;
    }
    
    void setPixelColor(uint16_t n, uint8_t r, uint8_t g, uint8_t b) {
      _leds[n].r = r;
      _leds[n].g = g;
      _leds[n].b = b;
    }
    
    void setBrightness(uint8_t b) {
      FastLED.setBrightness(b);
    }
    
    void clear(bool writeData = false) {
      FastLED.clear(writeData);
    }
    
    uint32_t getPixelColor(uint16_t n) {
      return _leds[n];
    }
};

#endif
