/*
  Morse.h - Library for Livolo wireless switches.
  Created by Sergey Chernov, October 25, 2013.
  Released into the public domain.
*/

#ifndef Livolo_h
#define Livolo_h

#include "Arduino.h"

#define regtype volatile uint8_t
#define regsize uint8_t

#define cbi(reg, bitmask) *reg &= ~bitmask
#define sbi(reg, bitmask) *reg |= bitmask

const byte DEFAULT_RETRIES = 180;

class Livolo
{
  public:
    Livolo(byte pin);
    void sendButton(unsigned int remoteID, byte keycode, byte retries = DEFAULT_RETRIES);
  private:
    regtype* txPinPort;
    regsize txPinBitMask;
    byte txPin;
	byte i; // just a counter
	byte pulse; // counter for command repeat
	boolean high; // pulse "sign"
	void selectPulse(byte inBit);
	void sendPulse(byte txPulse);
};

#endif
