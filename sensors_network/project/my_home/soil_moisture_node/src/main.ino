//#define MY_DEBUG
#define MY_DISABLED_SERIAL
#define MY_RADIO_RFM69
#define MY_IS_RFM69HW
#define MY_RFM69_TX_POWER_DBM (20)
#define MY_RFM69_FREQUENCY (RFM69_868MHZ)
#define MY_RFM69_NEW_DRIVER

#include <MySensors.h>

const float MAX_BATT_VOLTAGE_V = 3.0;
const uint8_t BATTERY_READ_PIN = A0;

const uint32_t SLEEP_TIME_MS = 60000; // 60s
const float ANALOG_REF_VALUE_VOLTS = 3.3;
const uint16_t ANALOG_RESOLUTION_BITS = 1024;
const float AD_FACTOR = (ANALOG_REF_VALUE_VOLTS / ANALOG_RESOLUTION_BITS);

const uint8_t MOIST_SNS_PWR_PIN = 3;
const uint8_t MOIST_SNS_READ_PIN = A4;
const uint8_t MOIST_SNS_CHILD_ID = 0;
MyMessage msg(MOIST_SNS_CHILD_ID, V_LEVEL);

const uint8_t PRESENTATION_MSG_CYCLE = 10;

uint8_t getBattLvl(uint8_t samplesCount = 10) {
  float batteryVoltage = 0.0;

  for (uint8_t samples = 0; samples < samplesCount; samples++) {
    batteryVoltage += (analogRead(BATTERY_READ_PIN) * AD_FACTOR) / samplesCount;
  }

  return constrain((batteryVoltage / MAX_BATT_VOLTAGE_V) * 100, 0, 100);
}

uint16_t getMoistLvl(uint8_t samplesCount = 10) {
  uint16_t lvl = 0;

  digitalWrite(MOIST_SNS_PWR_PIN, HIGH); // power up sensor
  wait(50); // wait a little for the sensor to start working after power up
  for (uint8_t samples = 0; samples < samplesCount; samples++) {
    lvl += analogRead(MOIST_SNS_READ_PIN) / samplesCount;
  }
  digitalWrite(MOIST_SNS_PWR_PIN, LOW); // power down sensor

  return lvl;
}

void setup() {
  pinMode(MOIST_SNS_PWR_PIN, OUTPUT);
  analogReference(DEFAULT);
}

void presentation() {
  sendSketchInfo(NODE_NAME, "0.1");
  present(MOIST_SNS_CHILD_ID, S_MOISTURE);
}

void loop() {
  static uint8_t prevBattLvl;
  static uint16_t prevMoistLvl;
  static uint8_t presCycle;

  if (++presCycle >= PRESENTATION_MSG_CYCLE) {
    presentation();
    presCycle = 0;
    ;
  }

  uint16_t currentMoistLvl = getMoistLvl();
  if (currentMoistLvl != prevMoistLvl) {
    send(msg.set(currentMoistLvl));
    prevMoistLvl = currentMoistLvl;
  }

  uint8_t currentBattLvl = getBattLvl();
  if (currentBattLvl != prevBattLvl) {
    sendBatteryLevel(currentBattLvl);
    prevBattLvl = currentBattLvl;
  }

  sleep(SLEEP_TIME_MS);
}
