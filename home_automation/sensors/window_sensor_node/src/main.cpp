#include <Arduino.h>
#include <LowPower.h>
#include <MTypes.h>
#include <RFM69.h>
#include <Vcc.h>


#ifndef MY_NODE_ID
#define MY_NODE_ID 2
#endif

#ifndef MY_NETWORK_ID
#define MY_NETWORK_ID 0
#endif

#ifndef MY_GATEWAY_ID
#define MY_GATEWAY_ID 1
#endif

#ifndef MY_FREQUENCY
#define MY_FREQUENCY RF69_868MHZ
#endif

#define BATTERY_CHILD_ID    255
#define WINDOW_SNS_CHILD_ID   0
#define WINDOW_SNS_READ_PIN   3

#define VCC_CORRECTION_FACTOR 0.95
#define VCC_BATT_MIN_VOLTS    2.2
#define VCC_BATT_MAX_VOLTS    3.0

static RFM69 radio;
static Vcc vcc(VCC_CORRECTION_FACTOR);

static void wakeUpHandler() {}

static void mys_send_byte(uint8_t child_id, uint8_t var_type, uint8_t data, uint8_t cmd_type = M_SET) {
  char message[RF69_MAX_DATA_LEN];
  memset(message, '\0', sizeof(message));

  snprintf(message, sizeof(message), "%hhu;%hhu;%hhu;%hhu;%hhu;%hhu", 
            MY_NODE_ID, child_id, cmd_type, 0, var_type, data);
  radio.sendWithRetry(MY_GATEWAY_ID, message, sizeof(message));
}

static void checkWindowState() {
  static uint8_t prevWindowState;

  uint8_t currentWindowState = digitalRead(WINDOW_SNS_READ_PIN);
  if (currentWindowState != prevWindowState) {
    mys_send_byte(WINDOW_SNS_CHILD_ID, V_TRIPPED, currentWindowState);
    prevWindowState = currentWindowState;
  }
}

static void checkBatteryState() {
  static uint8_t prevBattLvl;

  uint8_t currentBattLvl = (uint8_t)vcc.Read_Perc(VCC_BATT_MIN_VOLTS, VCC_BATT_MAX_VOLTS);
  if (currentBattLvl != prevBattLvl) {
    mys_send_byte(BATTERY_CHILD_ID, I_BATTERY_LEVEL, currentBattLvl, M_INTERNAL);
    prevBattLvl = currentBattLvl;
  }
}

static void nodeSleep() {
  radio.sleep();
  attachInterrupt(digitalPinToInterrupt(WINDOW_SNS_READ_PIN), wakeUpHandler, CHANGE);
  LowPower.powerDown(SLEEP_FOREVER, ADC_OFF, BOD_OFF);
  detachInterrupt(digitalPinToInterrupt(WINDOW_SNS_READ_PIN));
}

void setup() {
  pinMode(WINDOW_SNS_READ_PIN, INPUT);

  // initialize node and radio transport
  radio.initialize(MY_FREQUENCY, MY_NODE_ID, MY_NETWORK_ID);
  // radio.setHighPower(); // Always use this for RFM69HCW
  radio.setPowerLevel(31);
}

void loop() {
  nodeSleep();
  checkBatteryState();
  checkWindowState();
}
