#include <Arduino.h>

// -------------------------------- NODE CUSTOM FEATURES ----------------------------
//#define LIVOLO_ONE_CHANNEL
#define LIVOLO_TWO_CHANNEL
#define MTCH_TOUCH_SENSOR
//#define TOUCH_SENSOR_INVERSE_LOGIC

#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t NODE_SENSORS_COUNT = 1;
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t NODE_SENSORS_COUNT = 2;
#else
#error "Unknown Livolo switch type!"
#endif
// ----------------------------------------------------------------------------------

// ---------------------------------------- TOUCH SENSORS CONFIGURATION ------------------------
//#define TOUCH_SENSOR_INVERSE_LOGIC

#define RELEASED  0
#define TOUCHED   1

const uint32_t SHORT_TOUCH_DETECT_THRESHOLD_MS = 200;

const uint8_t TOUCH_SENSE_LOW_POWER_MODE_PIN = 12;
const uint8_t TOUCH_SENSE_SENSITIVITY_ADJUST_PIN = 17;

#if defined (LIVOLO_ONE_CHANNEL)
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {8};
#elif defined (LIVOLO_TWO_CHANNEL)
const uint8_t TOUCH_SENSOR_CHANNEL_PINS[] = {8, 9};
#else
#error "Unknown Livolo switch type!"
#endif
// -------------------------------------------------------------------------------------------------------------

// ----------------------- LIGHTS SECTION ----------------------
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
uint8_t channelState[] = {OFF};
const uint8_t LIGHT_STATE_LED_PINS[] = {18};
#elif defined (LIVOLO_TWO_CHANNEL)
uint8_t channelState[] = {OFF, OFF};
const uint8_t LIGHT_STATE_LED_PINS[] = {18, 19};
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

#if defined (LIVOLO_ONE_CHANNEL)
  BLECharCharacteristic livoloSwitchOneCharacteristic = BLECharCharacteristic("BBB0", BLERead | BLEWrite | BLENotify);
  BLEDescriptor livoloSwitchOneDescriptor = BLEDescriptor("BBD0", "Light1");
#elif defined (LIVOLO_TWO_CHANNEL)
  BLECharCharacteristic livoloSwitchOneCharacteristic = BLECharCharacteristic("BBB0", BLERead | BLEWrite | BLENotify);
  BLEDescriptor livoloSwitchOneDescriptor = BLEDescriptor("BBD0", "Light1");

  BLECharCharacteristic livoloSwitchTwoCharacteristic = BLECharCharacteristic("BBB1", BLERead | BLEWrite | BLENotify);
  BLEDescriptor livoloSwitchTwoDescriptor = BLEDescriptor("BBD0", "Light2");
#else
  #error "Unknown Livolo switch type!"
#endif

void setChannelRelaySwitchState(uint8_t channel, uint8_t newState) {
  if(newState == ON) {
    digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], HIGH);
    delay(RELAY_PULSE_DELAY_MS);
    digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], LOW);
    channelState[channel] = ON;
    TURN_RED_LED_ON(channel);
  } else {
    digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], HIGH);
    delay(RELAY_PULSE_DELAY_MS);
    digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], LOW);
    channelState[channel] = OFF;
    TURN_BLUE_LED_ON(channel);
  }
}

bool checkTouchSensor() {
  static uint32_t lastTouchTimestamp[NODE_SENSORS_COUNT];
  static uint8_t touchSensorState[NODE_SENSORS_COUNT];
  bool triggered = false;

  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
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
#if defined (LIVOLO_ONE_CHANNEL)
void switchOneCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setChannelRelaySwitchState(0, livoloSwitchOneCharacteristic.value());
}
#elif defined (LIVOLO_TWO_CHANNEL)
void switchOneCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setChannelRelaySwitchState(0, livoloSwitchOneCharacteristic.value());
}

void switchTwoCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setChannelRelaySwitchState(1, livoloSwitchTwoCharacteristic.value());
}
#else
  #error "Unknown Livolo switch type!"
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

#ifdef MTCH_TOUCH_SENSOR
  analogWrite(TOUCH_SENSE_SENSITIVITY_ADJUST_PIN, 88);
  digitalWrite(TOUCH_SENSE_LOW_POWER_MODE_PIN, HIGH); // disable low power mode
#endif

  // set required mcu pins for reading touch sensors state
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    pinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
  }

  // lit BLUE leds when starting up
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    pinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
    TURN_BLUE_LED_ON(i);
  }

  // set bistable relays initial state
  for(uint8_t i = 0; i < NODE_SENSORS_COUNT; i++) {
    for(uint8_t j = 0; j < NODE_SENSORS_COUNT; j++) {
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

#if defined (LIVOLO_ONE_CHANNEL)
  blePeripheral.addAttribute(livoloSwitchOneCharacteristic);
  blePeripheral.addAttribute(livoloSwitchOneDescriptor);
#elif defined (LIVOLO_TWO_CHANNEL)
  blePeripheral.addAttribute(livoloSwitchOneCharacteristic);
  blePeripheral.addAttribute(livoloSwitchOneDescriptor);
  blePeripheral.addAttribute(livoloSwitchTwoCharacteristic);
  blePeripheral.addAttribute(livoloSwitchTwoDescriptor);
#else
  #error "Unknown Livolo switch type!"
#endif

  // assign event handlers for connected, disconnected to peripheral
  blePeripheral.setEventHandler(BLEConnected, blePeripheralConnectHandler);
  blePeripheral.setEventHandler(BLEDisconnected, blePeripheralDisconnectHandler);

  // assign event handlers for characteristic
#if defined (LIVOLO_ONE_CHANNEL)
  livoloSwitchOneCharacteristic.setEventHandler(BLEWritten, switchOneCharacteristicWritten);
#elif defined (LIVOLO_TWO_CHANNEL)
  livoloSwitchOneCharacteristic.setEventHandler(BLEWritten, switchOneCharacteristicWritten);
  livoloSwitchTwoCharacteristic.setEventHandler(BLEWritten, switchTwoCharacteristicWritten);
#else
  #error "Unknown Livolo switch type!"
#endif

// set initial values for characteristics
#if defined (LIVOLO_ONE_CHANNEL)
  livoloSwitchOneCharacteristic.setValue(0);
#elif defined (LIVOLO_TWO_CHANNEL)
  livoloSwitchTwoCharacteristic.setValue(0);
#else
  #error "Unknown Livolo switch type!"
#endif

  // begin initialization
  blePeripheral.begin();

  // set TX power - must be called after begin
  blePeripheral.setTxPower(4);
}

void loop() {
  // poll peripheral
  blePeripheral.poll();

  // check touch sensors for changes
  if(checkTouchSensor()) {
#if defined (LIVOLO_ONE_CHANNEL)
    livoloSwitchOneCharacteristic.setValue(channelState[0]);
#elif defined (LIVOLO_TWO_CHANNEL)
    livoloSwitchOneCharacteristic.setValue(channelState[0]);
    livoloSwitchTwoCharacteristic.setValue(channelState[1]);
#else
  #error "Unknown Livolo switch type!"
#endif
  }

  //sd_app_evt_wait();
}
