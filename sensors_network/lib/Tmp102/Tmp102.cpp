//Arduino 1.0+ Only
//Arduino 1.0+ Only

//////////////////////////////////////////////////////////////////
//©2011 bildr
//Released under the MIT License - Please reuse change and share
//////////////////////////////////////////////////////////////////

#include "Tmp102.h"

#define TMP_I2C_ADDRESS 72
#define TMP102_TEMP_REG_pointer 0x00

void Tmp::init() {
	Wire.begin();       //Initiate the Wire library and join the I2C bus as a master	
}

float Tmp::readTemperature() {
  Wire.beginTransmission(TMP_I2C_ADDRESS); //now read the temp
  Wire.write(TMP102_TEMP_REG_pointer); // Select temperature register.
  Wire.endTransmission();
  
  Wire.requestFrom(TMP_I2C_ADDRESS, 2); 

  byte MSB = Wire.read();
  byte LSB = Wire.read();

  //it's a 12bit int, using two's compliment for negative
  int16_t temperatureSum = ((MSB << 8) | LSB) >> 4; 

  return ((float)temperatureSum * 0.0625);
}

Tmp Tmp102 = Tmp();










