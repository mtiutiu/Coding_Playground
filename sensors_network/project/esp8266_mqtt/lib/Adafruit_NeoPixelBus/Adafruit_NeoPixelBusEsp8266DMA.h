#ifndef ADAFRUIT_NEOPIXELBUS
#define ADAFRUIT_NEOPIXELBUS

#include <NeoPixelBrightnessBus.h>

class Adafruit_NeoPixelBusEsp8266DMA {
  private:
    NeoPixelBrightnessBus<NeoGrbFeature, NeoEsp8266Dma800KbpsMethod> _leds;

 public:
    Adafruit_NeoPixelBusEsp8266DMA(uint16_t countPixels, uint8_t pin) : _leds(countPixels, pin) {}

    void begin() {
      _leds.Begin();
    }

    void show() {
      _leds.Show();
    }

    void setPixelColor(uint16_t n, uint32_t c) {
      RgbColor color;
      color.R = (uint8_t)((c & 0x00FF0000) >> 16);
      color.G = (uint8_t)((c & 0x0000FF00) >> 8);
      color.B = (uint8_t)((c & 0x000000FF) >> 0);

      _leds.SetPixelColor(n, color);
    }

    void setPixelColor(uint16_t n, uint8_t r, uint8_t g, uint8_t b) {
      RgbColor color;
      color.R = r;
      color.G = g;
      color.B = b;

      _leds.SetPixelColor(n, color);
    }

    void setBrightness(uint8_t b) {
      _leds.SetBrightness(b);
    }

    void clear() {
      RgbColor black(0);
      _leds.ClearTo(black);
    }

    uint32_t getPixelColor(uint16_t n) {
      RgbColor pixelColor = _leds.GetPixelColor(n);
      return (pixelColor.R << 16) | (pixelColor.G << 8) | (pixelColor.B << 0);
    }
};

#endif
