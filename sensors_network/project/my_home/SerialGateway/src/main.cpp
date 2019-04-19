#include <Arduino.h>

// Enable debug prints to serial monitor
//#define MY_DEBUG
#define MY_SPLASH_SCREEN_DISABLED

#define MY_DISABLE_RAM_ROUTING_TABLE_FEATURE

// Enable and select radio type attached
// NRF24 radio settings
#define MY_RADIO_RF24
//#define MY_RF24_ENABLE_ENCRYPTION
#define MY_RF24_CHANNEL 108
#define MY_RF24_PA_LEVEL RF24_PA_MAX
//#define MY_DEBUG_VERBOSE_RF24
#define MY_RF24_DATARATE RF24_250KBPS
// #define MY_RF24_CE_PIN  9
// #define MY_RF24_CS_PIN  10
// #define MY_RF24_IRQ_PIN 2

// Enable serial gateway
#define MY_GATEWAY_SERIAL

// Define a lower baud rate for Arduino's running on 8 MHz (Arduino Pro Mini 3.3V & SenseBender)
#if F_CPU == 8000000L
#define MY_BAUD_RATE 38400
#endif

// Set blinking period
//#define MY_DEFAULT_LED_BLINK_PERIOD 300

// Inverses the behavior of leds
//#define MY_WITH_LEDS_BLINKING_INVERSE

// Flash leds on rx/tx/err
// Uncomment to override default HW configurations
// #define MY_DEFAULT_ERR_LED_PIN 4  // Error led pin
// #define MY_DEFAULT_RX_LED_PIN  6  // Receive led pin
// #define MY_DEFAULT_TX_LED_PIN  5  // the PCB, on board LED

#include <MySensors.h>

void before() {
}

void setup() {
// Setup locally attached sensors
}

void presentation() {
// Present locally attached sensors
}

void loop() {
// Send locally attached sensor data here
}
