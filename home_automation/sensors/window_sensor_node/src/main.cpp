#include <Arduino.h>
#include <LowPower.h>
#include <MySensorsWrapper.h>
#include <RFM69.h>

#ifndef MY_NODE_NAME
#define MY_NODE_NAME "Test"
#endif

#ifndef MY_NODE_VERSION
#define MY_NODE_VERSION "0.1"
#endif

#ifndef MY_NODE_ID
#define MY_NODE_ID 1
#endif

#ifndef MY_NETWORK_ID
#define MY_NETWORK_ID 0
#endif

#ifndef MY_FREQUENCY
#define MY_FREQUENCY RF69_868MHZ
#endif

#define WINDOW_SNS_CHILD_ID 0
#define WINDOW_SNS_READ_PIN 3

#define MAX_BATT_VOLTAGE_MV 3000
//#define BATTERY_PERCENT_LVL_CORRECTION_FACTOR (-8)
#define BATTERY_PERCENT_LVL_CORRECTION_FACTOR (14)

// interval must be given in seconds
#define SLEEP_5_SECONDS        5
#define SLEEP_10_SECONDS      10
#define SLEEP_30_SECONDS      30
#define SLEEP_1_MINUTE        60
#define SLEEP_5_MINUTES      300
#define SLEEP_10_MINUTES     600
#define SLEEP_30_MINUTE     1800
#define SLEEP_1_HOUR        3600 

#define NO_WAKEUP                 0
#define SLEEP_TIMER_WAKEUP        1
#define EXTERNAL_INTERRUPT_WAKEUP 2

static RFM69 rfm69RadioTransport;
static MySensors mysNode(rfm69RadioTransport);

static volatile bool externalInterrupt = false;

void wakeUpHandler() {
  externalInterrupt = true;
}

static uint8_t getBattLvl() {
  float batteryVolts = 0.0;

  // Measure Vcc against 1.1V Vref
#if defined(__AVR_ATmega32U4__) || defined(__AVR_ATmega1280__) ||              \
    defined(__AVR_ATmega2560__)
  ADMUX = (_BV(REFS0) | _BV(MUX4) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1));
#elif defined(__AVR_ATtiny24__) || defined(__AVR_ATtiny44__) ||                \
    defined(__AVR_ATtiny84__)
  ADMUX = (_BV(MUX5) | _BV(MUX0));
#elif defined(__AVR_ATtiny25__) || defined(__AVR_ATtiny45__) ||                \
    defined(__AVR_ATtiny85__)
  ADMUX = (_BV(MUX3) | _BV(MUX2));
#else
  ADMUX = (_BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1));
#endif
  // Vref settle
  delay(70);
  // Do conversion
  ADCSRA |= _BV(ADSC);
  while (bit_is_set(ADCSRA, ADSC)) {};
  batteryVolts = (1125300UL) / ADC;

  return constrain(((batteryVolts / MAX_BATT_VOLTAGE_MV) * 100) + BATTERY_PERCENT_LVL_CORRECTION_FACTOR, 0, 100);
}

static uint8_t nodeSleep(uint32_t seconds) {
  mysNode.sleep();

  for (uint32_t i = 0; i < seconds; i++) {
    LowPower.powerDown(SLEEP_1S, ADC_OFF, BOD_OFF);
    // if an external interrupt took place then break sleep loop so that we can send the data
    if(externalInterrupt) {
      externalInterrupt = false;
      return EXTERNAL_INTERRUPT_WAKEUP;
    }
  }

  return SLEEP_TIMER_WAKEUP;
}

void checkWindowState(uint8_t wakeUpSource) {
  static uint8_t prevWindowState;

  uint8_t currentWindowState = digitalRead(WINDOW_SNS_READ_PIN);
  if (currentWindowState != prevWindowState) {
    mysNode.send(WINDOW_SNS_CHILD_ID, V_TRIPPED, currentWindowState);
    prevWindowState = currentWindowState;
  }
}

void checkBatteryState(uint8_t wakeUpSource) {
  static uint8_t prevBattLvl;

  uint8_t currentBattLvl = getBattLvl();
  if ((wakeUpSource == SLEEP_TIMER_WAKEUP) && (currentBattLvl != prevBattLvl)) {
    mysNode.send_battery_level(currentBattLvl);
    prevBattLvl = currentBattLvl;
  }
}

void setup() {
  pinMode(WINDOW_SNS_READ_PIN, INPUT);

  // initialize node and radio transport
  mysNode.begin(MY_FREQUENCY, MY_NODE_ID, MY_NETWORK_ID);
  // present this node and send the initial readings
  mysNode.send_sketch_name(MY_NODE_NAME);
  nodeSleep(SLEEP_5_SECONDS);
  mysNode.send_sketch_version(MY_NODE_VERSION);
  nodeSleep(SLEEP_5_SECONDS);
  mysNode.present(WINDOW_SNS_CHILD_ID, S_DOOR, MY_NODE_NAME);
  nodeSleep(SLEEP_5_SECONDS);
  mysNode.send_battery_level(getBattLvl());
  nodeSleep(SLEEP_5_SECONDS);
  mysNode.send(WINDOW_SNS_CHILD_ID, V_TRIPPED, digitalRead(WINDOW_SNS_READ_PIN));

  // respond to external interrupts
  attachInterrupt(digitalPinToInterrupt(WINDOW_SNS_READ_PIN), wakeUpHandler, CHANGE);
}

void loop() {
  uint8_t wakeUpSource = nodeSleep(SLEEP_1_HOUR);

  checkWindowState(wakeUpSource);
  checkBatteryState(wakeUpSource);
}
