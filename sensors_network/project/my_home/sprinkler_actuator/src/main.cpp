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


// ------------------------ MySensors-------------------------------------------
#include "MySensorsNode.h"
// -----------------------------------------------------------------------------


void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif
  AppConfig::init();
  WiFiConfig::init();  // this blocks untill networking is configured and active
  WebConfig::init(AppConfig::getConfig()); // start web config server
  MySensorsNode::init(AppConfig::getConfig());
  Ota::init();
}

void loop() {
  Ota::loop();

  if(Ota::inProgress()) {
    WiFiConfig::disableTickers();
    MySensorsNode::disableTickers();
    return;
  }

  WebConfig::loop();
  MySensorsNode::loop();
}
