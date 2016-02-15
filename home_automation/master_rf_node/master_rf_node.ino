/*

  Master Node Unit

  - The RFM12B Network is based on a star type topology to keep things as simple as possible. 
  - This node is connected through the serial port to another board which runs a WebSocket server instance and it's connected obviously to the ethernet.

  How peer discovery is achieved?
  Things are very simple:
    1) Each peer(node) sends a "ping"(DISCOVERY payload type) and a TTL(set to PEER_MAX_TTL) at a random interval between 3000 and 4000ms(this is so in order
       to avoid collisions - this is a primitive mechanism but it works well for small networks)
    2) The master node gets those "pings" at a regular interval set to 4000ms(it must be at least equal to the maximum time for sending pings - which is 4000ms from above,
        in order for the peers to have time to register)
    3) The master node then checks by inspecting the payload peer metadata if the node was registered or not
    4) If the node isn't registered then add it will add it to a list of known peers
    5) If the node is already registered then it updates its TTL(aka Time To Live) which is sent by the peer(PEER_MAX_TTL)
    6) At a regular interval(set to 4000ms) the master node checks peers TTL's:
        a) first it decrements the known peers TTL's by 1
        b) checks if the peers TTL decreased to 0 - this means that the peers didn't sent their TTL for PEER_MAX_TTL times in a row which means they're dead and so they're removed from the list

*/ 

#include <Arduino.h>
#include <RFM12B.h>
#include <SerialCommand.h>
#include <AsyncDelay.h>
#include <Time.h>
#include <Util.h>

#define QUOTE(str) #str
#define EXPAND_AND_QUOTE(str) QUOTE(str)

const uint8_t DATA_PKT_MAX_LEN = 120;
const uint32_t SERIAL_BAUDRATE = 115200;
const uint8_t MASTER_PEER_ID = 1; 		//network ID used for this unit
const uint8_t NETWORK_ID = 99; 		   //the network ID we are on

const uint8_t PEER_ROUTING_MAX_DATA_LEN = 4;
const uint8_t MAX_PEERS = 30;

#define DEFAULT_NODE_NAME "node"EXPAND_AND_QUOTE(BUILD_TIME)

#define SERIAL_EOL "\r\n"
#define MASTER_NODE_REPLY_MSG_HEADER(ARG)  ("{\"node\":\"%s\",\"type\":%d,\"status\":%d,\"time\":%lu,\"event\":%d,\"source\":%d,\"data\":"ARG)
#define MASTER_NODE_REPLY_MSG_TEMPLATE(ARG1,ARG2)  (MASTER_NODE_REPLY_MSG_HEADER(ARG1"}"ARG2""))

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

class RMF12BMasterNode {
  public:
    RMF12BMasterNode (
      const uint8_t nodeId,
      const uint8_t networkId,
      const uint8_t frequency,
      const uint32_t baudrate,
      const uint8_t maxPeers) :
      nodeAddress(nodeId),
      networkAddress(networkId),
      frequencyChannel(frequency),
      serialBaudrate(baudrate),
      sCmd(Serial),
      maxAllowedPeers(maxPeers),
      peersList(maxPeers),
      peersDateTimeWasSynced(false),
      irLearnMode(false)
    {
      thisNode = this;
    }

    void begin() {
      configureNodeName();
      initRadioInterface();
      initPeerDiscovery();
      initPeersDateTimeSync();
      initSerialCmdInterface();
    }

    void update() {
      checkPeersTTL(&peersList);
      checkIrLearnData();
      syncPeersDateTime(&peersList);
      radioRx();
      sCmd.readSerial();
    }

    inline const uint8_t getNodeAddress() { return nodeAddress; }
    inline const char* getNodeName() { return nodeName ? nodeName : DEFAULT_NODE_NAME; }
    inline const PeerType getNodeType() { return SERIAL_TYPE; }
    inline const uint8_t getNetworkAddress() { return networkAddress; }
    inline const uint8_t getNodeFrequency() { return frequencyChannel; }
    inline const uint8_t getMaxPeersCapacity() { return maxAllowedPeers; }

  private:
    static const uint32_t PEER_TTL_CHECK_INTERVAL = 4000;
    static const uint32_t PEER_DATE_TIME_SYNC_INTERVAL = 14000;
    static const uint8_t PEER_MAX_TTL = 3;
    static const uint8_t PEER_TIMEOUT_TTL = 0;
    static const uint8_t PEER_NAME_MAX_LENGTH = 16;
    static RMF12BMasterNode* thisNode;
    RFM12B radio;
    const uint8_t nodeAddress;
    const uint8_t networkAddress;
    const uint8_t frequencyChannel;
    const uint32_t serialBaudrate;
    AsyncDelay checkPeerInterval;
    AsyncDelay syncPeersDateTimeInterval;
    SerialCommand sCmd;
    char nodeName[PEER_NAME_MAX_LENGTH];
    const uint8_t maxAllowedPeers;
    Util::ArrayList<Peer> peersList;
    boolean peersDateTimeWasSynced;
    AsyncDelay irLearnInterval;
    boolean irLearnMode;

    void initSerialCmdInterface() {
      sCmd.addCommand(F("date"), queryNodeUnitDateTimeCmd); // get/set current time
      sCmd.addCommand(F("uptime"),queryNodeUnitUptimeCmd); // get uptime
      sCmd.addCommand(F("lspeers"), listDiscoveredPeersCmd); // list discovered peers
      sCmd.addCommand(F("qpeer"), queryPeerCmd); // send command to a peer
      sCmd.addCommand(F("irlpeer"), irLearnPeerCmd); // ir learn peer
      sCmd.addCommand(F("setname"), setNodeNameCmd); // set node name
      sCmd.addCommand(F("getname"), getNodeNameCmd); // get node name
      sCmd.addCommand(F("freemem"), freeRamCmd); // display node free ram in bytes
      sCmd.setDefaultHandler(invalidCommand); // handler for command that isn't matched

      Serial.begin(serialBaudrate);
    }

    void initRadioInterface() {
      uint8_t KEY[] = "ABCDABCDABCDABCD";
      radio.Initialize(nodeAddress, frequencyChannel, networkAddress);
      radio.Encrypt(KEY);
    }

    void initPeerDiscovery() {
      checkPeerInterval.start(PEER_TTL_CHECK_INTERVAL, AsyncDelay::MILLIS);
    }

    void initPeersDateTimeSync() {
      syncPeersDateTimeInterval.start(PEER_DATE_TIME_SYNC_INTERVAL, AsyncDelay::MILLIS);
    }

    // loar from eeprom to destination variable "name"
    void loadNodeNameFromEEPROM() {
      uint16_t nodeNameDataCfgOffset = 1;
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
      uint16_t nodeCfgOffset = 0;

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
      uint16_t nodeCfgOffset = 0;
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

    static void invalidCommand() {
      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%hhu",SERIAL_EOL)),
        thisNode->getNodeName(),
        thisNode->getNodeType(),
        PEER_INVALID_CMD_CODE,
        now(),
        PEER_NO_EVENT,
        PEER_USER_EVENT_SOURCE,
        0
      );
    }

    void getNodeUnitTime() {
      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%lu",SERIAL_EOL)),
        getNodeName(),
        getNodeType(),
        PEER_STATUS_OK,
        now(),
        PEER_DATE_EVENT,
        PEER_USER_EVENT_SOURCE,
        now()
      );
    }

    static void queryNodeUnitDateTimeCmd() {
      int hr, min, sec, day, month, yr;
      char* dateTimeArg = thisNode->sCmd.next();

      // if date command is passed without args return current system date
      if(dateTimeArg == NULL) {
        goto get_sys_date;
      }

      if(!Util::isnumeric(dateTimeArg)) {
        invalidCommand();
        return;
      }

      setTime(atol(dateTimeArg));

      get_sys_date:
        thisNode->getNodeUnitTime();
    }

    static void queryNodeUnitUptimeCmd() {
      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%lu",SERIAL_EOL)),
        thisNode->getNodeName(),
        thisNode->getNodeType(),
        PEER_STATUS_OK,
        now(),
        PEER_UPTIME_EVENT,
        PEER_USER_EVENT_SOURCE,
        millis()
      );
    }

    static void freeRamCmd() {
      extern int __heap_start, *__brkval;
      int v;

      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%d",SERIAL_EOL)),
        thisNode->getNodeName(),
        thisNode->getNodeType(),
        PEER_STATUS_OK,
        now(),
        PEER_FREE_RAM_EVENT,
        PEER_USER_EVENT_SOURCE,
        (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval)
      );
    }

    static void queryPeerCmd() {
      char* peerNameArg = thisNode->sCmd.next();

      if(peerNameArg == NULL) {
        invalidCommand();
        return;
      }

      if(!thisNode->isPeerRegistered(&thisNode->peersList, peerNameArg)) {
        Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%hhu",SERIAL_EOL)),
          thisNode->getNodeName(),
          thisNode->getNodeType(),
          PEER_NOT_REGISTERED_CODE,
          now(),
          PEER_NO_EVENT,
          PEER_USER_EVENT_SOURCE,
          0
        );
        return;
      }

      payload_t qPeerPayload;
      qPeerPayload.payloadType = CMD_DATA;
      memset(qPeerPayload.payloadData, 0, DATA_PKT_MAX_LEN);

      char* nextParam = NULL;
      while(((nextParam = thisNode->sCmd.next()) != NULL) && (strlen((char*)qPeerPayload.payloadData) < DATA_PKT_MAX_LEN)) {
        strcat((char*)qPeerPayload.payloadData, nextParam);
        strcat((char*)qPeerPayload.payloadData, " ");
      }

      thisNode->radio.Send(thisNode->getPeerId(&(thisNode->peersList), peerNameArg), &qPeerPayload, sizeof(payload_t), false);
    }

    static void irLearnPeerCmd() {
      char* peerIrLearnNameArg = thisNode->sCmd.next();
      char* peerIrLearnChannel = thisNode->sCmd.next();
      char* peerIrLearnTimeout = thisNode->sCmd.next();

      if((peerIrLearnNameArg == NULL) || (peerIrLearnChannel == NULL) || (peerIrLearnTimeout == NULL) ||
          !Util::isnumeric(peerIrLearnChannel) || !Util::isnumeric(peerIrLearnTimeout)) 
      {
        invalidCommand();
        return;
      }

      if(!thisNode->isPeerRegistered(&thisNode->peersList, peerIrLearnNameArg)) {
        Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%hhu",SERIAL_EOL)),
          thisNode->getNodeName(),
          thisNode->getNodeType(),
          PEER_NOT_REGISTERED_CODE,
          now(),
          PEER_NO_EVENT,
          PEER_USER_EVENT_SOURCE,
          0
        );
        return;
      } 

      // if there are no ir light peers registered there's no point to continue and send a notification
      if(!thisNode->isPeerTypeRegistered(&thisNode->peersList, IR_LIGHT_TYPE)) {
        Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("%hhu",SERIAL_EOL)),
          thisNode->getNodeName(),
          thisNode->getNodeType(),
          PEER_NO_IR_SUPPORT_CODE,
          now(),
          PEER_NO_EVENT,
          PEER_USER_EVENT_SOURCE,
          0
        );
        return;
      }

      IrLearnData irLearnData;
      irLearnData.targetPeer = thisNode->getPeerId(&(thisNode->peersList), peerIrLearnNameArg);
      irLearnData.channel = (uint8_t)atoi(peerIrLearnChannel);
      irLearnData.irLearnTimeout = atol(peerIrLearnTimeout);

      payload_t irLearnPayload;
      irLearnPayload.payloadType = IR_LEARN_DATA;
      memcpy((IrLearnData*)irLearnPayload.payloadData, &irLearnData, sizeof(IrLearnData));

      // send a notification that ir learn process started with correct peer metadata
      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("{\"channel\":%hhu,\"timeout\":%lu}",SERIAL_EOL)),
        peerIrLearnNameArg,
        (thisNode->findPeer(&thisNode->peersList, irLearnData.targetPeer))->type,
        PEER_STATUS_OK,
        now(),
        PEER_IR_LEARN_START_EVENT,
        PEER_SYSTEM_EVENT_SOURCE,
        irLearnData.channel,
        irLearnData.irLearnTimeout
      );

      thisNode->startIrLearnMode(irLearnData.irLearnTimeout);

      for (uint8_t i = 0, totalPeerSlots = thisNode->peersList.count(); i < totalPeerSlots; i++) {
        if(thisNode->peersList[i]->type == IR_LIGHT_TYPE) {
          thisNode->radio.Send(thisNode->peersList[i]->address, &irLearnPayload, sizeof(payload_t));
        }
      }
    }

    static void listDiscoveredPeersCmd() {
      Serial.printf(F(MASTER_NODE_REPLY_MSG_HEADER("[")),
        thisNode->getNodeName(),
        thisNode->getNodeType(),
        PEER_STATUS_OK,
        now(),
        PEER_LIST_EVENT,
        PEER_USER_EVENT_SOURCE
      );

      for (uint8_t i = 0,
          totalPeerSlots = thisNode->peersList.count(),
          lastPeerSlotIndex = thisNode->peersList.getLastIndex(); i < thisNode->peersList.size(); i++) 
      {
        if(thisNode->peersList[i] != NULL) {
          Serial.printf(F("{\"name\":\"%s\",\"type\":%d,\"time\":%lu,\"uptime\":%lu,\"ttl\":%hhu}"),
            thisNode->peersList[i]->name,
            thisNode->peersList[i]->type,
            thisNode->peersList[i]->time,
            thisNode->peersList[i]->uptime,
            thisNode->peersList[i]->ttl
          );

          if((totalPeerSlots > 1) && (i < lastPeerSlotIndex)) {
            Serial.print(F(","));
          }
        }
      }

      Serial.print(F("]}\r\n"));
    }

    static void setNodeNameCmd() {
      char* newNodeName = thisNode->sCmd.next();

      if(newNodeName == NULL) {
        invalidCommand();
        return;
      }

      thisNode->saveNodeNameToEEPROM(newNodeName);

      // reconfigure new node name
      thisNode->configureNodeName();
      // print new name on serial
      getNodeNameCmd();
    }

    static void getNodeNameCmd() {
      Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
        thisNode->getNodeName(),
        thisNode->getNodeType(),
        PEER_STATUS_OK,
        now(),
        PEER_NAME_EVENT,
        PEER_USER_EVENT_SOURCE,
        thisNode->getNodeName()
      );
    }

    int8_t getPeerId(Util::ArrayList<Peer>* peersList, char* peerName) {
      if(peerName == NULL) {
        return -1;
      }

      for(uint8_t i = 0; i < peersList->size(); i++) {
        if(((*peersList)[i] != NULL) && (strcmp((*peersList)[i]->name, peerName) == 0)) {
          return (*peersList)[i]->address;
        }
      }

      return -1;
    }

    // search peer by name
    Peer* findPeer(Util::ArrayList<Peer>* peersList, char* peerName) {
      if(!peerName) {
        return NULL;
      }

      for(uint8_t i = 0; i < peersList->size(); i++) {
        if(((*peersList)[i] != NULL) && (strcmp((*peersList)[i]->name, peerName) == 0)) {
          return (*peersList)[i];
        }
      }

      return NULL;
    }

    // search peer by id
    Peer* findPeer(Util::ArrayList<Peer>* peersList, uint8_t address) {
      for(uint8_t i = 0; i < peersList->size(); i++) {
        if(((*peersList)[i] != NULL) && ((*peersList)[i]->address == address)) {
          return (*peersList)[i];
        }
      }

      return NULL;
    }

    // check if we have peers registered of the specified type
    boolean isPeerTypeRegistered(Util::ArrayList<Peer>* peersList, PeerType peerType) {
      for(uint8_t i = 0; i < peersList->size(); i++) {
        if(((*peersList)[i] != NULL) && ((*peersList)[i]->type == peerType)) {
          return true;
        }
      }

      return false;
    }

    // check peer registration by name
    boolean isPeerRegistered(Util::ArrayList<Peer>* peersList, char* peerName) {
      return (findPeer(peersList, peerName) != NULL);
    }

    // check peer registration by id
    boolean isPeerRegistered(Util::ArrayList<Peer>* peersList, uint8_t peerAddress) {
      return (findPeer(peersList, peerAddress) != NULL);
    }

    void updatePeerData(Util::ArrayList<Peer>* peersList, payload_t* peerPayload) {
      Peer* peer = NULL;

      if((peer = findPeer(peersList, ((Peer*)(peerPayload->payloadData))->address)) != NULL) {
        peer->ttl = ((Peer*)(peerPayload->payloadData))->ttl;
        // if peer name was changed update it and then send a list update notification
        if(strncmp(((Peer*)(peerPayload->payloadData))->name, peer->name, peer->PEER_NAME_MAX_LENGTH) != 0) 
        {
          memcpy(peer->name, ((Peer*)(peerPayload->payloadData))->name, peer->PEER_NAME_MAX_LENGTH);
          listDiscoveredPeersCmd();
        }
        
        peer->peerRoutingDataLen = ((Peer*)(peerPayload->payloadData))->peerRoutingDataLen;
        memcpy(peer->peerRoutingData, ((Peer*)(peerPayload->payloadData))->peerRoutingData, ((Peer*)(peerPayload->payloadData))->peerRoutingDataLen);
    
        peer->time = ((Peer*)(peerPayload->payloadData))->time;
        peer->uptime = ((Peer*)(peerPayload->payloadData))->uptime;

        // we want to send peers list notifications when their time or uptime changes
        if(peersDateTimeWasSynced) {
          listDiscoveredPeersCmd();
          peersDateTimeWasSynced = false;
        }
      }
    }

    void checkPeersTTL(Util::ArrayList<Peer>* peersList) {
      if(checkPeerInterval.isExpired()) {
        for(uint8_t i = 0; i < peersList->size(); i++) {
          if((*peersList)[i] != NULL) {
            if((*peersList)[i]->ttl == PEER_TIMEOUT_TTL) {
              // notify which peer is dead and was removed
              Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
                (*peersList)[i]->name,
                (*peersList)[i]->type,
                PEER_STATUS_OK,
                now(),
                PEER_DEAD_EVENT,
                PEER_SYSTEM_EVENT_SOURCE,
                "0"
              );

              peersList->remove(i);

              // when a peer was removed send a peer list update notification
              listDiscoveredPeersCmd();
            } else if((*peersList)[i]->ttl < (PEER_MAX_TTL -1)) {
              // if peer's TTL is critically low then send a warning notification first
              Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
                (*peersList)[i]->name,
                (*peersList)[i]->type,
                PEER_STATUS_OK,
                now(),
                PEER_TTL_LOW_EVENT,
                PEER_SYSTEM_EVENT_SOURCE,
                "0"
              );
            }
            (*peersList)[i]->ttl--;
          }
        }

        checkPeerInterval.repeat();
      }
    }

    void syncPeersDateTime(Util::ArrayList<Peer>* peersList) {
      if(syncPeersDateTimeInterval.isExpired()) {
        for(uint8_t i = 0; i < peersList->size(); i++) {
          if((*peersList)[i] != NULL) {
            payload_t syncPeerDateTimePayload;
            syncPeerDateTimePayload.payloadType = DATE_TIME_SYNC_DATA;
            time_t currentTimestamp = now();
            memcpy(syncPeerDateTimePayload.payloadData, &currentTimestamp, sizeof(time_t));

            radio.Send((*peersList)[i]->address, &syncPeerDateTimePayload, sizeof(payload_t), false);
          }
        }

        peersDateTimeWasSynced = true;
        syncPeersDateTimeInterval.repeat();
      }
    }

    void startIrLearnMode(uint32_t timeout) {
      irLearnMode = true;
      irLearnInterval.start(timeout, AsyncDelay::MILLIS);
    }

    void stopIrLearnMode() {
      irLearnMode = false;
      irLearnInterval.expire();
    }

    void checkIrLearnData() {
      if(irLearnMode && irLearnInterval.isExpired()) {
        stopIrLearnMode();
        Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
          getNodeName(),
          getNodeType(),
          PEER_NO_IR_KEYPRESS_CODE,
          now(),
          PEER_NO_EVENT,
          PEER_NO_EVENT_SOURCE,
          "0"
        );
      }
    }

    void radioRx() {
      if (radio.ReceiveComplete() && radio.CRCPass()) {
        payload_t recvPayload;
        memcpy(&recvPayload, (payload_t*)radio.Data, radio.GetDataLen());

        switch (recvPayload.payloadType ) {
          case SERIAL_DATA:
            if(irLearnMode) {
              stopIrLearnMode();
            }
            Serial.println((char*)recvPayload.payloadData);
            break;
          case DISCOVERY_DATA:
            if(!isPeerRegistered(&peersList, ((Peer*)((&recvPayload)->payloadData))->address)) {
              // if we haven't exceeded max capacity
              if(peersList.count() < getMaxPeersCapacity()) {
                // notify which peer was discovered and added
                Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
                  ((Peer*)((&recvPayload)->payloadData))->name,
                  ((Peer*)((&recvPayload)->payloadData))->type,
                  PEER_STATUS_OK,
                  now(),
                  PEER_ALIVE_EVENT,
                  PEER_SYSTEM_EVENT_SOURCE,
                  "0"
                );
                // add the new discovered peer to the registration list
                peersList.add(
                  new Peer(
                    ((Peer*)((&recvPayload)->payloadData))->address,
                    ((Peer*)((&recvPayload)->payloadData))->name,
                    ((Peer*)((&recvPayload)->payloadData))->type,
                    ((Peer*)((&recvPayload)->payloadData))->ttl,
                    ((Peer*)((&recvPayload)->payloadData))->peerRoutingData,
                    ((Peer*)((&recvPayload)->payloadData))->peerRoutingDataLen,
                    ((Peer*)((&recvPayload)->payloadData))->time,
                    ((Peer*)((&recvPayload)->payloadData))->uptime
                  )
                );
                // when a new peer was added send a list refresh notification event
                listDiscoveredPeersCmd();
              } else {
                // signal that max capacity reached
                Serial.printf(F(MASTER_NODE_REPLY_MSG_TEMPLATE("\"%s\"",SERIAL_EOL)),
                  getNodeName(),
                  getNodeType(),
                  PEER_LIST_MAX_CAPACITY_CODE,
                  now(),
                  PEER_NO_EVENT,
                  PEER_SYSTEM_EVENT_SOURCE,
                  "0"
                );
              }
            } else {
              updatePeerData(&peersList, &recvPayload);
            }
            break;
          // this is sent by a peer when it successfully learned an ir key
          case IR_LEARN_COMPLETE_DATA:
            if(irLearnMode) {
              stopIrLearnMode();
              Serial.println((char*)recvPayload.payloadData);
            }
            break;
          // this means we have to route ir data to other nodes
          case IR_ROUTE_DATA:
            for (int i = 0; i < peersList.count(); i++) {
              // don't route to same node again
              if(peersList[i]->address != radio.GetSender()) {
                for(uint8_t j =0; j < peersList[i]->peerRoutingDataLen; j++) {
                  if(peersList[i]->peerRoutingData[j] == *((uint32_t*)recvPayload.payloadData)) {
                    // transform this into an IR_DATA type packet for processing on the target node
                    recvPayload.payloadType = IR_DATA;
                    radio.Send(peersList[i]->address, &recvPayload, sizeof(payload_t), false);
                  }
                }
              }
            }
            break;
          default:;
        }
      }
    }
};

RMF12BMasterNode rfMasterNode(
  MASTER_PEER_ID,
  NETWORK_ID,
  RF12_868MHZ,
  SERIAL_BAUDRATE,
  MAX_PEERS
);
RMF12BMasterNode* RMF12BMasterNode::thisNode;

void setup() {
  rfMasterNode.begin();
}

void loop() {
  rfMasterNode.update();
}

