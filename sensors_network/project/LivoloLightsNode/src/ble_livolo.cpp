#include <Arduino.h>

// -------------------------------- NODE CONFIGURABLE FEATURES ----------------------------
//#define LIVOLO_ONE_CHANNEL
#define LIVOLO_TWO_CHANNEL

#define HAS_TOUCH_SENSING
#define HAS_MTCH_TOUCH_SENSOR
//#define TOUCH_SENSOR_INVERSE_LOGIC

#define HAS_LED_SIGNALING
// -----------------------------------------------------------------------------------------


// ----------------- DON'T TOUCH WHAT COMES NEXT ONLY IF YOU KNOW WHAT YOU'RE DOING ------------

// ---------------------------------------- TOUCH SENSORS CONFIGURATION ------------------------
#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t TOUCH_SENSORS_COUNT = 1;
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t TOUCH_SENSORS_COUNT = 2;
#else
#error "Unknown Livolo switch type!"
#endif

#define RELEASED  0
#define TOUCHED   1

const uint32_t SHORT_TOUCH_DETECT_THRESHOLD_MS = 200;

const uint8_t TOUCH_SENSE_LOW_POWER_MODE_PIN = 12;
const uint8_t TOUCH_SENSE_SENSITIVITY_ADJUST_PIN = 17;

#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[TOUCH_SENSORS_COUNT] = {8};
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[TOUCH_SENSORS_COUNT] = {8, 9};
#else
#error "Unknown Livolo switch type!"
#endif
// -------------------------------------------------------------------------------------------------------------

// ----------------------- LIGHTS SECTION ----------------------
#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t RELAY_COUNT = 1;
const uint8_t LED_COUNT = 1;
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t RELAY_COUNT = 2;
const uint8_t LED_COUNT = 2;
#else
#error "Unknown Livolo switch type!"
#endif

#define CHANNEL_1  0
#define CHANNEL_2  1

#define OFF 0
#define ON  1
#define SET_COIL_INDEX     0
#define RESET_COIL_INDEX   1

const uint8_t RELAY_CH_PINS[][2] = {
#if defined (LIVOLO_ONE_CHANNEL)
  {26, 27} // channel 1 relay control pins(bistable relay - 2 coils)
#elif defined (LIVOLO_TWO_CHANNEL)
  {28, 29}, // channel 1 relay control pins(bistable relay - 2 coils)
  {26, 27} // channel 2 relay control pins(bistable relay - 2 coils)
#else
  #error "Unknown Livolo switch type!"
#endif
};

const uint32_t RELAY_PULSE_DELAY_MS = 50;

#if defined (LIVOLO_ONE_CHANNEL)
uint8_t channelState[RELAY_COUNT] = {OFF};
const uint8_t LIGHT_STATE_LED_PINS[LED_COUNT] = {18};
#elif defined (LIVOLO_TWO_CHANNEL)
uint8_t channelState[RELAY_COUNT] = {OFF, OFF};
const uint8_t LIGHT_STATE_LED_PINS[LED_COUNT] = {18, 19};
#else
#error "Unknown Livolo switch type!"
#endif

#define TURN_RED_LED_ON(channel) digitalWrite(LIGHT_STATE_LED_PINS[channel], LOW)
#define TURN_BLUE_LED_ON(channel) digitalWrite(LIGHT_STATE_LED_PINS[channel], HIGH)

// --------------------------------------- BLE ----------------------------------------------------
#include <SPI.h>
#include <BLEPeripheral.h>

BLEPeripheral blePeripheral = BLEPeripheral();
BLEService livoloService = BLEService("CCC0");

BLECharCharacteristic livoloSwitchOneCharacteristic = BLECharCharacteristic("BBB0", BLERead | BLEWrite | BLENotify);
BLEDescriptor livoloSwitchOneDescriptor = BLEDescriptor("BBD0", "Light1");

#if defined (LIVOLO_TWO_CHANNEL)
BLECharCharacteristic livoloSwitchTwoCharacteristic = BLECharCharacteristic("BBB1", BLERead | BLEWrite | BLENotify);
BLEDescriptor livoloSwitchTwoDescriptor = BLEDescriptor("BBD0", "Light2");
#endif

void setChannelRelaySwitchState(uint8_t channel, uint8_t newState) {
  if(newState == ON) {
    digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], HIGH);
    delay(RELAY_PULSE_DELAY_MS);
    digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], LOW);
    channelState[channel] = ON;
#ifdef HAS_LED_SIGNALING
    TURN_RED_LED_ON(channel);
#endif
  } else {
    digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], HIGH);
    delay(RELAY_PULSE_DELAY_MS);
    digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], LOW);
    channelState[channel] = OFF;
#ifdef HAS_LED_SIGNALING
    TURN_BLUE_LED_ON(channel);
#endif
  }
}

bool checkTouchSensor() {
  static uint32_t lastTouchTimestamp[TOUCH_SENSORS_COUNT];
  static uint8_t touchSensorState[TOUCH_SENSORS_COUNT];
  bool triggered = false;

  for(uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
  #ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
  #else
    if((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
  #endif
    (touchSensorState[i] != TOUCHED)) {

      // latch in TOUCH state
      touchSensorState[i] = TOUCHED;
      lastTouchTimestamp[i] = millis();
    }

  #ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
  #else
    if((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
  #endif
    (touchSensorState[i] != RELEASED)) {

      lastTouchTimestamp[i] = millis() - lastTouchTimestamp[i];
      // evaluate elapsed time between touch states
      // we can do here short press and long press handling if desired
      if(lastTouchTimestamp[i] >= SHORT_TOUCH_DETECT_THRESHOLD_MS) {
        channelState[i] = !channelState[i];
        setChannelRelaySwitchState(i, channelState[i]);
        triggered = true;
      }
      // latch in RELEASED state
      touchSensorState[i] = RELEASED;
    }
  }

  return triggered;
}

void blePeripheralConnectHandler(BLECentral& central) {
  // central connected event handler
}

void blePeripheralDisconnectHandler(BLECentral& central) {
  // central disconnected event handler
}

// central wrote new value to characteristics, update state
void switchOneCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setChannelRelaySwitchState(CHANNEL_1, livoloSwitchOneCharacteristic.value());
}
#if defined (LIVOLO_TWO_CHANNEL)
void switchTwoCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setChannelRelaySwitchState(CHANNEL_2, livoloSwitchTwoCharacteristic.value());
}
#endif

// void disableUart() {
//   NRF_UART0->TASKS_STOPTX = 1;
//   NRF_UART0->TASKS_STOPRX = 1;
//   NRF_UART0->ENABLE = 0;
// }
//
// void disableSPI() {
//   NRF_SPI0->ENABLE = 0;
// }
//
// void disableTWI() {
//   NRF_TWI1->TASKS_STOP = 1;
//   NRF_TWI1->ENABLE = TWI_ENABLE_ENABLE_Disabled << TWI_ENABLE_ENABLE_Pos;
//   NRF_TWI1->INTENCLR = (TWI_INTENCLR_STOPPED_Disabled << TWI_INTENCLR_STOPPED_Pos)|
//                           (TWI_INTENCLR_RXDREADY_Disabled << TWI_INTENCLR_RXDREADY_Pos)|
//                           (TWI_INTENCLR_TXDSENT_Disabled << TWI_INTENCLR_TXDSENT_Pos)|
//                           (TWI_INTENCLR_ERROR_Disabled << TWI_INTENCLR_ERROR_Pos)|
//                           (TWI_INTENCLR_BB_Disabled << TWI_INTENCLR_BB_Pos);
// }

void setup() {
  // disableUart();
  // disableSPI();
  // disableTWI();

#ifdef HAS_MTCH_TOUCH_SENSOR
  analogWrite(TOUCH_SENSE_SENSITIVITY_ADJUST_PIN, 88);
  digitalWrite(TOUCH_SENSE_LOW_POWER_MODE_PIN, HIGH); // disable low power mode
#endif

#ifdef HAS_TOUCH_SENSING
  // set required mcu pins for reading touch sensors state
  for(uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
  }
#endif

#ifdef HAS_LED_SIGNALING
  // lit BLUE leds when starting up
  for(uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
    TURN_BLUE_LED_ON(i);
  }
#endif

  // set bistable relays initial state
  for(uint8_t i = 0; i < RELAY_COUNT; i++) {
    for(uint8_t j = 0; j < RELAY_COUNT; j++) {
      pinMode(RELAY_CH_PINS[i][j], OUTPUT);
      // make sure touch switch relays start in OFF state
      digitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], HIGH);
      delay(RELAY_PULSE_DELAY_MS);
      digitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], LOW);
    }
  }

  blePeripheral.setLocalName("Livolo Lights");
  blePeripheral.setAdvertisedServiceUuid(livoloService.uuid());

  blePeripheral.addAttribute(livoloService);


  blePeripheral.addAttribute(livoloSwitchOneCharacteristic);
  blePeripheral.addAttribute(livoloSwitchOneDescriptor);
#if defined (LIVOLO_TWO_CHANNEL)
  blePeripheral.addAttribute(livoloSwitchTwoCharacteristic);
  blePeripheral.addAttribute(livoloSwitchTwoDescriptor);
#endif

  // assign event handlers for connected, disconnected to peripheral
  blePeripheral.setEventHandler(BLEConnected, blePeripheralConnectHandler);
  blePeripheral.setEventHandler(BLEDisconnected, blePeripheralDisconnectHandler);

  // assign event handlers for characteristic
  livoloSwitchOneCharacteristic.setEventHandler(BLEWritten, switchOneCharacteristicWritten);
#if defined (LIVOLO_TWO_CHANNEL)
  livoloSwitchTwoCharacteristic.setEventHandler(BLEWritten, switchTwoCharacteristicWritten);
#endif

// set initial values for characteristics
  livoloSwitchOneCharacteristic.setValue(OFF);
#if defined (LIVOLO_TWO_CHANNEL)
  livoloSwitchTwoCharacteristic.setValue(OFF);
#endif

  // begin initialization
  blePeripheral.begin();

  // set TX power - must be called after begin
  blePeripheral.setTxPower(4);
}

void loop() {
  // poll peripheral
  blePeripheral.poll();

#ifdef HAS_TOUCH_SENSING
  // check touch sensors for changes
  if(checkTouchSensor()) {
    livoloSwitchOneCharacteristic.setValue(channelState[CHANNEL_1]);
#if defined (LIVOLO_TWO_CHANNEL)
    livoloSwitchTwoCharacteristic.setValue(channelState[CHANNEL_2]);
#endif
  }
#endif

  //sd_app_evt_wait();
}
