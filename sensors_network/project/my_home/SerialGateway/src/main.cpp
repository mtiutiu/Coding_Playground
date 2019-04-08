#include <Arduino.h>
#include <avr/wdt.h>

// Enable debug prints to serial monitor
//#define MY_DEBUG
#define MY_SPLASH_SCREEN_DISABLED

#define MY_DISABLE_RAM_ROUTING_TABLE_FEATURE

// Enable and select radio type attached
#define MY_RADIO_RFM69
#define MY_RFM69_FREQUENCY RFM69_868MHZ
#define MY_RFM69_ENABLE_ENCRYPTION
//#define MY_RFM69_NEW_DRIVER
#define MY_RFM69_ATC_MODE_DISABLED

// Enable serial gateway
#define MY_GATEWAY_SERIAL

// Define a lower baud rate for Arduino's running on 8 MHz (Arduino Pro Mini 3.3V & SenseBender)
#if F_CPU == 8000000L
#define MY_BAUD_RATE 38400
#endif

// Set blinking period
#define MY_DEFAULT_LED_BLINK_PERIOD 300

// Inverses the behavior of leds
#define MY_WITH_LEDS_BLINKING_INVERSE

// Flash leds on rx/tx/err
// Uncomment to override default HW configurations
#define MY_DEFAULT_ERR_LED_PIN 4  // Error led pin
#define MY_DEFAULT_RX_LED_PIN  6  // Receive led pin
#define MY_DEFAULT_TX_LED_PIN  5  // the PCB, on board LED

#include <MySensors.h>

void before() {
  wdt_disable();
  wdt_enable(WDTO_8S);
}

void setup() {
// Setup locally attached sensors
}

void presentation() {
// Present locally attached sensors
}

void loop() {
  wdt_reset();
// Send locally attached sensor data here
}
