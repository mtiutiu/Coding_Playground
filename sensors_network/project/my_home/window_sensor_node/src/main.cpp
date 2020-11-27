#define MY_NODE_ID 4
//#define MY_DEBUG
#define MY_DISABLED_SERIAL
#define MY_RADIO_RFM69
//#define MY_IS_RFM69HW
#define MY_RFM69_FREQUENCY (RFM69_868MHZ)
#define MY_RFM69_NEW_DRIVER


#ifdef MY_IS_RFM69HW
#define MY_RFM69_TX_POWER_DBM (20)
#else
#define MY_RFM69_TX_POWER_DBM (13)
#endif

// Optimizations when running on 2032 Coin Cell
#define MY_TRANSPORT_UPLINK_CHECK_DISABLED
#define MY_TRANSPORT_WAIT_READY_MS  5000
#define MY_SLEEP_TRANSPORT_RECONNECT_TIMEOUT_MS 2000
#define MY_PARENT_NODE_ID 0
#define MY_PARENT_NODE_IS_STATIC

#include <Arduino.h>
#include <MySensors.h>

const float MAX_BATT_VOLTAGE_V = 3.3;
const uint8_t BATTERY_READ_PIN = A1;

const uint32_t SLEEP_TIME_MS = 300000; // 5m
const float ANALOG_REF_VALUE_VOLTS = 3.3;
const float ANALOG_RESOLUTION_BITS = 1024.0;
const float AD_FACTOR = (ANALOG_REF_VALUE_VOLTS / ANALOG_RESOLUTION_BITS);

const uint8_t WINDOW_SNS_READ_PIN = 3;
const uint8_t WINDOW_SNS_CHILD_ID = 0;

MyMessage msg(WINDOW_SNS_CHILD_ID, V_TRIPPED);

const uint8_t PRESENTATION_MSG_CYCLE = 10;


uint8_t getBattLvl(uint8_t samplesCount = 10) {
  float batteryVoltageSample = 0.0;

  for (uint8_t samples = 0; samples < samplesCount; samples++) {
    batteryVoltageSample += (analogRead(BATTERY_READ_PIN) * AD_FACTOR) / samplesCount;
  }

  return constrain((batteryVoltageSample / MAX_BATT_VOLTAGE_V) * 100, 0, 100);
}

void setup() {
  pinMode(WINDOW_SNS_READ_PIN, INPUT);
}

void presentation() {
  sendSketchInfo(NODE_NAME, "0.1");
  present(WINDOW_SNS_CHILD_ID, S_DOOR);
}

void loop() {
  static uint8_t prevBattLvl;
  static uint8_t prevWindowState;
  static uint8_t presCycle;

  if (++presCycle >= PRESENTATION_MSG_CYCLE) {
    presentation();
    presCycle = 0;
  }

  // sending succesive readings too fast has negative impact on a coin cell
  // so let it settle for a while as this is not critical
  // also let the sensors settle before taking readings if the case
  sleep(5);

  uint8_t currentWindowState = digitalRead(WINDOW_SNS_READ_PIN);
  if (currentWindowState != prevWindowState) {
    send(msg.set(currentWindowState));
    prevWindowState = currentWindowState;
  }

  // sending succesive readings too fast has negative impact on a coin cell
  // so let it settle for a while as this is not critical
  // also let the sensors settle before taking readings if the case
  sleep(5);

  uint8_t currentBattLvl = getBattLvl();
  if (currentBattLvl != prevBattLvl) {
    sendBatteryLevel(currentBattLvl);
    prevBattLvl = currentBattLvl;
  }

  sleep(digitalPinToInterrupt(WINDOW_SNS_READ_PIN), CHANGE, SLEEP_TIME_MS);
}
