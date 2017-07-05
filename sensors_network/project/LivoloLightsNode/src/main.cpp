//#pragma GCC optimize ("-O2")

#include <Arduino.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
#define LIVOLO_ONE_CHANNEL
//#define LIVOLO_TWO_CHANNEL
// ----------------------------------------------------------------------------------

// ----------------------------------------- MYSENSORS SECTION ---------------------------------------
#define MY_REPEATER_FEATURE

// NRF24 radio
//#define MY_RADIO_RF24

//NRF51822 radio
#define MY_RADIO_NRF5_ESB

// RFM69 radio
//#define MY_RADIO_RFM69

#ifdef MY_RADIO_RFM69
#define MY_RFM69_NEW_DRIVER
#define MY_RFM69_FREQUENCY RFM69_868MHZ
#endif

#ifdef MY_RADIO_RF24
#define MY_RF24_CE_PIN    7
#define MY_RF24_CS_PIN    6
#define MY_RF24_PA_LEVEL  RF24_PA_MAX
#endif

#define MY_NODE_ID 247  // this needs to be set explicitly

#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED  // this node needs to be functional without mysensors network/gw too
//#define MY_TRANSPORT_DONT_CARE_MODE // this node needs to be functional without mysensors network/gw to
#define MY_TRANSPORT_RELAX // for future mysensors core upgrades(replaces MY_TRANSPORT_DONT_CARE_MODE)
#define MY_TRANSPORT_WAIT_READY_MS  3000

#define MY_DISABLED_SERIAL

#define MY_SENSOR_NODE_SKETCH_VERSION "2.2"

#include <MySensors.h>
// --------------------------------------------------------------------------------------------------------------

// ---------------------------------------- TOUCH SENSORS CONFIGURATION ------------------------
//#define TOUCH_SENSOR_INVERSE_LOGIC
#define RELEASED  0
#define TOUCHED   1

const uint32_t SHORT_TOUCH_DETECT_THRESHOLD_MS = 300;

#if defined (LIVOLO_ONE_CHANNEL)
#ifdef MY_RADIO_NRF5_ESB
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {8};
#else
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {3};
#endif
#elif defined (LIVOLO_TWO_CHANNEL)
#ifdef MY_RADIO_NRF5_ESB
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {8, 9};
#else
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {3, A1};
#endif
#else
#error "Unknown Livolo switch type!"
#endif
// -------------------------------------------------------------------------------------------------------------

// ----------------------- LIGHTS SECTION ----------------------
#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t NODE_SENSORS_COUNT = 1;
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t NODE_SENSORS_COUNT = 2;
#else
#error "Unknown Livolo switch type!"
#endif

const uint32_t LIGHTS_STATE_SEND_INTERVAL_MS = 180000; //3min status updates

const uint8_t SENSOR_DATA_SEND_RETRIES = 3;
const uint32_t SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS = 5;
const uint32_t SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS = 50;

#define OFF 0
#define ON  1
#define SET_COIL_INDEX     0
#define RESET_COIL_INDEX   1

const uint8_t RELAY_CH_PINS[][2] = {
#if defined (LIVOLO_ONE_CHANNEL)
  #ifdef MY_RADIO_NRF5_ESB
  {26, 27} // channel 1 relay control pins(bistable relay - 2 coils)
  #else
  {A4, A5} // channel 1 relay control pins(bistable relay - 2 coils)
  #endif
#elif defined (LIVOLO_TWO_CHANNEL)
  #ifdef MY_RADIO_NRF5_ESB
  {26, 27}, // channel 1 relay control pins(bistable relay - 2 coils)
  {28, 29} // channel 2 relay control pins(bistable relay - 2 coils)
  #else
  {A4, A5}, // channel 1 relay control pins(bistable relay - 2 coils)
  {0, 1} // channel 2 relay control pins(bistable relay - 2 coils)
  #endif
#else
  #error "Unknown Livolo switch type!"
#endif
};

const uint32_t RELAY_PULSE_DELAY_MS = 50;

#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t ATTACHED_SENSOR_TYPES[] = {S_BINARY};
uint8_t channelState[] = {OFF};
#ifdef MY_RADIO_NRF5_ESB
const uint8_t LIGHT_STATE_LED_PINS[] = {18};
#else
const uint8_t LIGHT_STATE_LED_PINS[] = {4};
#endif
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t ATTACHED_SENSOR_TYPES[] = {S_BINARY, S_BINARY};
uint8_t channelState[] = {OFF, OFF};
#ifdef MY_RADIO_NRF5_ESB
const uint8_t LIGHT_STATE_LED_PINS[] = {18, 19};
#else
const uint8_t LIGHT_STATE_LED_PINS[] = {4, A0};
#endif
#else
#error "Unknown Livolo switch type!"
#endif

#define TURN_RED_LED_ON(channel) hwDigitalWrite(LIGHT_STATE_LED_PINS[channel], LOW)
#define TURN_BLUE_LED_ON(channel) hwDigitalWrite(LIGHT_STATE_LED_PINS[channel], HIGH)
// ------------------------------------------------------------------------------

// --------------------------------------- NODE ALIVE CONFIG ------------------------------------------
//const uint32_t HEARTBEAT_SEND_INTERVAL_MS = 60000;  // 60s interval
// -------------------------------------------------------------------------------------------------------------

// --------------------------------------- NODE PRESENTATION CONFIG ------------------------------------------
//const uint32_t PRESENTATION_SEND_INTERVAL_MS = 600000; // 10 min
// -----------------------------------------------------------------------------------------------------------

// ------------------------------------------ SUPPLY VOLTAGE STATUS SECTION ---------------------------------
const uint32_t POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS = 300000;  // 5min(5 * 60 * 1000)
const uint16_t SUPPY_VOLTAGE_MV = 3000;
// -----------------------------------------------------------------------------------------------------------

uint8_t getSupplyVoltagePercentage() {
  return (hwCPUVoltage() * 100) / SUPPY_VOLTAGE_MV;
}

void presentNodeMetadata() {
  sendSketchInfo("Livolo", MY_SENSOR_NODE_SKETCH_VERSION);

  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    present(i + 1, ATTACHED_SENSOR_TYPES[i]);
  }
}

void sendData(uint8_t sensorId, uint8_t sensorData, uint8_t dataType) {
    MyMessage sensorDataMsg(sensorId, dataType);

    for (uint8_t retries = 0; !send(sensorDataMsg.set(sensorData), false) &&
         (retries < SENSOR_DATA_SEND_RETRIES); ++retries) {
        // random wait interval between retries for collisions
        wait(random(SENSOR_DATA_SEND_RETRIES_MIN_INTERVAL_MS,
            SENSOR_DATA_SEND_RETRIES_MAX_INTERVAL_MS));
    }
}

uint8_t getChannelState(uint8_t index) {
  return channelState[index];
}

void setChannelRelaySwitchState(uint8_t channel, uint8_t newState) {
  if(newState == ON) {
    hwDigitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], HIGH);
    wait(RELAY_PULSE_DELAY_MS);
    hwDigitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], LOW);
    channelState[channel] = ON;
    TURN_RED_LED_ON(channel);
  } else {
    hwDigitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], HIGH);
    wait(RELAY_PULSE_DELAY_MS);
    hwDigitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], LOW);
    channelState[channel] = OFF;
    TURN_BLUE_LED_ON(channel);
  }
}

void sendLightsState() {
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    sendData(i + 1, getChannelState(i), V_STATUS);
  }
}

void checkTouchSensor() {
  static uint32_t lastTouchTimestamp[NODE_SENSORS_COUNT];
  static uint8_t touchSensorState[NODE_SENSORS_COUNT];

  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
  #ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
  #else
    if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
  #endif
    (touchSensorState[i] != TOUCHED)) {

      // latch in TOUCH state
      touchSensorState[i] = TOUCHED;
      lastTouchTimestamp[i] = hwMillis();
    }

  #ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
  #else
    if((hwDigitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
  #endif
    (touchSensorState[i] != RELEASED)) {

      lastTouchTimestamp[i] = hwMillis() - lastTouchTimestamp[i];
      // evaluate elapsed time between touch states
      // we can do here short press and long press handling if desired
      if(lastTouchTimestamp[i] >= SHORT_TOUCH_DETECT_THRESHOLD_MS) {
        channelState[i] = !channelState[i];
        setChannelRelaySwitchState(i, channelState[i]);
        sendData(i + 1, channelState[i], V_STATUS);
      }
      // latch in RELEASED state
      touchSensorState[i] = RELEASED;
    }
  }
}

// called automatically by mysensors core for doing node presentation
void presentation() {
  presentNodeMetadata();
}

// called automatically by mysensors core for incomming messages
void receive(const MyMessage &message) {
  switch (message.type) {
    case V_STATUS:
    // V_STATUS message type for light switch set operations only
    if (message.getCommand() == C_SET) {
      // maybe perform some received data validation here ???
      setChannelRelaySwitchState((message.sensor - 1), message.getBool());
      wait(5); // don't send reply so fast - got some strange issues because of this
      sendData(message.sensor, message.getBool(), V_STATUS);
    }

    // V_STATUS message type for light switch get operations only
    if(message.getCommand() == C_REQ) {
      // maybe perform some received data validation here ???
      sendData(message.sensor, getChannelState(message.sensor - 1), V_STATUS);
    }
    break;
    default:;
  }
}

void before() {
  wdt_enable(WDTO_8S);

  // set required mcu pins for reading touch sensors state
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    hwPinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
  }

  // lit BLUE leds when starting up
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    hwPinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
    TURN_BLUE_LED_ON(i);
  }

  // set bistable relays initial state
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    for(uint8_t j = 0; j < NODE_SENSORS_COUNT; j++) {
      hwPinMode(RELAY_CH_PINS[i][j], OUTPUT);
      // make sure touch switch relays start in OFF state
      hwDigitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], HIGH);
      //wait(RELAY_PULSE_DELAY_MS);
      hwDigitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], LOW);
    }
  }
}

void setup() {

}

void loop()  {
  wdt_reset();

  static bool firstInit = false;
  if(!firstInit) {
    sendHeartbeat();
    sendBatteryLevel(getSupplyVoltagePercentage());
    sendLightsState();
    firstInit = true;
  }

  checkTouchSensor();

  static uint32_t lastLightsStateReportTimestamp;
  if(hwMillis() - lastLightsStateReportTimestamp >= LIGHTS_STATE_SEND_INTERVAL_MS) {
    sendLightsState();
    lastLightsStateReportTimestamp = hwMillis();
  }

  // static uint32_t lastHeartbeatReportTimestamp;
  // if ((hwMillis() - lastHeartbeatReportTimestamp) >= HEARTBEAT_SEND_INTERVAL_MS) {
  //  sendHeartbeat();
  //  lastHeartbeatReportTimestamp = hwMillis();
  // }

  // send power supply voltage level
  static uint32_t lastPowerSupplyVoltageLvlReportTimestamp;
  if(hwMillis() - lastPowerSupplyVoltageLvlReportTimestamp >= POWER_SUPPLY_VOLTAGE_LVL_REPORT_INTERVAL_MS) {
    sendBatteryLevel(getSupplyVoltagePercentage());
    lastPowerSupplyVoltageLvlReportTimestamp = hwMillis();
  }

  // send presentation on a regular interval too
  // static uint32_t lastPresentationTimestamp = 0;
  // if ((hwMillis() - lastPresentationTimestamp) >= PRESENTATION_SEND_INTERVAL_MS) {
  //  presentNodeMetadata();
  //  lastPresentationTimestamp = hwMillis();
  // }
}
