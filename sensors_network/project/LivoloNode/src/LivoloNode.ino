#include <Arduino.h>
#include <SPI.h>
#include <MyTransportNRF24.h>
#include <MyHwATMega328.h>
#include <MySensor.h>
#include <EEPROM.h>
#include <Livolo.h>

// -------------------------------- LIVOLO ACTUATOR SECTION ---------------------
const uint8_t LIVOLO_ACTUATOR_SENSOR_ID = 1;

const uint32_t SENSOR_CONFIG_DATA_TIMEOUT_MS = 3000;
const uint32_t SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS = 10;
const uint8_t THIS_NODE_ID = 7;

// we expect 3 values: remote id, remote key and tx retries
//	remote_id:remote_key:tx_retries
struct LivoloCmd {
  uint16_t remoteId;
  uint8_t remoteKey;
  uint8_t txRetries;
};
LivoloCmd livoloCmdData;

// transmitter connected to PC0(Arduino A0 - Rboard)
const uint8_t TX_DATA_PIN = A0;

// transmitter power supply pin
const uint8_t TX_POWER_SUPPLY_ENABLE_PIN = 0;
const uint32_t TX_POWER_SUPPLY_SETTLE_TIME_MS = 50;

#define TX_ENABLE_POWER_SUPPLY()   digitalWrite(TX_POWER_SUPPLY_ENABLE_PIN, HIGH)
#define TX_DISABLE_POWER_SUPPLY()  digitalWrite(TX_POWER_SUPPLY_ENABLE_PIN, LOW)

Livolo livolo(TX_DATA_PIN);
bool livoloCmdMsgReceived = false;
bool sendStatus = false;
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

// --------------------------- MYSENSORS SECTION --------------------------------
const uint8_t NRF24_CE_PIN = 9;
const uint8_t NRF24_CS_PIN = 10;

// NRF24L01 radio driver
#ifndef RF24_RADIO_CE_PIN
  #define RF24_RADIO_CE_PIN 9
#endif

#ifndef RF24_RADIO_CS_PIN
  #define RF24_RADIO_CS_PIN 10
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
  gw.present(LIVOLO_ACTUATOR_SENSOR_ID, S_CUSTOM, sensorName);
}

void sendKnockKnockMessage() {
  MyMessage controllerSetupRequestMsg(LIVOLO_ACTUATOR_SENSOR_ID, V_VAR1);
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

void parseLivoloCmdMessage(const MyMessage &message, struct LivoloCmd& cmd) {
	char recvLivoloCmdData[MAX_NODE_METADATA_LENGTH];
    memset(recvLivoloCmdData, '\0', MAX_NODE_METADATA_LENGTH);
    strncpy(recvLivoloCmdData, message.getString(), MAX_NODE_METADATA_LENGTH);

    char remoteIdStr[MAX_NODE_METADATA_LENGTH];
    memset(remoteIdStr, '\0', MAX_NODE_METADATA_LENGTH);

    char remoteKeyStr[MAX_NODE_METADATA_LENGTH];
    memset(remoteKeyStr, '\0', MAX_NODE_METADATA_LENGTH);

    char txRetriesStr[MAX_NODE_METADATA_LENGTH];
    memset(txRetriesStr, '\0', MAX_NODE_METADATA_LENGTH);

    strncpy(remoteIdStr, strtok(recvLivoloCmdData, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(remoteKeyStr, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);
    strncpy(txRetriesStr, strtok(NULL, ":"), MAX_NODE_METADATA_LENGTH);

    cmd.remoteId = (uint16_t)strtoul(remoteIdStr, NULL, 0);
    cmd.remoteKey = (uint8_t)strtoul(remoteKeyStr, NULL, 0);
    cmd.txRetries = (uint8_t)strtoul(txRetriesStr, NULL, 0);
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
  
  // received livolo command set message
  if ((message.type == V_VAR2) && (message.getCommand() == C_SET)) {
  	parseLivoloCmdMessage(message, livoloCmdData);
    livoloCmdMsgReceived = true;
  }
}

void setup() {
  pinMode(TX_POWER_SUPPLY_ENABLE_PIN, OUTPUT);

  // process incoming requests
  gw.begin(incomingRequestProcessing, THIS_NODE_ID);
  
  waitForControllerConfigRequestReply(SENSOR_CONFIG_DATA_TIMEOUT_MS, 
                                      SENSOR_CONFIG_DATA_RETRIES_INTERVAL_MS, 
                                      metadataConfigRequestProcessed);

  presentNodeMetadata();
}

void loop() {
  gw.process();

  if (livoloCmdMsgReceived) {
    TX_ENABLE_POWER_SUPPLY(); //enable tx power supply line
    gw.wait(TX_POWER_SUPPLY_SETTLE_TIME_MS);  // give it some time to settle

    livolo.sendButton(livoloCmdData.remoteId, 
    				  livoloCmdData.remoteKey, 
    				  livoloCmdData.txRetries);

    TX_DISABLE_POWER_SUPPLY();  // disable tx power supply line

    // send reply
    sendStatus = true;
    livoloCmdMsgReceived = false;
  }

  // echo back received livolo command string
  if (sendStatus) {
  	char recvLivoloCmdData[MAX_NODE_METADATA_LENGTH];
    memset(recvLivoloCmdData, '\0', MAX_NODE_METADATA_LENGTH);
    sprintf_P(recvLivoloCmdData, 
    		PSTR("sent:%d:%d:%d"), 
    		livoloCmdData.remoteId,
    		livoloCmdData.remoteKey,
    		livoloCmdData.txRetries);

    MyMessage statusMsg(LIVOLO_ACTUATOR_SENSOR_ID, V_VAR2);    
    // send new state back to controller
    sendControllerMessage(gw, 
                          statusMsg.set(recvLivoloCmdData), 
                          MSG_SEND_RETRIES);

    sendStatus = false;
  }

  // this is always on(I don't see a reason on sending battery level here - but if the client requested it...oh well)
  static uint32_t lastBatteryLvlReportTimestamp;
  if ((millis() - lastBatteryLvlReportTimestamp) >= BATTERY_LVL_REPORT_INTERVAL_MS) {
      gw.sendBatteryLevel(100);
      lastBatteryLvlReportTimestamp = millis();
  }
}
