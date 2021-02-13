#include <Arduino.h>
#include <LowPower.h>
#include <MySensorsWrapper.h>
#include <RFM69.h>

#ifndef NODE_NAME
#define NODE_NAME "Test"
#endif

#define NETWORKID 0
#define MYNODEID  4
#define FREQUENCY RF69_868MHZ

#define WINDOW_SNS_CHILD_ID 0
#define WINDOW_SNS_READ_PIN 3

#define INTERNAL_AREF_V     1100
#define MAX_BATT_VOLTAGE_MV 3000
#define BATTERY_PERCENT_LVL_CORRECTION_FACTOR (-8)
//#define BATTERY_PERCENT_LVL_CORRECTION_FACTOR (14)
#define NODE_SLEEP_INTERVAL_S 1800 // 30min

static RFM69 radio;
static MySensors mysNode(MYNODEID, radio);

static bool externalInterrupt = false;

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

static void nodeSleep(uint32_t seconds) {
  radio.sleep();

  for (uint32_t i = 0; i < seconds; i++) {
    LowPower.powerDown(SLEEP_1S, ADC_OFF, BOD_OFF);
    // if an external interrupt took place then break sleep loop so that we can send the data
    if(externalInterrupt) {
      externalInterrupt = false;
      break;
    }
  }
}

void setup() {
  pinMode(WINDOW_SNS_READ_PIN, INPUT);
  attachInterrupt(digitalPinToInterrupt(WINDOW_SNS_READ_PIN), wakeUpHandler, CHANGE);

  radio.initialize(FREQUENCY, MYNODEID, NETWORKID);
  //node.setHighPower(); // Always use this for RFM69HW
  radio.setPowerLevel(31);

  mysNode.send_sketch_name(NODE_NAME);
  mysNode.send_sketch_version("0.1");
  mysNode.present(WINDOW_SNS_CHILD_ID, S_DOOR, NODE_NAME);
}


void loop() {
  static uint8_t prevWindowState;
  static uint8_t prevBattLvl;

  uint8_t currentWindowState = digitalRead(WINDOW_SNS_READ_PIN);
  if (currentWindowState != prevWindowState) {
    mysNode.send(WINDOW_SNS_CHILD_ID, V_TRIPPED, currentWindowState);
    prevWindowState = currentWindowState;
  }

  uint8_t currentBattLvl = getBattLvl();
  if (currentBattLvl != prevBattLvl) {
    mysNode.send_battery_level(currentBattLvl);
    prevBattLvl = currentBattLvl;
  }

  nodeSleep(NODE_SLEEP_INTERVAL_S);
}
