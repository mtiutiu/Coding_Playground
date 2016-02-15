//Arduino 1.0+ Only
//Arduino 1.0+ Only

//////////////////////////////////////////////////////////////////
//©2011 bildr
//Released under the MIT License - Please reuse change and share
//////////////////////////////////////////////////////////////////

#include <Arduino.h>
#include <Wire.h>

#ifndef TMP102_H
#define TMP102_H

class Tmp {
  public:
    void init();
    float readTemperature();
};

extern Tmp Tmp102;

#endif
