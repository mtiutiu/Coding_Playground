/**
 * The MySensors Arduino library handles the wireless radio link and protocol
 * between your home built sensors/actuators and HA controller of choice.
 * The sensors forms a self healing radio network with optional repeaters. Each
 * repeater and gateway builds a routing tables in EEPROM which keeps track of
 *the network topology allowing messages to be routed to nodes.
 *
 * Created by Henrik Ekblad <henrik.ekblad@mysensors.org>
 * Copyright (C) 2013-2019 Sensnology AB
 * Full contributor list:
 *https://github.com/mysensors/MySensors/graphs/contributors
 *
 * Documentation: http://www.mysensors.org
 * Support Forum: http://forum.mysensors.org
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 *******************************/


#define MY_RADIO_RFM69
//#define MY_IS_RFM69HW
#define MY_RFM69_FREQUENCY (RFM69_868MHZ)
#define MY_RFM69_NEW_DRIVER

#ifdef MY_IS_RFM69HW
#define MY_RFM69_TX_POWER_DBM (20)
#else
#define MY_RFM69_TX_POWER_DBM (13)
#endif

// Enable serial gateway
#define MY_GATEWAY_SERIAL

// Define a lower baud rate for Arduinos running on 8 MHz (Arduino Pro Mini 3.3V
// & SenseBender)
#if F_CPU == 8000000L
#define MY_BAUD_RATE 38400
#else
#define MY_BAUD_RATE 115200
#endif

// Set blinking period
#define MY_DEFAULT_LED_BLINK_PERIOD 300

// Inverses the behavior of leds
#define MY_WITH_LEDS_BLINKING_INVERSE

// Flash leds on rx/tx/err
// Uncomment to override default HW configurations
#define MY_DEFAULT_ERR_LED_PIN 4 // Error led pin
#define MY_DEFAULT_RX_LED_PIN 5  // Receive led pin
#define MY_DEFAULT_TX_LED_PIN 6  // the PCB, on board LED

#include <MySensors.h>

void setup() {
  // Setup locally attached sensors
}

void presentation() {
  // Present locally attached sensors
}

void loop() {
  // Send locally attached sensor data here
}
