#include <Arduino.h>

#define STRING(x) #x
#define STR(x) STRING(x)

// -------------------------------- NODE CONFIGURABLE FEATURES ----------------------------

// Select number of channels(buttons)
//#define LIVOLO_ONE_CHANNEL
//#define LIVOLO_TWO_CHANNEL

// Is this switch having touch sensor(s) on it?
#ifndef HAS_TOUCH_SENSING
#define HAS_TOUCH_SENSING
#endif

// Is this switch using a MTCH102/105 touch controller IC ?
#ifndef HAS_MTCH_TOUCH_SENSOR
#define HAS_MTCH_TOUCH_SENSOR
#endif

// Is the touch controller outputing a logic LOW level or HIGH when channel(s) touched ?
//#define TOUCH_SENSOR_INVERSE_LOGIC

// Is this switch using LEDs for signaling when the corresponding button is touched?
#ifndef HAS_LED_SIGNALING
#define HAS_LED_SIGNALING
#endif
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

#ifndef TOUCH_DETECT_SAMPLING_INTERVAL_MS
#define TOUCH_DETECT_SAMPLING_INTERVAL_MS 100
#pragma message "TOUCH_DETECT_SAMPLING_INTERVAL_MS is not defined, using default value: " STR(TOUCH_DETECT_SAMPLING_INTERVAL_MS)
#endif

#ifndef TOUCH_SENSOR_SENSITIVITY_LEVEL
#define TOUCH_SENSOR_SENSITIVITY_LEVEL  90  // 0 - biggest sensitivity, 255 - lowest sensitivity
#pragma message "TOUCH_SENSOR_SENSITIVITY_LEVEL is not defined, using default value: " STR(TOUCH_SENSOR_SENSITIVITY_LEVEL)
#endif

#ifndef TOUCH_SENSE_LOW_POWER_MODE_PIN
#define TOUCH_SENSE_LOW_POWER_MODE_PIN  12
#pragma message "TOUCH_SENSE_LOW_POWER_MODE_PIN is not defined, using default value: " STR(TOUCH_SENSE_LOW_POWER_MODE_PIN)
#endif
#ifndef TOUCH_SENSE_SENSITIVITY_ADJUST_PIN
#define TOUCH_SENSE_SENSITIVITY_ADJUST_PIN  17
#pragma message "TOUCH_SENSE_SENSITIVITY_ADJUST_PIN is not defined, using default value: " STR(TOUCH_SENSE_SENSITIVITY_ADJUST_PIN)
#endif

#ifndef TOUCH_SENSOR_CHANNEL_ONE_PIN
#define TOUCH_SENSOR_CHANNEL_ONE_PIN  8
#pragma message "TOUCH_SENSOR_CHANNEL_ONE_PIN is not defined, using default value: " STR(TOUCH_SENSOR_CHANNEL_ONE_PIN)
#endif
#if defined(LIVOLO_TWO_CHANNEL) && !defined(TOUCH_SENSOR_CHANNEL_TWO_PIN)
#define TOUCH_SENSOR_CHANNEL_TWO_PIN  9
#pragma message "TOUCH_SENSOR_CHANNEL_TWO_PIN is not defined, using default value: " STR(TOUCH_SENSOR_CHANNEL_TWO_PIN)
#endif

const uint8_t TOUCH_SENSOR_CHANNEL_PINS[TOUCH_SENSORS_COUNT] = {
#if defined (LIVOLO_ONE_CHANNEL)
  TOUCH_SENSOR_CHANNEL_ONE_PIN
#elif defined (LIVOLO_TWO_CHANNEL)
  TOUCH_SENSOR_CHANNEL_ONE_PIN,
  TOUCH_SENSOR_CHANNEL_TWO_PIN
#else
#error "Unknown Livolo switch type!"
#endif
};

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
#define COILS_COUNT        2
#define SET_COIL_INDEX     0
#define RESET_COIL_INDEX   1

#ifndef RELAY_CHANNEL_ONE_SET_PIN
#define RELAY_CHANNEL_ONE_SET_PIN  28
#pragma message "RELAY_CHANNEL_ONE_SET_PIN is not defined, using default value: " STR(RELAY_CHANNEL_ONE_SET_PIN)
#endif
#ifndef RELAY_CHANNEL_ONE_RESET_PIN
#define RELAY_CHANNEL_ONE_RESET_PIN  29
#pragma message "RELAY_CHANNEL_ONE_RESET_PIN is not defined, using default value: " STR(RELAY_CHANNEL_ONE_RESET_PIN)
#endif

#if defined(LIVOLO_TWO_CHANNEL) && !defined(RELAY_CHANNEL_TWO_SET_PIN)
#define RELAY_CHANNEL_TWO_SET_PIN  26
#pragma message "RELAY_CHANNEL_TWO_SET_PIN is not defined, using default value: " STR(RELAY_CHANNEL_TWO_SET_PIN)
#endif
#if defined(LIVOLO_TWO_CHANNEL) && !defined(RELAY_CHANNEL_TWO_RESET_PIN)
#define RELAY_CHANNEL_TWO_RESET_PIN  27
#pragma message "RELAY_CHANNEL_TWO_RESET_PIN is not defined, using default value: " STR(RELAY_CHANNEL_TWO_RESET_PIN)
#endif

const uint32_t RELAY_PULSE_DELAY_MS = 100;

const uint8_t RELAY_CH_PINS[][COILS_COUNT] = {
#if defined (LIVOLO_ONE_CHANNEL)
  {RELAY_CHANNEL_ONE_SET_PIN, RELAY_CHANNEL_ONE_RESET_PIN} // channel 1 relay control pins(bistable relay - 2 coils)
#elif defined (LIVOLO_TWO_CHANNEL)
  {RELAY_CHANNEL_ONE_SET_PIN, RELAY_CHANNEL_ONE_RESET_PIN}, // channel 1 relay control pins(bistable relay - 2 coils)
  {RELAY_CHANNEL_TWO_SET_PIN, RELAY_CHANNEL_TWO_RESET_PIN} // channel 2 relay control pins(bistable relay - 2 coils)
#else
#error "Unknown Livolo switch type!"
#endif
};

#ifndef LIGHT_STATE_CHANNEL_ONE_LED_PIN
#define LIGHT_STATE_CHANNEL_ONE_LED_PIN  18
#pragma message "LIGHT_STATE_CHANNEL_ONE_LED_PIN is not defined, using default value: " STR(LIGHT_STATE_CHANNEL_ONE_LED_PIN)
#endif
#if defined(LIVOLO_TWO_CHANNEL) && !defined(LIGHT_STATE_CHANNEL_TWO_LED_PIN)
#define LIGHT_STATE_CHANNEL_TWO_LED_PIN  19
#pragma message "LIGHT_STATE_CHANNEL_TWO_LED_PIN is not defined, using default value: " STR(LIGHT_STATE_CHANNEL_TWO_LED_PIN)
#endif

const uint8_t LIGHT_STATE_LED_PINS[LED_COUNT] = {
#if defined (LIVOLO_ONE_CHANNEL)
  LIGHT_STATE_CHANNEL_ONE_LED_PIN
#elif defined (LIVOLO_TWO_CHANNEL)
  LIGHT_STATE_CHANNEL_ONE_LED_PIN,
  LIGHT_STATE_CHANNEL_TWO_LED_PIN
#else
#error "Unknown Livolo switch type!"
#endif
};

uint8_t channelState[RELAY_COUNT] = {
#if defined (LIVOLO_ONE_CHANNEL)
  OFF
#elif defined (LIVOLO_TWO_CHANNEL)
  OFF,
  OFF
#else
#error "Unknown Livolo switch type!"
#endif
};

const uint32_t CHANNEL_LED_TOGGLE_INTERVAL_MS = 500;
const uint8_t CHANNEL_LED_TOGGLE_COUNT = 3;

#define TURN_RED_LED_ON(channel) digitalWrite(LIGHT_STATE_LED_PINS[channel], LOW)
#define TURN_BLUE_LED_ON(channel) digitalWrite(LIGHT_STATE_LED_PINS[channel], HIGH)
#define TOGGLE_CHANNEL_LED(channel) digitalWrite(LIGHT_STATE_LED_PINS[channel], !digitalRead(LIGHT_STATE_LED_PINS[channel]))
// --------------------------------------- BLE ----------------------------------------------------
#include <SPI.h>
#include <BLEPeripheral.h>

#define MANUFACTURER_DATA (const unsigned char*)"Livolo"
#define MANUFACTURER_DATA_LEN 6
#define DEVICE_LOCAL_NAME "Livolo"
#define DEVICE_NAME "Livolo"

#ifndef DEBUG
  #ifndef LIVOLO_BLE_CENTRAL_ADDR
  #error "LIVOLO_BLE_CENTRAL_ADDR is not defined!"
  #endif
#endif
//#define LIVOLO_BLE_CENTRAL_ADDR "b8:27:eb:cc:de:b2" // raspberry pi zero
//#define LIVOLO_BLE_CENTRAL_ADDR "00:1a:7d:da:71:13" // orange pi zero bta-403

#define LIVOLO_BLE_SERVICE_UUID  "ccc0"

#define LIVOLO_BLE_SWITCH_ONE_CHARACTERISTIC_UUID "bbb0" // channel 1 read/write

#if defined (LIVOLO_TWO_CHANNEL)
#define LIVOLO_BLE_SWITCH_TWO_CHARACTERISTIC_UUID "bbb1" // channel 2 read/write
#endif

#define BLE_TX_POWER  4 // 4dBm
#define BLE_ADVERTISING_INTERVAL_MS 320 //in multiples of 0.625ms

BLEPeripheral blePeripheral = BLEPeripheral();
BLEService livoloService = BLEService(LIVOLO_BLE_SERVICE_UUID);

BLEUnsignedCharCharacteristic livoloSwitchOneCharacteristic = BLEUnsignedCharCharacteristic(LIVOLO_BLE_SWITCH_ONE_CHARACTERISTIC_UUID, BLERead | BLEWrite | BLENotify);

#if defined (LIVOLO_TWO_CHANNEL)
BLEUnsignedCharCharacteristic livoloSwitchTwoCharacteristic = BLEUnsignedCharCharacteristic(LIVOLO_BLE_SWITCH_TWO_CHARACTERISTIC_UUID, BLERead | BLEWrite | BLENotify);
#endif
// -----------------------------------------------------------------------------

// -------------------------- SCHEDULER ----------------------------------------
#define TASKER_MAX_TASKS 10
#include <Tasker.h>

Tasker tasker;
// -----------------------------------------------------------------------------

// --------------------------- EEPROM ------------------------------------------
#include <DS2431.h>
#include <OneWire.h>

#ifndef EEPROM_ONE_WIRE_PIN
#define EEPROM_ONE_WIRE_PIN  25
#pragma message "EEPROM_ONE_WIRE_PIN is not defined, using default value: " STR(EEPROM_ONE_WIRE_PIN)
#endif

static bool eepromDevicePresent = false;
OneWire eepromOneWire(EEPROM_ONE_WIRE_PIN);
uint8_t serialNb[8];
// -----------------------------------------------------------------------------

void energizeSetCoil(int channel) {
  digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], HIGH);
  tasker.setTimeout([](int channel) {
    digitalWrite(RELAY_CH_PINS[channel][SET_COIL_INDEX], LOW);
  }, RELAY_PULSE_DELAY_MS, channel);
}

void energizeResetCoil(int channel) {
  digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], HIGH);
  tasker.setTimeout([](int channel) {
    digitalWrite(RELAY_CH_PINS[channel][RESET_COIL_INDEX], LOW);
  }, RELAY_PULSE_DELAY_MS, channel);
}

void setRelaySwitchChannelState(uint8_t channel, uint8_t newState, bool saveState = false) {
#ifdef HAS_DS2431_EEPROM_STORAGE
  if (eepromDevicePresent && saveState) {
    uint8_t savedSwitchState[RELAY_COUNT];
    memset(savedSwitchState, 0, RELAY_COUNT);

    DS2431 eeprom(eepromOneWire, serialNb);
    eeprom.read(0, savedSwitchState, RELAY_COUNT);

    if (newState != savedSwitchState[channel]) {
      uint8_t newStateToSave[8];
      memset(newStateToSave, 0, sizeof(newStateToSave));
      newStateToSave[channel] = newState;
      eeprom.write(0, newStateToSave);
      eepromOneWire.depower();
    }
  }
#endif

  if (newState == ON) {
    energizeSetCoil(channel);
    channelState[channel] = ON;
  #ifdef HAS_LED_SIGNALING
    TURN_RED_LED_ON(channel);
  #endif
  } else {
    energizeResetCoil(channel);
    channelState[channel] = OFF;
  #ifdef HAS_LED_SIGNALING
    TURN_BLUE_LED_ON(channel);
  #endif
  }
}

void toggleRelayChannelState(uint8_t channel) {
  setRelaySwitchChannelState(channel, !channelState[channel], true);
}

#ifdef HAS_TOUCH_SENSING
bool touchSensorTriggered() {
  static uint32_t touchSensorStillPressedCounter[TOUCH_SENSORS_COUNT];

  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
#ifdef TOUCH_SENSOR_INVERSE_LOGIC
    if (digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == HIGH) {
#else
    if (digitalRead(TOUCH_SENSOR_CHANNEL_PINS[i]) == LOW) {
#endif
      // act only when the first touch happens by using a counter
      if(touchSensorStillPressedCounter[i]++ == 1) {
        toggleRelayChannelState(i);
        return true;
      }
    } else {
      // reset counter when no touch is detected
      touchSensorStillPressedCounter[i] = 0;
    }
  }

  return false;
}
#endif

void blePeripheralConnectHandler(BLECentral& central) {
  // central connected event handler
#ifndef DEBUG
#pragma message "Pairing is allowed for this BLE CENTRAL ADDRESS: " LIVOLO_BLE_CENTRAL_ADDR
  // let our ble central device only to connect to Livolo
  if(strcmp(central.address(), LIVOLO_BLE_CENTRAL_ADDR)) {
    central.disconnect();
  }
#endif
}

void blePeripheralDisconnectHandler(BLECentral& central) {
  // central disconnected event handler
}

// central wrote new value to characteristics, update state
void switchOneCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setRelaySwitchChannelState(CHANNEL_1, livoloSwitchOneCharacteristic.value(), true);
}
#if defined (LIVOLO_TWO_CHANNEL)
void switchTwoCharacteristicWritten(BLECentral& central, BLECharacteristic& characteristic) {
  setRelaySwitchChannelState(CHANNEL_2, livoloSwitchTwoCharacteristic.value(), true);
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

#ifdef HAS_LED_SIGNALING
  // set led pins direction
  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(LIGHT_STATE_LED_PINS[i], OUTPUT);
  }
#endif

#ifdef HAS_DS2431_EEPROM_STORAGE
  // Search the 1-Wire bus for a connected device and check serial number CRC
  eepromOneWire.target_search(DS2431::ONE_WIRE_FAMILY_CODE);
  if (eepromOneWire.search(serialNb) && eepromOneWire.crc8(serialNb, 7) == serialNb[7]) {
    eepromDevicePresent = true;
  }

  // load saved state for relays
  uint8_t savedSwitchState[RELAY_COUNT];
  memset(savedSwitchState, 0, RELAY_COUNT);

  if(eepromDevicePresent) {
    DS2431 eeprom(eepromOneWire, serialNb);
    eeprom.read(0, savedSwitchState, RELAY_COUNT);
  }
#endif

  // set bistable relays initial state
  for (uint8_t i = 0; i < RELAY_COUNT; i++) {
    for (uint8_t j = 0; j < COILS_COUNT; j++) {
      pinMode(RELAY_CH_PINS[i][j], OUTPUT);
    }
    // make sure touch switch relays start in a well known state
    // play a short led animation first
    // tasker.setRepeated([](int channel) {
    //   static uint8_t toggleCount = 0;
    //
    //   TOGGLE_CHANNEL_LED(channel);
    //
    //   if(++toggleCount >= CHANNEL_LED_TOGGLE_COUNT) {
    //   #ifdef HAS_DS2431_EEPROM_STORAGE
    //     setRelaySwitchChannelState(channel,
    //       (savedSwitchState[channel] == ON || savedSwitchState[channel] == OFF) ? savedSwitchState[channel] : OFF);
    //   #else
    //     setRelaySwitchChannelState(channel, OFF);
    //   #endif
    //     toggleCount = 0;
    //   }
    // }, CHANNEL_LED_TOGGLE_INTERVAL_MS, CHANNEL_LED_TOGGLE_COUNT, i);
  #ifdef HAS_DS2431_EEPROM_STORAGE
    if (eepromDevicePresent) {
      setRelaySwitchChannelState(i, savedSwitchState[i]);
    }
  #else
    setRelaySwitchChannelState(i, OFF);
  #endif
  }

#ifdef HAS_TOUCH_SENSING
#ifdef HAS_MTCH_TOUCH_SENSOR
  analogWrite(TOUCH_SENSE_SENSITIVITY_ADJUST_PIN, TOUCH_SENSOR_SENSITIVITY_LEVEL);
  digitalWrite(TOUCH_SENSE_LOW_POWER_MODE_PIN, LOW); // enable low power mode
#endif

  // set required mcu pins for reading touch sensors state
  for (uint8_t i = 0; i < TOUCH_SENSORS_COUNT; i++) {
    pinMode(TOUCH_SENSOR_CHANNEL_PINS[i], INPUT);
  }

  // enable touch sensor check/sampling
  tasker.setInterval([](int arg) {
    if (touchSensorTriggered()) {
      livoloSwitchOneCharacteristic.setValue(channelState[CHANNEL_1]);
  #if defined (LIVOLO_TWO_CHANNEL)
      livoloSwitchTwoCharacteristic.setValue(channelState[CHANNEL_2]);
  #endif
    }
  }, TOUCH_DETECT_SAMPLING_INTERVAL_MS);
#endif

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
  livoloSwitchOneCharacteristic.setValue(channelState[CHANNEL_1]);
#if defined (LIVOLO_TWO_CHANNEL)
  livoloSwitchTwoCharacteristic.setValue(channelState[CHANNEL_2]);
#endif

  // begin initialization
  blePeripheral.begin();

  // set TX power - must be called after begin
  sd_ble_gap_tx_power_set(BLE_TX_POWER);

  blePeripheral.setAdvertisingInterval(BLE_ADVERTISING_INTERVAL_MS);

  //sd_power_mode_set(NRF_POWER_MODE_LOWPWR);
#ifdef HAS_DC_DC_POWER_MODE_SUPPORT
#pragma message "DC-DC power mode support enabled!"
  sd_power_dcdc_mode_set(NRF_POWER_DCDC_ENABLE);
#endif
}

void loop() {
  // run tasker tasks
  tasker.loop();

  // poll peripheral
  blePeripheral.poll();

  sd_app_evt_wait();
}
