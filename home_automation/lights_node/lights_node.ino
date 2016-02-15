/*

  Lights Node Unit

*/ 

#include <Arduino.h>
#include <RFM12B.h>
#include <AsyncDelay.h>
#include <Time.h>
#include <TimeAlarms.h>
#include <Util.h>
#include <LowPower.h>

#define QUOTE(str) #str
#define EXPAND_AND_QUOTE(str) QUOTE(str)

const uint8_t DATA_PKT_MAX_LEN = 120;
const uint8_t MASTER_PEER_ID = 1;
const uint8_t LIGHTS_PEER_ID = 2;     //network ID used for this unit
const uint8_t NETWORK_ID = 99;       //the network ID we are on

const uint8_t MAX_CHANNELS = 3;
const uint8_t RELAY1_CMD_PIN = 6;
const uint8_t RELAY2_CMD_PIN = 7;
const uint8_t RELAY3_CMD_PIN = 8;
const uint8_t CHANNELS_RELAY_PINS[] = {RELAY1_CMD_PIN, RELAY2_CMD_PIN, RELAY3_CMD_PIN};

const uint8_t ON = HIGH;
const uint8_t OFF = LOW;

const uint8_t PEER_ROUTING_MAX_DATA_LEN = 4;

#define PEER_REPLY_MSG_TEMPLATE "{\"node\":\"%s\",\"type\":%d,\"status\":%d,\"time\":%lu,\"event\":%d,\"source\":%d,\"data\":%s}"
#define DEFAULT_NODE_NAME "node"EXPAND_AND_QUOTE(BUILD_TIME)

enum PeerEvent {
  PEER_NO_EVENT,
  PEER_LIST_EVENT,
  PEER_DEAD_EVENT,
  PEER_ALIVE_EVENT,
  LIGHT_PEER_CHANNELS_COUNT_EVENT,
  PEER_STATE_EVENT,
  PEER_DATE_EVENT,
  PEER_UPTIME_EVENT,
  PEER_NAME_EVENT,
  PEER_FREE_RAM_EVENT,
  PEER_IR_LEARN_START_EVENT,
  PEER_IR_LEARN_DONE_EVENT,
  PEER_TTL_LOW_EVENT,
  PEER_ALARM_EVENT,
  PEER_BATTERY_LEVEL_EVENT
};

enum PeerEventSource {
  PEER_NO_EVENT_SOURCE,
  PEER_SYSTEM_EVENT_SOURCE,
  PEER_USER_EVENT_SOURCE,
  PEER_IR_EVENT_SOURCE,
  PEER_SCHEDULER_EVENT_SOURCE
};

enum PeerStatus {
  PEER_STATUS_OK,
  PEER_INVALID_CMD_CODE,
  PEER_INVALID_CHANNEL_CODE,
  PEER_IR_KEY_ALREADY_ASSIGNED_CODE,
  PEER_NO_IR_KEYPRESS_CODE,
  PEER_NAME_ALREADY_ASSIGNED_CODE,
  PEER_NO_REPLY_CODE,
  PEER_NOT_REGISTERED_CODE,
  PEER_NO_IR_SUPPORT_CODE,
  PEER_LIST_MAX_CAPACITY_CODE
};

enum PayloadType {
  DISCOVERY_DATA,
  IR_LEARN_DATA,
  IR_LEARN_ROUTE_DATA,
  IR_DATA,
  IR_ROUTE_DATA,
  IR_LEARN_COMPLETE_DATA,
  CMD_DATA,
  DATE_TIME_SYNC_DATA,
  SERIAL_DATA
};

enum PeerType {
  LIGHT_TYPE,
  IR_LIGHT_TYPE,
  SERIAL_TYPE
};

struct IrLearnData {
  uint8_t targetPeer;
  uint8_t channel;
  uint32_t irKey;
  uint32_t irLearnTimeout;
};

struct LightsScheduler {
  LightsScheduler() :
  active(false) {};
  boolean active;
  uint8_t channel;
  uint8_t state;
  time_t datetime;
  boolean recurrent;
};

struct Peer {
  Peer(
    uint8_t peerAddress,
    const char* peerName,
    PeerType peerType,
    uint8_t peerDiscoveryTTL,
    uint32_t* routingData,
    uint8_t routingDataLen,
    time_t peerTime,
    uint32_t peerUptime) :
    ttl(peerDiscoveryTTL),
    address(peerAddress),
    type(peerType),
    peerRoutingDataLen(routingDataLen),
    time(peerTime),
    uptime(peerUptime)
    {
      if(peerName) {
        memcpy(name, peerName, PEER_NAME_MAX_LENGTH);
      }

      if(routingData) {
        memcpy(peerRoutingData, routingData, routingDataLen);
      }
    }
  
  static const uint8_t PEER_NAME_MAX_LENGTH = 16;
  uint8_t ttl;
  uint8_t address;
  char name[PEER_NAME_MAX_LENGTH];
  PeerType type;
  uint32_t peerRoutingData[PEER_ROUTING_MAX_DATA_LEN];
  uint8_t peerRoutingDataLen;
  time_t time;
  uint32_t uptime;
};

struct payload_t {
  PayloadType payloadType;
  uint8_t payloadData[DATA_PKT_MAX_LEN];
};

typedef void (*cmd_func)(PeerEventSource);

const char CMD1[] PROGMEM = "chcount";
const char CMD2[] PROGMEM = "lsch";
const char CMD3[] PROGMEM = "setch";
const char CMD4[] PROGMEM = "getch";
const char CMD5[] PROGMEM = "chtoggle";
const char CMD6[] PROGMEM = "allon";
const char CMD7[] PROGMEM = "alloff";
const char CMD8[] PROGMEM = "freemem";
const char CMD9[] PROGMEM = "getname";
const char CMD10[] PROGMEM = "setname";
const char CMD11[] PROGMEM = "uptime";
const char CMD12[] PROGMEM = "date";
const char CMD13[] PROGMEM = "setalarm";
const char CMD14[] PROGMEM = "lsalarms";
const char CMD15[] PROGMEM = "getbatt";

const char* const COMMANDS[] PROGMEM = {
  CMD1,
  CMD2,
  CMD3,
  CMD4,
  CMD5,
  CMD6,
  CMD7,
  CMD8,
  CMD9,
  CMD10,
  CMD11,
  CMD12,
  CMD13,
  CMD14,
  CMD15
};

class RFM12BLightsNode {
  public:
    RFM12BLightsNode (
      const uint8_t masterId,
      const uint8_t nodeId,
      const uint8_t networkId,
      const uint8_t frequency,
      const uint8_t maxChannels,
      const uint8_t* channelsCmdPins) :
      masterNodeAddress(masterId),
      nodeAddress(nodeId),
      networkAddress(networkId),
      frequencyChannel(frequency),
      nodeMaxChannels(maxChannels),
      nodeChannelsCmdPins(channelsCmdPins),
      parseCmdPtr(NULL),
      irLnKeys(NULL),
      powerDownStateStartTimestamp(0),
      wasPowerDownState(false),
      powerDownMode(false)
    {
      thisNode = this;
      irLnKeys = new uint32_t[maxChannels];
    }

    ~RFM12BLightsNode() {
      if(irLnKeys) {
        delete[] irLnKeys;
      }
    }

    void begin() {
      for(uint8_t i = 0; i < getNodeMaxChannels(); i++) {
        pinMode(nodeChannelsCmdPins[i], OUTPUT);
      }
      // all channels OFF at startup
      setChannelsState(OFF);
      randomSeed(analogRead(A4));
      loadIrKeys(irLnKeys, (sizeof(uint32_t) * getNodeMaxChannels()));
      configureNodeName();
      configureNodeAlarm();
      nodeInitMainInterfaces();
      // set power led functionality
      pinMode(POWER_LED_PIN, OUTPUT);
      digitalWrite(POWER_LED_PIN, HIGH);
    }

    void nodePowerUp() {
      powerDownMode = false;
      // signal node power up state
      digitalWrite(POWER_LED_PIN, HIGH);
      // come quickly from power down mode and enable the required peripherals
      LowPower.idle(SLEEP_15MS, ADC_ON, TIMER2_OFF, TIMER1_OFF, TIMER0_ON, SPI_ON, USART0_OFF, TWI_OFF);
      radio.Wakeup();
      nodeInitMainInterfaces(); 
    }

    void nodePowerDown() {
      powerDownMode = true;
      // signal node power down state
      digitalWrite(POWER_LED_PIN, LOW);
      radio.Sleep();
      LowPower.idle(SLEEP_500MS, ADC_ON, TIMER2_OFF, TIMER1_OFF, TIMER0_ON, SPI_OFF, USART0_OFF, TWI_OFF);
    }

    void update() {
      // if we are in power down mode then do not perform core functions
      if(!powerDownMode) {
        radioRx();
        sendDiscoverySignal();
        checkLightsScheduledAlarms();
      }
      
      checkMainsPower();
    }

    inline const uint8_t getMasterNodeAddress() { return masterNodeAddress; }
    inline const uint8_t getNodeAddress() { return nodeAddress; }
    inline const char* getNodeName() { return nodeName ? nodeName : DEFAULT_NODE_NAME; }
    inline const PeerType getNodeType() { return LIGHT_TYPE; }
    inline const uint8_t getNetworkAddress() { return networkAddress; }
    inline const uint8_t getNodeFrequency() { return frequencyChannel; }
    inline const uint8_t getNodeMaxChannels() { return nodeMaxChannels; }
    
  private:
    static const uint8_t POWER_LED_PIN = A0;
    static const uint32_t DISCOVERY_INTERVAL_RANDOMNESS_MIN = 3000;
    static const uint32_t DISCOVERY_INTERVAL_RANDOMNESS_MAX = 4000;
    static const uint8_t PEER_MAX_TTL = 3;
    static const uint8_t PEER_NAME_MAX_LENGTH = 16;
    static const long MAINS_ON_VCC_THRESHOLD_MV = 3300; 
    static const long MAINS_OFF_VCC_DELTA_MV = 200;
    static const byte VCC_SAMPLES_NO = 50;
    static const unsigned long MAINS_FAILURE_THRESHOLD_TIMEOUT_MS = 3000;
    static cmd_func cmd_actions[];
    static RFM12BLightsNode* thisNode;
    RFM12B radio;
    const uint8_t masterNodeAddress;
    const uint8_t nodeAddress;
    const uint8_t networkAddress;
    const uint8_t frequencyChannel;
    const uint8_t nodeMaxChannels;
    const uint8_t* nodeChannelsCmdPins;
    
    AsyncDelay discoveryInterval;
    uint32_t* irLnKeys;
    char nodeName[PEER_NAME_MAX_LENGTH];
    char* parseCmdPtr; // this is used by strtok_r internally
    LightsScheduler lightsAlarmInfo;
    AlarmID_t lightsAlarmId;
    unsigned long powerDownStateStartTimestamp;
    boolean wasPowerDownState;
    boolean powerDownMode;
    long lastBatterVoltageLevel;

    void initRadioInterface() {
      uint8_t KEY[] = "ABCDABCDABCDABCD";
      radio.Initialize(getNodeAddress(), getNodeFrequency(), getNetworkAddress());
      radio.Encrypt(KEY);
    }

    void initDiscovery() {
      discoveryInterval.start(
        random(
          DISCOVERY_INTERVAL_RANDOMNESS_MIN,
          DISCOVERY_INTERVAL_RANDOMNESS_MAX
        ),
        AsyncDelay::MILLIS
      );
    }

    // helper function for when we go in offline mode
    void nodeInitMainInterfaces() {
      // init radio module
      initRadioInterface();
      // start discovery signaling
      initDiscovery();
      // force discovery signal to be sent immediately 
      // this way the master node won't consider this node
      //  to be down between successive presses of mains switch
      discoveryInterval.expire();
    }

    long readVcc() {
      long result;
      // Read 1.1V reference against AVcc
      ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
      delay(2); // Wait for Vref to settle
      ADCSRA |= _BV(ADSC); // Convert
      while (bit_is_set(ADCSRA, ADSC));
      result = ADCL;
      result |= ADCH << 8;
      result = 1126400L / result; // Back-calculate AVcc in mV
      return result;
    }

    long averageVccReadings(byte samples) {
      long avg = 0;

      for(byte i = 0; i < samples; i++) {
        avg += readVcc()/samples;
      }

      return avg;
    }

    inline boolean isMainsPowerDown(long currentVoltage) {
      return (currentVoltage <= (MAINS_ON_VCC_THRESHOLD_MV - MAINS_OFF_VCC_DELTA_MV));
    }

    /*
      Q: How mains switch press is detected?
      A: By using a small backup battery(3V coin cell battery).

        1) When power switch is closed the node gets its power from mains and the backup battery
         is disconnected using a schottky diode in series(for low dropout voltage)
        2) When mains switch is pressed the module is powered by the small battery
          and the MCU detects this state by reading its supply voltage which will be less now
          (this is because of the voltage dropout on the diode also)
        3) When the switch is released the supply voltage changes again to its normal value
          (which is 3300mV or 3.3V - we have a good regulator for this so it's pretty stable and we can rely on it)

      Q: What happens on mains power failure for a long time?
      A: Because we use sleep mode for the MCU we don't have to worry to much about the battery draining too fast
    */

    void checkMainsPower() {
      boolean stateToggle = false;
      long currentVccVoltage = averageVccReadings(VCC_SAMPLES_NO);

      // if supply voltage reading drops below MAINS_ON_VCC_THRESHOLD_MV level, 
      //  then this means that we're on battery and we MAY have a keypress depending on how long the power down state is present
      if(isMainsPowerDown(currentVccVoltage) && !wasPowerDownState) {
        // record a power down state
        wasPowerDownState = true;
        // record last battery voltage level for reporting
        lastBatterVoltageLevel = currentVccVoltage;
        powerDownStateStartTimestamp = millis();
        nodePowerDown();
      } else if(wasPowerDownState && !isMainsPowerDown(currentVccVoltage)) {
        // if mains power is back and it didnt passed a long time then this means that the switch was released
        if((millis() - powerDownStateStartTimestamp) <= MAINS_FAILURE_THRESHOLD_TIMEOUT_MS) {
          // check current channels and take their state as a whole
          for(uint8_t i = 0; i < getNodeMaxChannels(); i++) {
            stateToggle |= getChannelState(i);
          }

          // toggle node channels on switch release
          stateToggle = !stateToggle;
          setChannelsState(stateToggle);

          // re-init node when mains power is back online
          nodePowerUp();
          channelsListStateCmd(PEER_USER_EVENT_SOURCE); // report current channels state
          queryBatteryLevelCmd(PEER_SYSTEM_EVENT_SOURCE); // report current battery state
          wasPowerDownState = false;
        // otherwise we have a mains power failure
        } else {
          // power down node to save battery life
          nodePowerDown();
          // if there was a mains power failure and lights were on before this happened then switch them off
          setChannelsState(OFF);
        }
      }

      // if mains power is off put mcu into sleep mode(idle) from time to time so that we save battery life
      if(isMainsPowerDown(currentVccVoltage)) {
        // power down node to save battery life
        nodePowerDown();
      } else if(wasPowerDownState){
        nodePowerUp();
        wasPowerDownState = false;
      }
    }

    void loadIrKeys(uint32_t irConfigData[], uint8_t len) {
      cli();
      //get assigned ir keys from eeprom storage
      eeprom_read_block(irConfigData, (const void*)0, len);
      sei();
    }

    void saveIrKeys(uint32_t irConfigData[], uint8_t len) {
      cli();
      eeprom_write_block(irConfigData, (void*)0, len);
      sei();
    }

    // loar from eeprom to destination variable "name"
    void loadNodeNameFromEEPROM() {
      uint16_t nodeNameDataCfgOffset = (sizeof(uint32_t) * getNodeMaxChannels()) + 2;
      // loading node name from eeprom storage
      cli();

      eeprom_busy_wait();
      memset(nodeName, 0, PEER_NAME_MAX_LENGTH);
      eeprom_read_block(
        nodeName,
        (const void*)nodeNameDataCfgOffset,
        (PEER_NAME_MAX_LENGTH - 1)
      );

      sei();
    }

    void saveNodeNameToEEPROM(char* newName) {
      uint16_t nodeCfgOffset = (sizeof(uint32_t) * getNodeMaxChannels()) + 1;

      cli();
      eeprom_busy_wait();
      eeprom_write_byte((uint8_t*)nodeCfgOffset, 'N');

      eeprom_busy_wait();
      eeprom_write_block(
        newName,
        (void*)(nodeCfgOffset + 1),
        (PEER_NAME_MAX_LENGTH - 1)
      );
      sei();
    }

    boolean isNodeNameConfigured() {
      uint16_t nodeCfgOffset = (sizeof(uint32_t) * getNodeMaxChannels()) + 1;
      char configCode;

      cli();
      eeprom_busy_wait();
      configCode = eeprom_read_byte((const uint8_t*)nodeCfgOffset);
      sei();

      return (configCode == 'N');
    }

    void configureNodeName() {
      if(!isNodeNameConfigured()) {
        memset(nodeName, 0, PEER_NAME_MAX_LENGTH);
        memcpy_P(nodeName, PSTR(DEFAULT_NODE_NAME), (PEER_NAME_MAX_LENGTH - 1));
      } else {
        loadNodeNameFromEEPROM();
      }
    }

    void sendDiscoverySignal() {
      if(discoveryInterval.isExpired()) {
        payload_t discoveryPayload;
        discoveryPayload.payloadType = DISCOVERY_DATA;
        Peer thisLightPeer(
          getNodeAddress(),
          getNodeName(),
          getNodeType(),
          PEER_MAX_TTL,
          irLnKeys,
          (getNodeMaxChannels() * sizeof(uint32_t)),
          now(),
          millis()
        );
        memcpy(&discoveryPayload.payloadData, (uint8_t*)(&thisLightPeer), sizeof(Peer));

        radio.Send(getMasterNodeAddress(), &discoveryPayload, sizeof(payload_t), false);
        discoveryInterval.repeat();
      }
    }    

    void sendReplyToMasterNode(PeerStatus status, PeerEvent eventType, PeerEventSource eventSource, char* msg, PayloadType dataPayloadType = SERIAL_DATA) {
      payload_t replyPayload;
      char replyData[DATA_PKT_MAX_LEN];
      memset(replyData, 0, DATA_PKT_MAX_LEN);

      sprintf_P(
        replyData,
        PSTR(PEER_REPLY_MSG_TEMPLATE),
        getNodeName(),
        getNodeType(),
        status,
        now(),
        eventType,
        eventSource,
        msg
      );

      replyPayload.payloadType = dataPayloadType;
      memcpy(replyPayload.payloadData, (uint8_t*)replyData, DATA_PKT_MAX_LEN);
      
      radio.Send(getMasterNodeAddress(), &replyPayload, sizeof(payload_t), false);
    }

    // boolean isIrKeyRegistered(uint32_t irConfigData[], uint8_t channelsNo, uint32_t irKey) {
    //   for(uint8_t i = 0; i < channelsNo; i++) {
    //     if(irConfigData[i] == irKey) {
    //       return true;
    //     }
    //   }

    //   return false;
    // }

    void processIrLearnCmd(uint8_t channel, uint32_t irKeyData) {
      // if(isIrKeyRegistered(irLnKeys, getNodeMaxChannels(), irKeyData)) {
      //   sendReplyToMasterNode(PEER_IR_KEY_ALREADY_ASSIGNED_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
      //   return;
      // }

      if(channel >= getNodeMaxChannels()) {
        sendReplyToMasterNode(PEER_INVALID_CHANNEL_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      irLnKeys[channel] = irKeyData;
      saveIrKeys(irLnKeys, (sizeof(uint32_t) * getNodeMaxChannels()));
      loadIrKeys(irLnKeys, (sizeof(uint32_t) * getNodeMaxChannels()));

      char irReplyData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      sprintf_P(irReplyData, PSTR("{\"channel\":%d,\"key\":%lu}"), channel, irKeyData);
      sendReplyToMasterNode(PEER_STATUS_OK, PEER_IR_LEARN_DONE_EVENT, PEER_IR_EVENT_SOURCE, irReplyData, IR_LEARN_COMPLETE_DATA);
    }

    void processIrCmd(uint32_t pressedKey) {
      for(uint8_t i = 0; i < getNodeMaxChannels(); i++) {
        if(pressedKey == irLnKeys[i]) {
          toggleChannel(i);
          channelsListStateCmd(PEER_IR_EVENT_SOURCE);
        }
      }
    }

    void radioRx() {
      if (radio.ReceiveComplete() && radio.CRCPass()) {
        payload_t recvPayload;
        memcpy(&recvPayload, (payload_t*)radio.Data, radio.GetDataLen());

        switch (recvPayload.payloadType) {
            // this means that some other ir capable node has ir data for us to learn
            case IR_LEARN_ROUTE_DATA:
              // if it's addressed to us
              if(((IrLearnData*)recvPayload.payloadData)->targetPeer == getNodeAddress()) {
                processIrLearnCmd(
                  ((IrLearnData*)recvPayload.payloadData)->channel,
                  ((IrLearnData*)recvPayload.payloadData)->irKey
                );
              }
              break;
            // this means we've got routed ir data from other ir lights node
            case IR_DATA:
              processIrCmd(*((uint32_t*)recvPayload.payloadData));
              break;
            case CMD_DATA:
              parseCmd((char*)recvPayload.payloadData);
              break;
            case DATE_TIME_SYNC_DATA:
              setTime(*((time_t*)recvPayload.payloadData));
              break;
            default:;
        }
      }
    }

    void setChannelsState(uint8_t state) {
      for(uint8_t i = 0; i < getNodeMaxChannels(); i++) {
        digitalWrite(nodeChannelsCmdPins[i], state);
      }
    }

    uint8_t getChannelState(uint8_t channel) {
      return digitalRead(nodeChannelsCmdPins[channel]);
    }

    void setChannelState(uint8_t channel, uint8_t state) {
      digitalWrite(thisNode->nodeChannelsCmdPins[channel], state);
    }

    void toggleChannel(uint8_t channel) {
      digitalWrite(
        thisNode->nodeChannelsCmdPins[channel],
        digitalRead(thisNode->nodeChannelsCmdPins[channel]) ? OFF : ON
      );
    }

    static void channelsCountCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char chCountData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      sprintf_P(chCountData, PSTR("%d"), thisNode->getNodeMaxChannels());
      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, LIGHT_PEER_CHANNELS_COUNT_EVENT, eventSource, chCountData);
    }

    static void channelsListStateCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char chStateData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      memset(chStateData, 0, sizeof(chStateData));

      strcat_P(chStateData, PSTR("["));

      char chState[2];
      for(uint8_t i = 0; i < thisNode->getNodeMaxChannels(); i++) {
        sprintf_P(chState, PSTR("%d"), digitalRead(thisNode->nodeChannelsCmdPins[i]));
        strcat(chStateData, chState);
        if((i >= 0) && (i < (thisNode->getNodeMaxChannels() -1))) {
          strcat_P(chStateData, PSTR(","));
        }
      }
      
      strcat_P(chStateData, PSTR("]"));

      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_STATE_EVENT, eventSource, chStateData);
    }

    static void getChannelStateCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char* channelArg = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      if(channelArg == NULL) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      uint8_t channel = (uint8_t)atoi(channelArg);
      if(channel >= thisNode->getNodeMaxChannels()) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CHANNEL_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      char chStateData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      sprintf_P(chStateData, PSTR("[%d]"), thisNode->getChannelState(channel));
      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_STATE_EVENT, eventSource, chStateData);
    }

    static void setChannelStateCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char* channelArg = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));
      char* channelState = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      if((channelArg == NULL) && (channelState == NULL) &&
        ((strcasecmp_P(channelState, PSTR("ON")) != 0) || (strcasecmp_P(channelState, PSTR("OFF")) != 0))) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      uint8_t channel = (uint8_t)atoi(channelArg);
      if(channel >= thisNode->getNodeMaxChannels()) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CHANNEL_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      thisNode->setChannelState(channel, (strcasecmp_P(channelState, PSTR("ON")) == 0) ? ON : OFF);

      channelsListStateCmd(eventSource);
    }

    static void toggleChannelStateCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char* channelArg = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      if(channelArg == NULL) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      uint8_t channel = (uint8_t)atoi(channelArg);
      if(channel >= thisNode->getNodeMaxChannels()) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CHANNEL_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      thisNode->toggleChannel(channel);
      channelsListStateCmd(eventSource);
    }

    static void allChannelsOnCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      thisNode->setChannelsState(ON);
      channelsListStateCmd(eventSource);
    }

    static void allChannelsOffCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      thisNode->setChannelsState(OFF);
      channelsListStateCmd(eventSource);
    }

    static void freeRamCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      extern int __heap_start, *__brkval;
      int v;
      char freeMemData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];

      sprintf_P(
        freeMemData,
        PSTR("%d"),
        (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval)
      );
      
      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_FREE_RAM_EVENT, eventSource, freeMemData);
    }

    static void getNameCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char nodeNameData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      sprintf_P(nodeNameData, PSTR("\"%s\""), thisNode->getNodeName());
      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_NAME_EVENT, eventSource, nodeNameData);
    }

    static void setNameCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char* newNodeName = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      if(newNodeName == NULL) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      // if same name used there's no point in saving it again
      if(strncmp(thisNode->getNodeName(), newNodeName, PEER_NAME_MAX_LENGTH) == 0) {
        thisNode->sendReplyToMasterNode(PEER_NAME_ALREADY_ASSIGNED_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      thisNode->saveNodeNameToEEPROM(newNodeName);

      // reconfigure new node name
      thisNode->configureNodeName();
      // print new name on serial
      getNameCmd(PEER_USER_EVENT_SOURCE);
    }

    static void getUptimeCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char nodeUptimeData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      
      uint32_t now = millis();
      uint32_t secs = now/1000, mins=secs/60;
      uint16_t hours = mins/60, days=hours/24;
      now-=secs*1000;
      secs-=mins*60;
      mins-=hours*60;
      hours-=days*24;

      sprintf_P(
        nodeUptimeData,
        PSTR("\"%d days %2.2d:%2.2d:%2.2d\""),
        days,
        (byte)hours,
        (byte)mins,
        (byte)secs
      );

      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_UPTIME_EVENT, eventSource, nodeUptimeData);
    }

    void getDateTime(PeerEventSource eventSource) {
      char nodeDateTimeData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];

      sprintf_P(
        nodeDateTimeData,
        PSTR("\"%2.2d/%2.2d/%d-%2.2d:%2.2d:%2.2d\""),
        month(),
        day(),
        year(),
        hour(),
        minute(),
        second()
      );

      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_DATE_EVENT, eventSource, nodeDateTimeData);
    }

    static void queryDateTimeCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      int hr, min, sec, day, month, yr;
      char* dateTimeArg = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      // if date command is passed without args return current system date
      if(dateTimeArg == NULL) {
        goto get_sys_date;
      }

      if(!Util::isnumeric(dateTimeArg)) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      setTime(atol(dateTimeArg));

      get_sys_date:
        thisNode->getDateTime(eventSource);
    }

    static void queryBatteryLevelCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char batteryLevelData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];
      sprintf_P(batteryLevelData, PSTR("[%lu]"), thisNode->lastBatterVoltageLevel);
      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_BATTERY_LEVEL_EVENT, eventSource, batteryLevelData);
    }

    void saveAlarmToEEPROM(LightsScheduler* lightsScheduler) {
      uint16_t alarmCfgOffset = ((sizeof(uint32_t) * thisNode->getNodeMaxChannels()) + 2) + PEER_NAME_MAX_LENGTH;

      cli();
      eeprom_busy_wait();
      eeprom_write_byte((uint8_t*)alarmCfgOffset, 'A');

      eeprom_busy_wait();
      eeprom_write_block(lightsScheduler, (void*)(alarmCfgOffset + 1), sizeof(LightsScheduler));
      sei();
    }

    void loadAlarmFromEEPROM() {
      uint16_t alarmCfgInfoOffset = ((sizeof(uint32_t) * thisNode->getNodeMaxChannels()) + 2) + PEER_NAME_MAX_LENGTH + 1;
      
      cli();
      eeprom_busy_wait();
      eeprom_read_block(&lightsAlarmInfo, (const void*)alarmCfgInfoOffset, sizeof(LightsScheduler));
      sei();
    }

    boolean isNodeAlarmConfigured() {
      uint16_t alarmCfgOffset = ((sizeof(uint32_t) * thisNode->getNodeMaxChannels()) + 2) + PEER_NAME_MAX_LENGTH;
      uint8_t alarmConfigCode;

      cli();
      eeprom_busy_wait();
      alarmConfigCode = eeprom_read_byte((const uint8_t*)alarmCfgOffset);
      sei();

      return (alarmConfigCode == 'A');
    }

    void configureNodeAlarm() {
      if(!isNodeAlarmConfigured()) {
        memset(&lightsAlarmInfo, 0, sizeof(LightsScheduler));
        lightsAlarmInfo.active = false;
      } else {
        loadAlarmFromEEPROM();
      }
    }

    static void listScheduledAlarmsCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char nodeAlarmData[DATA_PKT_MAX_LEN - strlen(PEER_REPLY_MSG_TEMPLATE)];

      sprintf_P(
        nodeAlarmData,
        PSTR("{\"c\":%d,\"s\":%d,\"a\":%d,\"r\":%d,\"t\":%lu}"),
        thisNode->lightsAlarmInfo.channel,
        thisNode->lightsAlarmInfo.state,
        thisNode->lightsAlarmInfo.active,
        thisNode->lightsAlarmInfo.recurrent,
        thisNode->lightsAlarmInfo.datetime
      );

      thisNode->sendReplyToMasterNode(PEER_STATUS_OK, PEER_ALARM_EVENT, eventSource, nodeAlarmData);
    }

    static void scheduleLightsChannelStateAlarmCmd(PeerEventSource eventSource = PEER_SYSTEM_EVENT_SOURCE) {
      char* scheduledChannel = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));
      char* scheduledState = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));
      char* scheduledTime = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));
      char* recurrent = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));
      char* active = strtok_r(NULL, " ", &(thisNode->parseCmdPtr));

      if((scheduledChannel == NULL) && (scheduledState == NULL) && (scheduledTime == NULL) && (active == NULL) && (recurrent == NULL) &&
        !Util::isnumeric(scheduledChannel) && !Util::isnumeric(scheduledTime) && 
        ((strcasecmp_P(scheduledState, PSTR("ON")) != 0) || (strcasecmp_P(scheduledState, PSTR("OFF")) != 0))) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      uint8_t channelToSchedule = (uint8_t)atoi(scheduledChannel);
      if(channelToSchedule >= thisNode->getNodeMaxChannels()) {
        thisNode->sendReplyToMasterNode(PEER_INVALID_CHANNEL_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      thisNode->setAndScheduleLightAlarm(channelToSchedule, scheduledState, atol(scheduledTime), (boolean)atoi(recurrent), (boolean)atoi(active));
    }

    static void lightSchedulerAlarmAction() {
      // if channel number is equal or greater than the max channels of this light node then this means that we want to set all channels
      if(thisNode->lightsAlarmInfo.channel >= thisNode->getNodeMaxChannels()) {
        thisNode->setChannelsState(thisNode->lightsAlarmInfo.state);
      } else {
        thisNode->setChannelState(thisNode->lightsAlarmInfo.channel, thisNode->lightsAlarmInfo.state);
      }

      channelsListStateCmd(PEER_SCHEDULER_EVENT_SOURCE);
    }

    void setAndScheduleLightAlarm(uint8_t channel, char* state, time_t scheduledTime, boolean recurrent, boolean active) {

      // activate the  scheduler and set its parameters
      lightsAlarmInfo.active = active;
      lightsAlarmInfo.recurrent = recurrent;
      lightsAlarmInfo.channel = channel;
      lightsAlarmInfo.state = (strcasecmp_P(state, PSTR("ON")) == 0) ? ON : OFF;
      lightsAlarmInfo.datetime = scheduledTime;

      // if there's already one alarm set then update it
      if(Alarm.count() == 1) {
        Alarm.write(lightsAlarmId, scheduledTime);
      } else {
        if(recurrent) {
          lightsAlarmId = Alarm.alarmRepeat(scheduledTime, lightSchedulerAlarmAction);
        } else {
          lightsAlarmId = Alarm.alarmOnce(scheduledTime, lightSchedulerAlarmAction);
        }
      }

      configureNodeAlarm();
      listScheduledAlarmsCmd(PEER_USER_EVENT_SOURCE);
    }

    void checkLightsScheduledAlarms() {
      if(lightsAlarmInfo.active) {
        Alarm.delay(1000);
      }
    }

    int findCmd(const char* cmd) {
      if((cmd == NULL) || !strlen(cmd)) {
        return -1;
      }

      for(uint8_t i = 0; i < sizeof(COMMANDS); i++) {
        if(strcmp_P(cmd, (const char*)pgm_read_word(&COMMANDS[i])) == 0) {
          return i;
        }
      } 

      return -1;
    }

    void parseCmd(char* cmd) {
      char* recvCmd = strtok_r(cmd, " ", &parseCmdPtr);

      int cmdIndex = findCmd(recvCmd);

      if(cmdIndex < 0) {
        sendReplyToMasterNode(PEER_INVALID_CMD_CODE, PEER_NO_EVENT, PEER_NO_EVENT_SOURCE, "0");
        return;
      }

      cmd_actions[cmdIndex](PEER_USER_EVENT_SOURCE);
    }    
};

RFM12BLightsNode rfLightsNode(
  MASTER_PEER_ID,
  LIGHTS_PEER_ID,
  NETWORK_ID,
  RF12_868MHZ,
  MAX_CHANNELS,
  CHANNELS_RELAY_PINS
);

RFM12BLightsNode* RFM12BLightsNode::thisNode;

cmd_func RFM12BLightsNode::cmd_actions[] = {
  channelsCountCmd,
  channelsListStateCmd,
  setChannelStateCmd,
  getChannelStateCmd,
  toggleChannelStateCmd,
  allChannelsOnCmd,
  allChannelsOffCmd,
  freeRamCmd,
  getNameCmd,
  setNameCmd,
  getUptimeCmd,
  queryDateTimeCmd,
  scheduleLightsChannelStateAlarmCmd,
  listScheduledAlarmsCmd,
  queryBatteryLevelCmd
};

void setup() {
  rfLightsNode.begin();
}

void loop() {
  rfLightsNode.update();
}