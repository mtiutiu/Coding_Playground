#include <Arduino.h>

// -------------------------------- NODE CONFIGURABLE FEATURES ----------------------------

// Select number of channels(buttons)
//#define LIVOLO_ONE_CHANNEL
#define LIVOLO_TWO_CHANNEL

// Is this switch having touch sensor(s) on it?
#define HAS_TOUCH_SENSING

// Is this switch using a MTCH102/105 touch controller IC ?
#define HAS_MTCH_TOUCH_SENSOR

// Is the touch controller outputing a logic LOW level or HIGH when channel(s) touched ?
//#define TOUCH_SENSOR_INVERSE_LOGIC

// Is this switch using LEDs for signaling when the corresponding button is touched?
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
const uint32_t TOUCH_SENSOR_SENSITIVITY_LEVEL = 88; // 0 - biggest sensitivity, 255 - lowest sensitivity

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

#define MANUFACTURER_DATA (const unsigned char*)"Livolo"
#define MANUFACTURER_DATA_LEN 6
#define DEVICE_LOCAL_NAME "Livolo"
#define DEVICE_NAME "Livolo"

//#define LIVOLO_BLE_CENTRAL_ADDR "b8:27:eb:cc:de:b2" // raspberry pi zero
#define LIVOLO_BLE_CENTRAL_ADDR "00:1a:7d:da:71:13" // orange pi zero bta-403

#define LIVOLO_BLE_SERVICE_UUID  "ccc0"

#define LIVOLO_BLE_SWITCH_ONE_CHARACTERISTIC_UUID "bbb0" // channel 1 read/write

#if defined (LIVOLO_TWO_CHANNEL)
#define LIVOLO_BLE_SWITCH_TWO_CHARACTERISTIC_UUID "bbb1" // channel 2 read/write
#endif

#define BLE_TX_POWER  4 // 4dBm


BLEPeripheral blePeripheral = BLEPeripheral();
BLEService livoloService = BLEService(LIVOLO_BLE_SERVICE_UUID);

BLEUnsignedCharCharacteristic livoloSwitchOneCharacteristic = BLEUnsignedCharCharacteristic(LIVOLO_BLE_SWITCH_ONE_CHARACTERISTIC_UUID, BLERead | BLEWrite | BLENotify);

#if defined (LIVOLO_TWO_CHANNEL)
BLEUnsignedCharCharacteristic livoloSwitchTwoCharacteristic = BLEUnsignedCharCharacteristic(LIVOLO_BLE_SWITCH_TWO_CHARACTERISTIC_UUID, BLERead | BLEWrite | BLENotify);
#endif

void setChannelRelaySwitchState(uint8_t channel, uint8_t newState) {
  if (newState == ON) {
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

  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
#ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if ((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
#else
    if ((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
#endif
        (touchSensorState[i] != TOUCHED)) {

      // latch in TOUCH state
      touchSensorState[i] = TOUCHED;
      lastTouchTimestamp[i] = millis();
    }

#ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if ((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) &&
#else
    if ((digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) &&
#endif
        (touchSensorState[i] != RELEASED)) {

      lastTouchTimestamp[i] = millis() - lastTouchTimestamp[i];
      // evaluate elapsed time between touch states
      // we can do here short press and long press handling if desired
      if (lastTouchTimestamp[i] >= SHORT_TOUCH_DETECT_THRESHOLD_MS) {
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

  // let our ble central device only to connect to Livolo
  if(strcmp(central.address(), LIVOLO_BLE_CENTRAL_ADDR)) {
    central.disconnect();
  }
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
  analogWrite(TOUCH_SENSE_SENSITIVITY_ADJUST_PIN, TOUCH_SENSOR_SENSITIVITY_LEVEL);
  digitalWrite(TOUCH_SENSE_LOW_POWER_MODE_PIN, HIGH); // disable low power mode
#endif

#ifdef HAS_TOUCH_SENSING
  // set required mcu pins for reading touch sensors state
  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
  }
#endif

#ifdef HAS_LED_SIGNALING
  // lit BLUE leds when starting up
  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
    TURN_BLUE_LED_ON(i);
  }
#endif

  // set bistable relays initial state
  for (uint8_t i = 0; i < RELAY_COUNT; i++) {
    for (uint8_t j = 0; j < RELAY_COUNT; j++) {
      pinMode(RELAY_CH_PINS[i][j], OUTPUT);
      // make sure touch switch relays start in OFF state
      digitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], HIGH);
      delay(RELAY_PULSE_DELAY_MS);
      digitalWrite(RELAY_CH_PINS[i][RESET_COIL_INDEX], LOW);
    }
  }

  blePeripheral.setManufacturerData(MANUFACTURER_DATA, MANUFACTURER_DATA_LEN);
  blePeripheral.setDeviceName(DEVICE_NAME);
  blePeripheral.setLocalName(DEVICE_LOCAL_NAME);
  blePeripheral.setAdvertisedServiceUuid(livoloService.uuid());

  blePeripheral.addAttribute(livoloService);
  blePeripheral.addAttribute(livoloSwitchOneCharacteristic);
#if defined (LIVOLO_TWO_CHANNEL)
  blePeripheral.addAttribute(livoloSwitchTwoCharacteristic);
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
  blePeripheral.setTxPower(BLE_TX_POWER);
}

void loop() {
  // poll peripheral
  blePeripheral.poll();

#ifdef HAS_TOUCH_SENSING
  // check touch sensors for changes
  if (checkTouchSensor()) {
    livoloSwitchOneCharacteristic.setValue(channelState[CHANNEL_1]);
#if defined (LIVOLO_TWO_CHANNEL)
    livoloSwitchTwoCharacteristic.setValue(channelState[CHANNEL_2]);
#endif
  }
#endif

  //sd_app_evt_wait();
}
