//#define DEBUG

#ifdef DEBUG
  #ifndef DEBUG_OUTPUT
    #define DEBUG_OUTPUT Serial
  #endif
  #ifndef SERIAL_DEBUG_BAUDRATE
    #define SERIAL_DEBUG_BAUDRATE 115200
  #endif
#endif

#include <Arduino.h>


// ----------------------------- OTA -------------------------------------------
#include "Ota.h"
// -----------------------------------------------------------------------------


// ------------------------ Module CONFIG --------------------------------------
#include "AppConfig.h"
#include "WiFiConfig.h"
#include "WebConfig.h"
// -----------------------------------------------------------------------------


// ---------------------------- MQTT -------------------------------------------
#include "MqttNode.h"
// -----------------------------------------------------------------------------

// ----------------------------------- NTP -------------------------------------
#include "Ntp.h"
// -----------------------------------------------------------------------------

// ----------------------------------- Alarms-----------------------------------
#include "Alarms.h"
// -----------------------------------------------------------------------------


void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif
  AppConfig::init();
  WiFiConfig::init();  // this blocks untill networking is configured and active
  WebConfig::init(AppConfig::getConfig()); // start web config server
  MqttNode::init(AppConfig::getConfig());
  Ota::init();
  Ntp::init();
  Alarms::init();
}

void loop() {
  Ota::loop();

  if(Ota::inProgress()) {
    WiFiConfig::disableTickers();
    MqttNode::disableTickers();
    return;
  }

  WebConfig::loop();
  MqttNode::loop();
  Ntp::loop();
  Alarms::loop();
}
