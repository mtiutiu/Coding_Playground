#include <Arduino.h>

/**********************************
 * MySensors node configuration
 */

// General settings
#define SKETCH_NAME "GardenSprinklerActuator"
#define SKETCH_VERSION "1.0"
//#define MY_DEBUG
#define MY_NODE_ID 1

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

// RFM69 radio settings
//#define MY_RADIO_RFM69
//#define MY_RFM69_FREQUENCY RFM69_868MHZ
//#define MY_IS_RFM69HW
//#define MY_RFM69_NEW_DRIVER
//#define MY_RFM69_ENABLE_ENCRYPTION
//#define MY_RFM69_NETWORKID 100
//#define MY_DEBUG_VERBOSE_RFM69
//#define MY_RF69_IRQ_PIN D1
//#define MY_RF69_IRQ_NUM MY_RF69_IRQ_PIN
//#define MY_RF69_SPI_CS D2
//#define MY_RFM69_ATC_MODE_DISABLED

// RFM95 radio settings
//#define MY_RADIO_RFM95
//#define MY_RFM95_FREQUENCY (RFM95_868MHZ)
//#define MY_DEBUG_VERBOSE_RFM95
//#define MY_RFM95_MAX_POWER_LEVEL_DBM (20)
//#define MY_RFM95_IRQ_PIN D1
//#define MY_RFM95_IRQ_NUM MY_RFM95_IRQ_PIN
//#define MY_RFM95_CS_PIN D8

// RS485 serial transport settings
//#define MY_RS485
//#define MY_RS485_BAUD_RATE 9600
//#define MY_RS485_DE_PIN 2
//#define MY_RS485_MAX_MESSAGE_LENGTH 40
//#define MY_RS485_HWSERIAL Serial1

// Message signing settings
//#define MY_SIGNING_SOFT
//#define MY_SIGNING_SOFT_RANDOMSEED_PIN 7
//#define MY_SIGNING_REQUEST_SIGNATURES
//#define MY_SIGNING_ATSHA204
//#define MY_SIGNING_ATSHA204_PIN 4
//#define MY_SIGNING_REQUEST_SIGNATURES

// OTA Firmware update settings
//#define MY_OTA_FIRMWARE_FEATURE
//#define OTA_WAIT_PERIOD 300
//#define FIRMWARE_MAX_REQUESTS 2
//#define MY_OTA_RETRY 2

// OTA debug output
//#define MY_DEBUG_OTA (0)
//#define MY_OTA_LOG_SENDER_FEATURE
//#define MY_OTA_LOG_RECEIVER_FEATURE
//#define MY_DEBUG_OTA_DISABLE_ACK

// Advanced settings
//#define MY_BAUD_RATE 9600
//#define MY_SMART_SLEEP_WAIT_DURATION_MS 500
#define MY_SPLASH_SCREEN_DISABLED
#define MY_DISABLE_RAM_ROUTING_TABLE_FEATURE
//#define MY_SIGNAL_REPORT_ENABLED

// Optimizations when running on 2032 Coin Cell. Also set nodeManager.setSleepBetweenSend(500) and run the board at 1Mhz
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED
#define MY_TRANSPORT_WAIT_READY_MS  5000
#define MY_SLEEP_TRANSPORT_RECONNECT_TIMEOUT_MS 2000
#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC


/***********************************
 * NodeManager configuration
 */

#define NODEMANAGER_DEBUG OFF
#define NODEMANAGER_INTERRUPTS OFF
#define NODEMANAGER_SLEEP ON
#define NODEMANAGER_RECEIVE ON
#define NODEMANAGER_DEBUG_VERBOSE OFF
#define NODEMANAGER_POWER_MANAGER OFF
#define NODEMANAGER_CONDITIONAL_REPORT ON
#define NODEMANAGER_EEPROM OFF
#define NODEMANAGER_TIME OFF
#define NODEMANAGER_RTC OFF
#define NODEMANAGER_SD OFF
#define NODEMANAGER_HOOKING OFF
#define NODEMANAGER_OTA_CONFIGURATION OFF
#define NODEMANAGER_SERIAL_INPUT OFF


#include <MySensors_NodeManager.h>


#include <sensors/SensorBattery.h>
SensorBattery battery;

// #include <sensors/SensorSignal.h>
// SensorSignal signal;

#include <sensors/SensorRelay.h>
SensorRelay valve(4);


void before() {
  nodeManager.setSleepSeconds(10);

  battery.setReportIntervalMinutes(10);
  battery.setBatteryInternalVcc(false);
  battery.setBatteryPin(A0);
  battery.setMinVoltage(3.3);
  battery.setMaxVoltage(7.5);
  battery.setBatteryVoltsPerBit(0.00732421875);
  battery.setBatteryCalibrationFactor(0.9585185);

  signal.setReportIntervalMinutes(30);
  valve.setReportIntervalMinutes(5);

  nodeManager.before();
}


void presentation() {
  nodeManager.presentation();
}


void setup() {
  nodeManager.setup();
}


void loop() {
  nodeManager.loop();

  if (!transportCheckUplink()) {
    valve.setStatus(OFF);
  }
}

#if NODEMANAGER_RECEIVE == ON
void receive(const MyMessage &message) {
  nodeManager.receive(message);
}
#endif
