#ifndef LIVOLO_RX
#define LIVOLO_RX

#include <Arduino.h>

// All credits for decoding logic made by daleldalel here - http://forum.arduino.cc/index.php?topic=153525.msg1560970#msg1560970

typedef struct {
  uint32_t id;
  uint32_t key;
} Remote;

namespace LivoloRX {
  volatile uint8_t impulse = 0; // kolejny puls
  volatile int16_t recv_buffer[53];
  volatile bool header = false;
  volatile uint32_t start_period = 0; // set in the interrupt
  volatile bool stop_ints = false;

  void rx_calc() {
    uint32_t duration = (micros() - start_period); // save pulse length to recv_buffer
    start_period = micros(); //begin next impulse
    if (stop_ints) return;
    if ((duration < 90) || (duration > 600)) goto reset; //impulse not right
    recv_buffer[impulse++] = duration;
    if (duration < 415) return;
    if (!header) {
      header = true;
      impulse = 0;
      return;
    } else {
      if ((impulse < 23) || (impulse > 52)) goto reset; //too long or too short info
      stop_ints = true;
      return;
    }
  reset:
    header = false;
    impulse = 0;
    return;
  }

  void init(uint8_t interrupt_pin) {
    attachInterrupt(interrupt_pin, rx_calc, CHANGE);
  }

  bool decode(Remote& remote) {
    bool success = false;

    if (stop_ints) { //data in buffer
      uint32_t binary = 1;

      for (uint8_t j = 0; j < 46; j++) {
        if ((recv_buffer[j] > 220) && (recv_buffer[j] < 400)) {
          binary <<= 1;
          bitSet(binary, 0);
        } else if ((recv_buffer[j] > 90) && (recv_buffer[j] < 220) && (recv_buffer[j + 1] > 90) && (recv_buffer[j + 1] < 220)) {
          binary <<= 1;
          j++;
        } else if ((recv_buffer[j] > 90) && (recv_buffer[j] < 220) && (recv_buffer[j + 1] > 220) && (recv_buffer[j + 1] < 400)) {
          binary <<= 1;
          bitSet(binary, 0);
          j++;
        }
        else break;
      }

      if (bitRead(binary, 23)) {
        bitClear(binary, 23);
        //Serial.print("remoteID:");
        //Serial.print((binary / 128) & 65535);
        remote.id = (binary / 128) & 65535;
        //Serial.print(" - ");
        //Serial.print("key code:");
        //Serial.println(binary & 127);
        remote.key = binary & 127;
        success = true;
      } else {
        remote.id = 0;
        remote.key = 0;
        //Serial.println("wrong code  ");
        //Serial.println(binary, BIN);
        success = false;
      }
      //delay(500);
      header = false;
      impulse = 0;
      stop_ints = false;
    }
    return success;
  }
}

#endif
