//#define DEBUG

#ifdef DEBUG
  #ifndef DEBUG_OUTPUT
    #define DEBUG_OUTPUT Serial
  #endif
  #ifndef SERIAL_DEBUG_BAUDRATE
    #define SERIAL_DEBUG_BAUDRATE 115200
  #endif
#endif

#define STRINGIFY(a) str(a)
#define str(a) #a

#include <Arduino.h>
#include <Ticker.h>


// enable reading of Vcc
ADC_MODE(ADC_VCC);

// ------------------------ Module CONFIG --------------------------------------
#include "WiFiConfig.h"
#include "WebConfig.h"
// ------------------------ END Module CONFIG ----------------------------------

// ------------------------ MySensors-------------------------------------------
#include <MTypes.h>
#include <MySensors.h>

const uint8_t RGB_SENSOR_ID = 1;
const uint8_t SENSOR_COUNT = 1;
const uint8_t CHILD_TYPES[SENSOR_COUNT] = {S_RGB_LIGHT};
const uint8_t CHILD_SUBTYPES[SENSOR_COUNT] = {V_RGB};
const char *CHILD_ALIASES[SENSOR_COUNT] = {"RGB"};

MySensors mysNode;
// ------------------------ END MySensors---------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#include "LedStrip.h"
// -----------------------------------------------------------------------------

// -------------------------- BATTERY LEVEL REPORTING --------------------------
const float VDD_VOLTAGE_MV = 3300.0;
const uint32_t BATTER_LVL_REPORT_INTERVAL_MS = 300000; // 5 mins
// -----------------------------------------------------------------------------

// ------------------------------ RSSI REPORTING -------------------------------
const uint32_t RSSI_LVL_REPORT_INTERVAL_MS = 600000; // 10 mins
// -----------------------------------------------------------------------------

// ------------------------- SENSORS STATE REPORTING ---------------------------
const uint32_t SENSOR_STATE_REPORT_INTERVAL_MS = 180000; // 3 mins
// -----------------------------------------------------------------------------

// ------------------------ LED SIGNALING --------------------------------------
#if defined(HAS_BTN_LED) && ! defined(BTN_LED_PIN)
#define BTN_LED_PIN	D5
#endif

#define INVERSE_LED_LOGIC
#ifndef LED_SIGNAL_PIN
#define LED_SIGNAL_PIN  LED_BUILTIN
#endif
const float NOT_CONNECTED_SIGNALING_INTERVAL_S = 0.3; // 300 ms

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
const float LED_STRIP_CTRL_BTN_CHECK_INTERVAL_S = 0.1; // 100 ms

Ticker ledStripCtrlBtnCheckTicker;
// -----------------------------------------------------------------------------

// ----------------------------- OTA -------------------------------------------
#include "Ota.h"
// -----------------------------------------------------------------------------

void sendLedStripState() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  snprintf(
    reply,
    MQTT_MAX_PAYLOAD_LENGTH,
    "%02x%02x%02x",
    (uint8_t)((LedStrip::getInstance().getColor() & 0x00FF0000) >> 16),
    (uint8_t)((LedStrip::getInstance().getColor() & 0x0000FF00) >> 8),
    (uint8_t)((LedStrip::getInstance().getColor() & 0x000000FF) >> 0)
  );
  mysNode.send(RGB_SENSOR_ID, V_RGB, reply);

  uint8_t currentLedStripBrightness =
    round((LedStrip::getInstance().getBrightness() * 100.0) / BRIGHTNESS_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripBrightness);
  mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);

  uint8_t currentLedStripSpeed =
    round((LedStrip::getInstance().getSpeed() * 100.0) / SPEED_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripSpeed);
  mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);

  uint8_t currentLedStripMode = LedStrip::getInstance().getMode();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripMode);
  mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);

  uint8_t currentLedStripState = LedStrip::getInstance().isRunning();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripState);
  mysNode.send(RGB_SENSOR_ID, V_STATUS, reply);
}

void onMessage(MySensorMsg &message) {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  if (message.cmd_type == M_SET) {
    if (strlen(message.payload) > 0) {
    #ifdef DEBUG
      DEBUG_OUTPUT.printf(
        "Received M_SET command with value: %s\r\n",
        message.payload
      );
    #endif
      if (message.sub_type == V_RGB) {
        if (!LedStrip::getInstance().isRunning()) {
          return;
        }

        LedStrip::getInstance().setColor(strtoul(message.payload, NULL, 16));
        LedStrip::getInstance().trigger();
        mysNode.send(RGB_SENSOR_ID, V_RGB, message.payload);
      } else if (message.sub_type == V_LIGHT_LEVEL) {
        if (!LedStrip::getInstance().isRunning()) {
          return;
        }

        uint16_t brightnessPercentage = (uint16_t)atoi(message.payload);
        if ((brightnessPercentage >= 0) && (brightnessPercentage <= 100)) {
          LedStrip::getInstance().setBrightness(
            round((brightnessPercentage * BRIGHTNESS_MAX_VALUE) / 100.0)
          );
          LedStrip::getInstance().trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", brightnessPercentage);
          mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);
        }
      } else if (message.sub_type == V_PERCENTAGE) {
        if (!LedStrip::getInstance().isRunning()) {
          return;
        }

        uint16_t speedPercentage = (uint16_t)atoi(message.payload);
        if ((speedPercentage >= 0) && (speedPercentage <= 100)) {
          LedStrip::getInstance().setSpeed(round((speedPercentage * SPEED_MAX_VALUE) / 100.0));
          LedStrip::getInstance().trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", speedPercentage);
          mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);
        }
      } else if (message.sub_type == V_CUSTOM) {
        if (!LedStrip::getInstance().isRunning()) {
          return;
        }

        uint16_t modeSetting = (uint16_t)atoi(message.payload);
        if ((modeSetting >= MODE_MIN_VALUE) &&
            (modeSetting < LedStrip::getInstance().getModeCount())) {
          LedStrip::getInstance().setMode(modeSetting);
          LedStrip::getInstance().trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", modeSetting);
          mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);
        }
      } else if (message.sub_type == V_STATUS) {
        uint16_t newLedStripState = (uint16_t)atoi(message.payload);
        if ((newLedStripState == OFF) && (LedStrip::getInstance().isRunning())) {
          LedStrip::saveSettings(); // save current settings

          // turn OFF rgb led strip
          LedStrip::stop();
    		  #ifdef HAS_BTN_LED
    		  digitalWrite(BTN_LED_PIN, HIGH);
    		  #endif
        }

        if ((newLedStripState == ON) && (!LedStrip::getInstance().isRunning())) {
          // load rgb led strip saved settings
          LedStrip::loadSettings();
          LedStrip::start();
    		  #ifdef HAS_BTN_LED
    		  digitalWrite(BTN_LED_PIN, LOW);
    		  #endif
        }
      }
      sendLedStripState();
    }
  }
}

void checkTransportConnection() {
  if (!mysNode.connected()) {
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

void sendBatteryLevel() {
  uint8_t vccPercent = constrain(
    round((ESP.getVcc() * 100.0) / VDD_VOLTAGE_MV),
    0,
    100
  );
#ifdef DEBUG
  DEBUG_OUTPUT.printf("Sending system voltage level: %d%%\r\n", vccPercent);
#endif
  mysNode.send_battery_level(vccPercent);
}

void sendRSSILevel() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];
// mycontroller supports this for now
#ifdef DEBUG
  DEBUG_OUTPUT.printf("Sending RSSI level: %d ...\r\n", WiFi.RSSI());
#endif
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "rssi:%d dBm", WiFi.RSSI());
  mysNode.send(1, V_VAR5, reply);
}

void sendSensorState() {
  sendLedStripState();
}

void sendReports() {
  static uint32_t lastSensorStateReportTimestamp = millis();
  if ((millis() - lastSensorStateReportTimestamp) >= SENSOR_STATE_REPORT_INTERVAL_MS) {
    sendSensorState();
    lastSensorStateReportTimestamp = millis();
  }

  static uint32_t lastBatteryReportTimestamp = millis();
  if ((millis() - lastBatteryReportTimestamp) >= BATTER_LVL_REPORT_INTERVAL_MS) {
    sendBatteryLevel();
    lastBatteryReportTimestamp = millis();
  }

  static uint32_t lastRssiReportTimestamp = millis();
  if ((millis() - lastRssiReportTimestamp) >= RSSI_LVL_REPORT_INTERVAL_MS) {
    sendRSSILevel();
    lastRssiReportTimestamp = millis();
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
    if(LedStrip::getInstance().isRunning()) {
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
    if(mysNode.connected()) {
      sendLedStripState();
    }
  } else {
    stillPressedCounter = 0;
  }
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
  ledStripCtrlBtnCheckTicker.attach(
    LED_STRIP_CTRL_BTN_CHECK_INTERVAL_S,
    checkLedStripBtn
  );
}

void mySensorsInit(CfgData& cfgData) {
  MqttCfg mqtt_cfg = {
    cfgData.mqtt_server,
    cfgData.mqtt_user,
    cfgData.mqtt_passwd,
    atoi(cfgData.mqtt_port),
    cfgData.mqtt_in_topic_prefix,
    cfgData.mqtt_out_topic_prefix
  };

  mysNode.begin(
    atoi(cfgData.mys_node_id),
    cfgData.mys_node_alias,
    CHILD_TYPES,
    CHILD_ALIASES,
    SENSOR_COUNT,
    mqtt_cfg
  );
  mysNode.on_message(onMessage);
}

void nodeConfig(CfgData& cfgData) {
  // transport connection signaling
  // enabling this before WiFiManager in order to have visual feedback ASAP
  noTransportLedTicker.detach();
  noTransportLedTicker.attach(
    NOT_CONNECTED_SIGNALING_INTERVAL_S,
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

  mySensorsInit(cfgData);
}

void disableTickers() {
  LedStrip::getUpdateTicker().detach();
  ledStripCtrlBtnCheckTicker.detach();
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  portsConfig();
  WebConfig::begin(); // start web config and load configs
  LedStrip::init(WebConfig::getConfig());
  nodeConfig(WebConfig::getConfig());  // this blocks untill networking is configured and active

  Ota::init();

  // send initial reports on node startup
  if (mysNode.connected()) {
    sendSensorState();
    sendBatteryLevel();
    sendRSSILevel();
  }
}

void loop() {
  Ota::getInstance().handle();

  if(Ota::inProgress()) {
    disableTickers();
    LedStrip::stop();
  } else {
    WebConfig::loop();
    mysNode.loop();
    sendReports();
  }
}
