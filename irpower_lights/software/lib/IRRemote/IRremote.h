/*
 * IRremote
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * For details, see http://arcfn.com/2009/08/multi-protocol-infrared-remote-library.htm http://arcfn.com
 *
 * Interrupt code based on NECIRrcv by Joe Knapp
 * http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1210243556
 * Also influenced by http://zovirl.com/2008/11/12/building-a-universal-remote-with-an-arduino/
 *
 * JVC and Panasonic protocol added by Kristian Lauszus (Thanks to zenwheel and other people at the original blog post)
 */

#ifndef IRremote_h
#define IRremote_h

// The following are compile-time library options.
// If you change them, recompile the library.
// If DEBUG is defined, a lot of debugging output will be printed during decoding.
// TEST must be defined for the IRtest unittests to work.  It will make some
// methods virtual, which will be slightly slower, which is why it is optional.
// #define DEBUG
// #define TEST

// Results returned from the decoder
#include <Arduino.h>

class decode_results {
public:
  int16_t decode_type; // NEC, SONY, SAMSUNG, RC5, UNKNOWN
  uint16_t panasonicAddress; // This is only used for decoding Panasonic data
  uint32_t value; // Decoded value
  int16_t bits; // Number of bits in decoded value
  volatile uint16_t *rawbuf; // Raw intervals in .5 us ticks
  int16_t rawlen; // Number of records in rawbuf.
};

// Values for decode_type
#define NEC 1
#define SONY 2
#define RC5 3
#define RC6 4
#define DISH 5
#define SHARP 6
#define PANASONIC 7
#define JVC 8
#define SAMSUNG 9
#define SANYO 10
#define MITSUBISHI 11
#define UNKNOWN -1

// Decoded value for NEC when a repeat code is received
#define REPEAT 0xffffffff

// main class for receiving IR
class IRrecv
{
public:
  IRrecv(uint8_t recvpin);
  void blink13(uint8_t blinkflag);
  uint8_t decode(decode_results *results);
  void enableIRIn();
  void resume();
private:
  // These are called by decode
  int16_t getRClevel(decode_results *results, int16_t *offset, int16_t *used, int16_t t1);
  uint8_t decodeNEC(decode_results *results);
  uint8_t decodeSony(decode_results *results);
  uint8_t decodeRC5(decode_results *results);
  uint8_t decodeRC6(decode_results *results);
  uint8_t decodePanasonic(decode_results *results);
  uint8_t decodeJVC(decode_results *results);
  uint8_t decodeSamsung(decode_results *results);
  uint8_t decodeSanyo(decode_results *results);
  uint8_t decodeMitsubishi(decode_results *results);
  uint8_t decodeHash(decode_results *results);
  int16_t compare(uint16_t oldval, uint16_t newval);

} 
;

// Only used for testing; can remove virtual for shorter code
#ifdef TEST
#define VIRTUAL virtual
#else
#define VIRTUAL
#endif

class IRsend
{
public:
  IRsend() {}
  void sendNEC(uint32_t data, int16_t nbits);
  void sendSony(uint32_t data, int16_t nbits);
  void sendRaw(uint16_t buf[], int16_t len, int16_t hz);
  void sendRC5(uint32_t data, int16_t nbits);
  void sendRC6(uint32_t data, int16_t nbits);
  void sendDISH(uint32_t data, int16_t nbits);
  void sendSharp(uint32_t data, int16_t nbits);
  void sendPanasonic(uint16_t address, uint32_t data);
  void sendJVC(uint32_t data, int16_t nbits, int16_t repeat); // *Note instead of sending the REPEAT constant if you want the JVC repeat signal sent, send the original code value and change the repeat argument from 0 to 1. JVC protocol repeats by skipping the header NOT by sending a separate code value like NEC does.
  void sendSamsung(uint32_t data, int16_t nbits);
  // private:
  void enableIROut(int16_t khz);
  VIRTUAL void mark(int16_t usec);
  VIRTUAL void space(int16_t usec);
}
;

// Some useful constants

#define USECPERTICK 50  // microseconds per clock interrupt tick
#define RAWBUF 100 // Length of raw duration buffer

// Marks tend to be 100us too int32_t, and spaces 100us too short
// when received due to sensor lag.
#define MARK_EXCESS 100

#endif
