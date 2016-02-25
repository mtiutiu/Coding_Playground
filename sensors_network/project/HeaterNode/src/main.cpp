#include <Arduino.h>
#include <SPI.h>
#include <MyTransportNRF24.h>
#include <MyHwATMega328.h>
#include <MySensor.h>
#include <EEPROM.h>
#include <Wire.h>
#include <MicroLCD.h>
#include "relay.h"

// ----------------------- HEATER ACTUATOR SENSOR SECTION ----------------------
const uint8_t HEATER_CONTROL_RELAY_SENSOR_ID = 1;
const uint8_t HEATER_CONTROL_RELAY_PIN = A2;
const uint8_t HEATER_OFF = 0;
const uint8_t HEATER_ON = 1;

const uint32_t HEATER_ACTUATOR_STATE_SEND_INTERVAL_MS = 8888;
const uint32_t SENSOR_CONFIG_DATA_TIMEOUT_MS = 3000;
const uint32_t SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS = 10;
const uint8_t THIS_NODE_ID = 3;

struct HAStats {
  uint8_t heaterState;
  uint32_t rxPacketsCounter;
  uint32_t txPacketsCounter;
};

static uint32_t rx = 0;
static uint32_t tx = 0;
static HAStats heaterActuatorStats;
bool sendHeaterActuatorState = false;
// ------------------------------------------------------------------------------

// ----------------- CONTROLLER HEARTBEAT STATUS CHECK SECTION ------------------
static uint32_t relaySafetyCounter = 0;
const uint8_t HEATER_RELAY_SAFETY_OFF = 0;
const uint8_t HEATER_RELAY_SAFETY_ON = 1;
const uint32_t HEATER_RELAY_SAFETY_INTERVAL_MS = 60000;
const uint32_t HEATER_RELAY_SAFETY_MAX_COUNTER = 5;
// ------------------------------------------------------------------------------

const uint32_t BATTERY_LVL_REPORT_INTERVAL_MS = 3600000; // 60min(60 * 60 * 1000)

// --------------------- EEPROM CUSTOM CONFIG DATA SECTION ----------------------
// eeprom start address index for our custom data saving
// mysensors api uses eeprom addresses including 512 so we pick 514 for safety
#define EEPROM_CUSTOM_START_INDEX 514
#define EEPROM_CUSTOM_METADATA_INDEX (EEPROM_CUSTOM_START_INDEX + 1)
// flag for checking if eeprom was read/written for the first time or not
static const uint8_t EEPROM_FIRST_WRITE_MARK = '#';
#define MAX_NODE_PAYLOAD_LENGTH 25
//we add 1 for storing the string terminating character also
#define MAX_NODE_METADATA_LENGTH (MAX_NODE_PAYLOAD_LENGTH + 1)
#define DEFAULT_NODE_METADATA "Unknown:Unknown"
// was this node metadata configuration processed already ?
bool metadataConfigRequestProcessed = false;
// ------------------------------------------------------------------------------

// --------------------------- OLED DISPLAY SECTION -----------------------------
const uint8_t HA_INIT_MSG_X_POS = 18;
const uint8_t HA_INIT_MSG_Y_POS = 3;
#define HA_INIT_MSG "HA init ..."

const uint8_t RELAY_ICON_X_POS = 104;
const uint8_t RELAY_ICON_Y_POS = 0;
const uint8_t RELAY_SAFETY_COUNTER_X_POS = RELAY_ICON_X_POS + 4;
const uint8_t RELAY_SAFETY_COUNTER_Y_POS = RELAY_ICON_Y_POS + 2;
const uint32_t RELAY_SAFETY_COUNTER_REFRESH_INTERVAL_MS = 300;
const uint32_t RELAY_SAFETY_STATS_MAX_DISPLAY_VALUE = 999;
const int8_t RELAY_SAFETY_STATS_VALUE_DISPLAY_PADDING = 3;
// this gets displayed if the relay safety counter is over the RELAY_SAFETY_STATS_MAX_DISPLAY_VALUE
#define RELAY_SAFETY_COUNTER_MAX_LIMIT_REACHED_DISPLAY "1K+"

const uint8_t NETWORK_STATS_X_POS = 0;
const uint8_t NETWORK_STATS_Y_POS = 3;
#define NETWORK_RX_STATS_HEADER "Rx:"
#define NETWORK_TX_STATS_HEADER "Tx:"

const uint8_t HEATER_STATS_X_POS = 0;
const uint8_t HEATER_STATS_Y_POS = 0;
#define HEATER_STATE_HEADER "RELAY: "
#define HEATER_STATE_ON_MSG "ON "
#define HEATER_STATE_OFF_MSG "OFF"

LCD_SSD1306 lcd;
// ------------------------------------------------------------------------------

// --------------------------- MYSENSORS SECTION --------------------------------
// NRF24L01 radio driver
#ifndef RF24_RADIO_CE_PIN
  #define RF24_RADIO_CE_PIN 7
#endif

#ifndef RF24_RADIO_CS_PIN
  #define RF24_RADIO_CS_PIN 6
#endif

#ifndef RF24_RADIO_PA_LEVEL
  #define RF24_RADIO_PA_LEVEL RF24_PA_HIGH
#endif

const uint32_t MSG_SEND_RETRIES_INTERVAL_MS = 20;
const uint8_t MSG_SEND_RETRIES = 10;

MyTransportNRF24 radio(RF24_RADIO_CE_PIN, RF24_RADIO_CS_PIN, RF24_RADIO_PA_LEVEL);

// Select AtMega328 hardware profile
MyHwATMega328 hw;

MySensor gw(radio, hw);
// ------------------------------------------------------------------------------

uint8_t getHeaterState() {
  // we have inverse logic so we negate what we read from the relay pin
  return !digitalRead(HEATER_CONTROL_RELAY_PIN);
}

void setHeaterState(uint8_t newState) {
  // we have inverse logic so we negate what we read from incoming message regarding new state
  digitalWrite(HEATER_CONTROL_RELAY_PIN, !newState);
}

uint8_t checkHeaterRelaySafetyStatus() {  
  // check rf link based on stateAckNeeded flag using a predefined time window
  return (relaySafetyCounter >= HEATER_RELAY_SAFETY_MAX_COUNTER) ? 
                            HEATER_RELAY_SAFETY_ON : HEATER_RELAY_SAFETY_OFF;                  
}

void displayNetworkStats(const struct HAStats& stats) {
  lcd.setCursor(NETWORK_STATS_X_POS, NETWORK_STATS_Y_POS);
  lcd.setFontSize(FONT_SIZE_MEDIUM);

  lcd.print(F(NETWORK_RX_STATS_HEADER));
  lcd.printLong(stats.rxPacketsCounter);

  lcd.println();

  lcd.print(F(NETWORK_TX_STATS_HEADER));
  lcd.printLong(stats.txPacketsCounter);

  // draw relay symbol status
  lcd.setCursor(RELAY_ICON_X_POS, RELAY_ICON_Y_POS);
  if (stats.heaterState == HEATER_ON) {
    lcd.draw(relay_on_icon, 
              RELAY_STATE_ICON_WIDTH, 
              RELAY_STATE_ICON_HEIGHT);
  } else {
    lcd.draw(relay_off_icon, 
              RELAY_STATE_ICON_WIDTH, 
              RELAY_STATE_ICON_HEIGHT);
  }

  // draw relay status icon along with safety counter
  lcd.setFontSize(FONT_SIZE_SMALL);
  lcd.setCursor(RELAY_SAFETY_COUNTER_X_POS, RELAY_SAFETY_COUNTER_Y_POS);
  static uint32_t lastRelaySafetyCounterDisplayTimestamp;
  // display the ack counter value changes using a small delay to observe it better
  if ((millis() - lastRelaySafetyCounterDisplayTimestamp) >= RELAY_SAFETY_COUNTER_REFRESH_INTERVAL_MS) {
    if(relaySafetyCounter > RELAY_SAFETY_STATS_MAX_DISPLAY_VALUE) {
      lcd.print(F(RELAY_SAFETY_COUNTER_MAX_LIMIT_REACHED_DISPLAY));
    } else {
      lcd.printLong(relaySafetyCounter, RELAY_SAFETY_STATS_VALUE_DISPLAY_PADDING);
    }
    lastRelaySafetyCounterDisplayTimestamp = millis();
  }
}

void displayHeaterState(const struct HAStats& stats) {
  lcd.setCursor(HEATER_STATS_X_POS, HEATER_STATS_Y_POS);
  lcd.setFontSize(FONT_SIZE_MEDIUM);

  lcd.print(F(HEATER_STATE_HEADER));
  lcd.println(stats.heaterState ? F(HEATER_STATE_ON_MSG) : F(HEATER_STATE_OFF_MSG));
}

void displayHeaterActuatorStats(const struct HAStats& stats) {
  displayNetworkStats(stats);
  displayHeaterState(stats);
}

void updateHeaterActuatorStats(struct HAStats& stats) {
  stats.heaterState = getHeaterState();
  stats.rxPacketsCounter = rx;
  stats.txPacketsCounter = tx;
}

bool isFirstEepromRWAccess(uint16_t index, uint8_t mark) {
  return (EEPROM.read(index) != mark);
}

void parseNodeMetadata(char* metadata, char* nodeName, char* sensorName) {
  if (!metadata || !nodeName || !sensorName) {
    return;
  }

  if (nodeName && sensorName) {
    strncpy(nodeName, strtok(metadata, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(sensorName, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
  }
}

void loadNodeDefaultMetadata(char* nodeName, char* sensorName) {
  char metadata[MAX_NODE_METADATA_LENGTH];
  memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
  strncpy_P(metadata, PSTR(DEFAULT_NODE_METADATA), MAX_NODE_METADATA_LENGTH);

  parseNodeMetadata(metadata, nodeName, sensorName);
}

void loadNodeEepromMetadata(char* nodeName, char* sensorName) {
  if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK) || 
      (!nodeName && !sensorName)) {
    loadNodeDefaultMetadata(nodeName, sensorName);
    return;
  }

  char metadata[MAX_NODE_METADATA_LENGTH];
  memset(metadata, '\0', MAX_NODE_METADATA_LENGTH);
  for(uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++) {
    metadata[i] = EEPROM.read(EEPROM_CUSTOM_METADATA_INDEX + i);
  }
  
  parseNodeMetadata(metadata, nodeName, sensorName);
}

void saveNodeEepromMetadata(const char* metadata) {
  if (metadata) {
    if (isFirstEepromRWAccess(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK)) {
      EEPROM.write(EEPROM_CUSTOM_START_INDEX, EEPROM_FIRST_WRITE_MARK);
    }

    for (uint16_t i = 0; i < MAX_NODE_METADATA_LENGTH; i++ ) {
      EEPROM.update((EEPROM_CUSTOM_METADATA_INDEX + i), metadata[i]);
    }
  }
}

void presentNodeMetadata() {
  char nodeName[MAX_NODE_METADATA_LENGTH];
  char sensorName[MAX_NODE_METADATA_LENGTH];
  memset(nodeName, '\0', MAX_NODE_METADATA_LENGTH);
  memset(sensorName, '\0', MAX_NODE_METADATA_LENGTH);
  
  loadNodeEepromMetadata(nodeName, sensorName);
    
  gw.sendSketchInfo(nodeName, "");
  gw.present(HEATER_CONTROL_RELAY_SENSOR_ID, S_HEATER, sensorName);
}

void sendKnockKnockMessage() {
  MyMessage controllerSetupRequestMsg(HEATER_CONTROL_RELAY_SENSOR_ID, V_VAR1);
  gw.send(controllerSetupRequestMsg.set("knock"));
}

void waitForControllerConfigRequestReply(uint32_t timeout, uint32_t checkInterval, 
                                          bool& requestProcessingFinishedFlag) {
  uint32_t maxRetries = timeout / checkInterval;
  
  for (uint32_t retries = 0; !requestProcessingFinishedFlag && (retries < maxRetries); ++retries) {
    gw.wait(checkInterval); // we wanted sleep here..but it doesn't work - don't know why yet
    if (retries == 0) {
      // for synchronization with the controller so that it knows when to send configuration data
      sendKnockKnockMessage();
    }
  }
}

bool sendControllerMessage(MySensor& gateway, MyMessage& msg, uint8_t maxRetries) {
  uint8_t retries = 0;
  while (++retries < maxRetries) {
    if(gateway.send(msg)) { 
      return true;
    }
    
    gateway.wait(random(MSG_SEND_RETRIES_INTERVAL_MS) + 1);
  }

  return false;
}

// this gets called when we receive a request from the gateway/controller
void incomingRequestProcessing(const MyMessage &message) {
  // V_VAR1 config request message type on set operations only
  if ((message.type == V_VAR1) && (message.getCommand() == C_SET)) {
    char recvMetadata[MAX_NODE_METADATA_LENGTH];
    memset(recvMetadata, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy(recvMetadata, message.getString(), MAX_NODE_METADATA_LENGTH);
    
    saveNodeEepromMetadata(recvMetadata);
    metadataConfigRequestProcessed = true;
  }
  
  // V_STATUS message type for heater set operations only
  if ((message.type == V_STATUS) && (message.getCommand() == C_SET)) {
      uint8_t newState = message.getBool();

      // set heater state only if it differs from previous one
      if (getHeaterState() != newState) {
        setHeaterState(newState);
        sendHeaterActuatorState = true;
      }
  }

  // V_STATUS message type for heater get operations only
  if((message.type == V_STATUS) && (message.getCommand() == C_REQ)) {
    sendHeaterActuatorState = true;
  }

  relaySafetyCounter = 0;
  ++rx;
}

void setup() {
  pinMode(HEATER_CONTROL_RELAY_PIN, OUTPUT);

  // make sure the relay is off when starting up
  setHeaterState(HEATER_OFF);

  lcd.begin();
  lcd.clear();
  
  lcd.setCursor(HA_INIT_MSG_X_POS, HA_INIT_MSG_Y_POS);
  lcd.setFontSize(FONT_SIZE_MEDIUM);
  lcd.print(F(HA_INIT_MSG));

  // process incoming requests
  gw.begin(incomingRequestProcessing, THIS_NODE_ID);
  
  waitForControllerConfigRequestReply(SENSOR_CONFIG_DATA_TIMEOUT_MS, 
                                      SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS, 
                                      metadataConfigRequestProcessed);

  presentNodeMetadata();

  lcd.clear();
}

void loop()  { 
  gw.process(); // process incoming requests

  // fetch latest stats to have the display updated in real time also
  updateHeaterActuatorStats(heaterActuatorStats); 
  displayHeaterActuatorStats(heaterActuatorStats);

  static uint32_t lastRelaySafetyCheckTimestamp;
  if ((millis() - lastRelaySafetyCheckTimestamp) >= HEATER_RELAY_SAFETY_INTERVAL_MS) {
    ++relaySafetyCounter;
    lastRelaySafetyCheckTimestamp = millis();
  }

  if (sendHeaterActuatorState) {
    MyMessage stateMsg(HEATER_CONTROL_RELAY_SENSOR_ID, V_STATUS);    
    // send new state back to controller
    bool txOk = sendControllerMessage(gw, 
                                      stateMsg.set(getHeaterState()), 
                                      MSG_SEND_RETRIES);
    
    // increase tx counter if message sending succeeded
    if(txOk) {
      ++tx;
    }

    sendHeaterActuatorState = false;
  }

  if (checkHeaterRelaySafetyStatus() == HEATER_RELAY_SAFETY_ON) {
    // for safety turn off the heater if the controller doesn't reset the relay safety timer
    //  this is needed in case something bad happens and the controller looses control over this node
    //     so we need to shutdown the heater automatically
    setHeaterState(HEATER_OFF);
  }

  // this is always on(I don't see a reason on sending battery level here - but if the client requested it...oh well)
  static uint32_t lastBatteryLvlReportTimestamp;
  if(millis() - lastBatteryLvlReportTimestamp >= BATTERY_LVL_REPORT_INTERVAL_MS) {
      gw.sendBatteryLevel(100);
      lastBatteryLvlReportTimestamp = millis();
  }
}
