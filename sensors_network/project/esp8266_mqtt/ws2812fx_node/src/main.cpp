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

// ----------------------------- OTA -------------------------------------------
#include "Ota.h"
// -----------------------------------------------------------------------------

// ------------------------ Module CONFIG --------------------------------------
#include "Configs.h"
#include "WiFiConfig.h"
#include "WebConfig.h"
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include "MySensorsApp.h"
// ------------------------ END MySensors---------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#include "LedStrip.h"
// -----------------------------------------------------------------------------

// ------------------------ LED SIGNALING --------------------------------------
#if defined(HAS_BTN_LED) && ! defined(BTN_LED_PIN)
#define BTN_LED_PIN	D5
#endif

#define INVERSE_LED_LOGIC
#ifndef LED_SIGNAL_PIN
#define LED_SIGNAL_PIN  LED_BUILTIN
#endif
const uint32_t NOT_CONNECTED_SIGNALING_INTERVAL_MS = 300; // 300 ms

Ticker noTransportLedTicker;
// -----------------------------------------------------------------------------

// --------------------- ERASE CONFIG BUTTON -----------------------------------
//#define ERASE_CFG_BTN_INVERSE_LOGIC
#ifndef ERASE_CONFIG_BTN_PIN
#define ERASE_CONFIG_BTN_PIN  D1
#endif
// -----------------------------------------------------------------------------

// --------------------- LED STRIP CTRL BUTTON -----------------------------------
//#define LED_STRIP_CTRL_BTN_INVERSE_LOGIC
const uint8_t LED_STRIP_CTRL_BTN = ERASE_CONFIG_BTN_PIN;
const uint32_t LED_STRIP_CTRL_BTN_CHECK_INTERVAL_MS = 100; // 100 ms

Ticker ledStripCtrlBtnCheckTicker;
// -----------------------------------------------------------------------------


void checkTransportConnection() {
  if (!MySensorsApp::connected()) {
    digitalWrite(LED_SIGNAL_PIN, !digitalRead(LED_SIGNAL_PIN));
  } else {
    // make sure led is off when connected
    digitalWrite(LED_SIGNAL_PIN,
  #ifdef INVERSE_LED_LOGIC
      HIGH
  #else
      LOW
  #endif
    );
  }
}

void checkLedStripBtn() {
  static uint32_t stillPressedCounter = 0;

#ifdef LED_STRIP_CTRL_BTN_INVERSE_LOGIC
  if(digitalRead(ERASE_CONFIG_BTN_PIN)) {
#else
  if(!digitalRead(ERASE_CONFIG_BTN_PIN)) {
#endif
    if(stillPressedCounter++ > 0) {
      return;
    }
    if(LedStrip::isRunning()) {
      // turn OFF rgb led strip if it was running before
      LedStrip::stop();
	  #ifdef HAS_BTN_LED
	  digitalWrite(BTN_LED_PIN, HIGH);
	  #endif
    } else {
      LedStrip::start();
	  #ifdef HAS_BTN_LED
	  digitalWrite(BTN_LED_PIN, LOW);
	  #endif
    }
    if(MySensorsApp::connected()) {
      MySensorsApp::sendLedStripState();
    }
  } else {
    stillPressedCounter = 0;
  }
}

void disableTickers() {
  LedStrip::disableTickers();
  ledStripCtrlBtnCheckTicker.detach();
}

void portsConfig() {
  #ifdef HAS_BTN_LED
  pinMode(BTN_LED_PIN, OUTPUT);
  digitalWrite(BTN_LED_PIN, HIGH);
  #endif
  pinMode(LED_SIGNAL_PIN, OUTPUT);
  pinMode(ERASE_CONFIG_BTN_PIN,
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    INPUT
  #else
    INPUT_PULLUP
  #endif
  );

  pinMode(LED_STRIP_CTRL_BTN,
  #ifdef LED_STRIP_CTRL_BTN_INVERSE_LOGIC
    INPUT
  #else
    INPUT_PULLUP
  #endif
  );

  digitalWrite(LED_SIGNAL_PIN,
  #ifdef INVERSE_LED_LOGIC
    HIGH
  #else
    LOW
  #endif
  );

  ledStripCtrlBtnCheckTicker.detach();
  ledStripCtrlBtnCheckTicker.attach_ms(
    LED_STRIP_CTRL_BTN_CHECK_INTERVAL_MS,
    checkLedStripBtn
  );
}

void nodeWiFiConfig() {
  // transport connection signaling
  // enabling this before WiFiManager in order to have visual feedback ASAP
  noTransportLedTicker.detach();
  noTransportLedTicker.attach_ms(
    NOT_CONNECTED_SIGNALING_INTERVAL_MS,
    checkTransportConnection
  );

  // pressing erase config button and then pressing-releasing the reset button
  //  will erase wifi data and starts on demand portal
  // get reset cause first
  bool isExternalReset = (ESP.getResetInfoPtr()->reason == REASON_EXT_SYS_RST);
  WiFiConfig::startWiFiConfig(
  #ifdef ERASE_CFG_BTN_INVERSE_LOGIC
    isExternalReset && digitalRead(ERASE_CONFIG_BTN_PIN),
  #else
    isExternalReset && !digitalRead(ERASE_CONFIG_BTN_PIN)
  #endif
  );
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  portsConfig();
  Configs::init();
  LedStrip::init(Configs::getConfiguration());
  nodeWiFiConfig();  // this blocks untill networking is configured and active
  WebConfig::begin(Configs::getConfiguration()); // start web config server
  MySensorsApp::init(Configs::getConfiguration());
  Ota::init();
}

void loop() {
  Ota::handle();

  if(Ota::inProgress()) {
    disableTickers();
    LedStrip::stop();
  } else {
    WebConfig::loop();
    MySensorsApp::loop();
    MySensorsApp::sendReports();
  }
}
