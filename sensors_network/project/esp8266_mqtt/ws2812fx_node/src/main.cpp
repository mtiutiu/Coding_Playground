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
#include <ArduinoOTA.h>
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
#include <MySensorsEEPROM.h>

const uint8_t RGB_SENSOR_ID = 1;
const uint8_t SENSOR_COUNT = 1;
const uint8_t CHILD_TYPES[SENSOR_COUNT] = {S_RGB_LIGHT};
const uint8_t CHILD_SUBTYPES[SENSOR_COUNT] = {V_RGB};
const char *CHILD_ALIASES[SENSOR_COUNT] = {"RGB"};

MySensors mysNode;
// ------------------------ END MySensors---------------------------------------

// ------------------------ SENSORS/ACTUATORS ----------------------------------
#include <Adafruit_NeoPixelBusEsp8266DMA.h>
#include <WS2812FX.h>

//#define INVERSE_SENSOR_LOGIC
// max led count that this node can take
#define MAX_LED_COUNT 300

#ifndef LED_STRIP_DATA_PIN
#define LED_STRIP_DATA_PIN  D3
#endif

const bool OFF = false;
const bool ON = true;

const uint8_t BRIGHTNESS_MIN_VALUE = 0;
const uint8_t BRIGHTNESS_MAX_VALUE = 255;
const uint8_t BRIGHTNESS_DEFAULT_VALUE = 100;
const uint8_t SPEED_MIN_VALUE = 0;
const uint8_t SPEED_MAX_VALUE = 255;
const uint8_t SPEED_DEFAULT_VALUE = 100;
const uint8_t MODE_MIN_VALUE = 0;
const uint8_t MODE_DEFAULT_VALUE = 0;
const uint8_t R_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t R_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t R_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t G_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t G_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t G_COLOR_FIELD_DEFAULT_VALUE = 100;
const uint8_t B_COLOR_FIELD_MIN_VALUE = 0;
const uint8_t B_COLOR_FIELD_MAX_VALUE = 255;
const uint8_t B_COLOR_FIELD_DEFAULT_VALUE = 100;

const uint8_t RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID = 1;
const uint8_t RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID = 2;
const uint8_t RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID = 3;
const uint8_t RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID = 4;
const uint8_t RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID = 5;
const uint8_t RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID = 6;

const float LED_STRIP_UPDATE_INTERVAL_S = 0.04; // 40ms

Ticker ledStripUpdateTicker;

WS2812FX ws2812fx(MAX_LED_COUNT, LED_STRIP_DATA_PIN);
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
#ifndef HOSTNAME
#define HOSTNAME  AP_SSID
#endif
#ifndef OTA_PORT
#define OTA_PORT 8266
#endif
static bool otaInProgress = false;
// -----------------------------------------------------------------------------

uint8_t loadState(uint8_t index) {
  return MySensorsEEPROM::hwReadConfig(index);
}

void saveState(uint8_t index, uint8_t value) {
  MySensorsEEPROM::hwWriteConfig(index, value);
}

void saveRGBLedStripCurrentSettings(uint8_t brightness, uint8_t speed,
                                    uint8_t mode, uint32_t color) {

  saveState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID, brightness);
  saveState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID, speed);
  saveState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID, mode);
  saveState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x00FF0000) >> 16);
  saveState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x0000FF00) >> 8);
  saveState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID, (color & 0x000000FF) >> 0);
}

void loadRGBLedStripSavedSettings() {
  ws2812fx.setBrightness(
    constrain(loadState(RGB_STRIP_BRIGHTNESS_EEPROM_SAVE_LOCATION_ID), BRIGHTNESS_MIN_VALUE, BRIGHTNESS_MAX_VALUE)
  );
  ws2812fx.setSpeed(
    constrain(loadState(RGB_STRIP_SPEED_EEPROM_SAVE_LOCATION_ID), SPEED_MIN_VALUE, SPEED_MAX_VALUE)
  );
  ws2812fx.setMode(
    constrain(loadState(RGB_STRIP_MODE_EEPROM_SAVE_LOCATION_ID), MODE_MIN_VALUE, MODE_DEFAULT_VALUE)
  );
  ws2812fx.setColor(
    constrain(loadState(RGB_STRIP_R_COLOR_EEPROM_SAVE_LOCATION_ID), R_COLOR_FIELD_MIN_VALUE, R_COLOR_FIELD_MAX_VALUE),
    constrain(loadState(RGB_STRIP_G_COLOR_EEPROM_SAVE_LOCATION_ID), G_COLOR_FIELD_MIN_VALUE, G_COLOR_FIELD_MAX_VALUE),
    constrain(loadState(RGB_STRIP_B_COLOR_EEPROM_SAVE_LOCATION_ID), B_COLOR_FIELD_MIN_VALUE, B_COLOR_FIELD_MAX_VALUE)
  );
  ws2812fx.trigger();
}

void sendLedStripState() {
  char reply[MQTT_MAX_PAYLOAD_LENGTH];

  snprintf(
    reply,
    MQTT_MAX_PAYLOAD_LENGTH,
    "%02x%02x%02x",
    (uint8_t)((ws2812fx.getColor() & 0x00FF0000) >> 16),
    (uint8_t)((ws2812fx.getColor() & 0x0000FF00) >> 8),
    (uint8_t)((ws2812fx.getColor() & 0x000000FF) >> 0)
  );
  mysNode.send(RGB_SENSOR_ID, V_RGB, reply);

  uint8_t currentLedStripBrightness =
    round((ws2812fx.getBrightness() * 100.0) / BRIGHTNESS_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripBrightness);
  mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);

  uint8_t currentLedStripSpeed =
    round((ws2812fx.getSpeed() * 100.0) / SPEED_MAX_VALUE);
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripSpeed);
  mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);

  uint8_t currentLedStripMode = ws2812fx.getMode();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripMode);
  mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);

  uint8_t currentLedStripState = ws2812fx.isRunning();
  snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", currentLedStripState);
  mysNode.send(RGB_SENSOR_ID, V_STATUS, reply);
}

void ledStripUpdate() {
  if (ws2812fx.isRunning()) {
    ws2812fx.service();
  }
}

void ledStripStart() {
  ws2812fx.start();
  ledStripUpdateTicker.detach();
  ledStripUpdateTicker.attach(LED_STRIP_UPDATE_INTERVAL_S, ledStripUpdate);
}

void ledStripStop() {
  ledStripUpdateTicker.detach();
  ws2812fx.stop();
  digitalWrite(LED_STRIP_DATA_PIN, LOW);
}

void ledStripInit(CfgData& cfgData, bool start = false) {
  // led strip init
  uint16_t ledCount = (uint16_t)atoi(cfgData.mys_node_led_count);
#ifdef DEBUG
  DEBUG_OUTPUT.printf("We have %d leds ...\r\n", ledCount);
#endif
  ws2812fx.setLedCount(ledCount);
  ws2812fx.init();

  // load rgb led strip saved settings
  loadRGBLedStripSavedSettings();

  if(!start) {
    // start led strip in OFF state
    ledStripStop();
  } else {
    ledStripStart();
  }
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
        if (!ws2812fx.isRunning()) {
          return;
        }

        ws2812fx.setColor(strtoul(message.payload, NULL, 16));
        ws2812fx.trigger();
        mysNode.send(RGB_SENSOR_ID, V_RGB, message.payload);
      } else if (message.sub_type == V_LIGHT_LEVEL) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t brightnessPercentage = (uint16_t)atoi(message.payload);
        if ((brightnessPercentage >= 0) && (brightnessPercentage <= 100)) {
          ws2812fx.setBrightness(
            round((brightnessPercentage * BRIGHTNESS_MAX_VALUE) / 100.0)
          );
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", brightnessPercentage);
          mysNode.send(RGB_SENSOR_ID, V_LIGHT_LEVEL, reply);
        }
      } else if (message.sub_type == V_PERCENTAGE) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t speedPercentage = (uint16_t)atoi(message.payload);
        if ((speedPercentage >= 0) && (speedPercentage <= 100)) {
          ws2812fx.setSpeed(round((speedPercentage * SPEED_MAX_VALUE) / 100.0));
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", speedPercentage);
          mysNode.send(RGB_SENSOR_ID, V_PERCENTAGE, reply);
        }
      } else if (message.sub_type == V_CUSTOM) {
        if (!ws2812fx.isRunning()) {
          return;
        }

        uint16_t modeSetting = (uint16_t)atoi(message.payload);
        if ((modeSetting >= MODE_MIN_VALUE) &&
            (modeSetting < ws2812fx.getModeCount())) {
          ws2812fx.setMode(modeSetting);
          ws2812fx.trigger();
          snprintf(reply, MQTT_MAX_PAYLOAD_LENGTH, "%d", modeSetting);
          mysNode.send(RGB_SENSOR_ID, V_CUSTOM, reply);
        }
      } else if (message.sub_type == V_STATUS) {
        uint16_t newLedStripState = (uint16_t)atoi(message.payload);
        if ((newLedStripState == OFF) && (ws2812fx.isRunning())) {
          // get current brightness/color settings for saving them later
          uint8_t previousLedStripBrightness = ws2812fx.getBrightness();
          uint32_t previousLedStripColor = ws2812fx.getColor();

          // turn OFF rgb led strip
          ledStripStop();
    		  #ifdef HAS_BTN_LED
    		  digitalWrite(BTN_LED_PIN, HIGH);
    		  #endif

          saveRGBLedStripCurrentSettings(
            previousLedStripBrightness,
            ws2812fx.getSpeed(),
            ws2812fx.getMode(),
            previousLedStripColor
          );
        }

        if ((newLedStripState == ON) && (!ws2812fx.isRunning())) {
          // load rgb led strip saved settings
          loadRGBLedStripSavedSettings();
          ledStripStart();
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
    if(ws2812fx.isRunning()) {
      // turn OFF rgb led strip if it was running before
      ledStripStop();
	  #ifdef HAS_BTN_LED
	  digitalWrite(BTN_LED_PIN, HIGH);
	  #endif
    } else {
      ledStripStart();
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

void disableLedStripControlTickers() {
  ledStripUpdateTicker.detach();
  ledStripCtrlBtnCheckTicker.detach();
}

void otaInit() {
  ArduinoOTA.setHostname(HOSTNAME);
  ArduinoOTA.setPort(OTA_PORT);
  ArduinoOTA.setRebootOnSuccess(true);

  ArduinoOTA.onStart([]() {
    if (ArduinoOTA.getCommand() == U_FLASH) {
  #ifdef DEBUG
      DEBUG_OUTPUT.println("Start updating flash ...");
  #endif
    } else {
  #ifdef DEBUG
      DEBUG_OUTPUT.println("Start updating filesystem (SPIFFS) ...");
  #endif
      // Unmount SPIFFS using SPIFFS.end() first
      SPIFFS.end();
    }
    otaInProgress = true;
  });
  ArduinoOTA.onEnd([]() {
  #ifdef DEBUG
    DEBUG_OUTPUT.println("\nOTA finished.");
  #endif
    otaInProgress = false;
  });
  ArduinoOTA.onProgress([](uint16_t progress, uint16_t total) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Progress: %u%%\r", (progress / (total / 100)));
  #endif
    otaInProgress = true;
  });
  ArduinoOTA.onError([](ota_error_t error) {
  #ifdef DEBUG
    DEBUG_OUTPUT.printf("Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) DEBUG_OUTPUT.println("Auth Failed");
    else if (error == OTA_BEGIN_ERROR) DEBUG_OUTPUT.println("Begin Failed");
    else if (error == OTA_CONNECT_ERROR) DEBUG_OUTPUT.println("Connect Failed");
    else if (error == OTA_RECEIVE_ERROR) DEBUG_OUTPUT.println("Receive Failed");
    else if (error == OTA_END_ERROR) DEBUG_OUTPUT.println("End Failed");
  #endif
    ESP.restart();
  });

  ArduinoOTA.begin();
}

void setup() {
#ifdef DEBUG
  DEBUG_OUTPUT.begin(SERIAL_DEBUG_BAUDRATE);
#endif

  // pre inits
  portsConfig();
  MySensorsEEPROM::hwInit();

  WebConfig::begin(); // start web config and load configs
  ledStripInit(WebConfig::getConfig());
  nodeConfig(WebConfig::getConfig());  // this blocks untill networking is configured and active

  otaInit();

  // send initial reports on node startup
  if (mysNode.connected()) {
    sendSensorState();
    sendBatteryLevel();
    sendRSSILevel();
  }
}

void loop() {
  ArduinoOTA.handle();
  if(otaInProgress) {
    disableLedStripControlTickers();
    ledStripStop();
  } else {
    WebConfig::loop();
    mysNode.loop();
    sendReports();
  }
}
