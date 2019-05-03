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
#include <Ticker.h>
#include "common.h"

// ----------------------------- OTA -------------------------------------------
#include "Ota.h"
// -----------------------------------------------------------------------------

// ------------------------ Module CONFIG --------------------------------------
#include "AppConfig.h"
#include "WiFiConfig.h"
#include "WebConfig.h"
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include "MySensorsNode.h"
// ------------------------ END MySensors---------------------------------------


void portsConfig() {
  pinMode(LED_SIGNAL_PIN, OUTPUT);
  digitalWrite(LED_SIGNAL_PIN,
#ifdef INVERSE_LED_LOGIC
    HIGH
#else
    LOW
#endif
  );

  pinMode(SPRINKLER_CTRL_RELAY_PIN, OUTPUT);
  SPRINKLER_OFF();
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  portsConfig();
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
