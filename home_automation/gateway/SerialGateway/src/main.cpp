#include <Arduino.h>
#include <RFM69.h>

RFM69 radio;

#define GW_SERIAL_BAUDRATE 115200

#define NETWORKID 0
#define MYNODEID 1
#define FREQUENCY RF69_868MHZ

#define ERR_LED_PIN 4 // Error led pin
#define RX_LED_PIN 5  // Receive led pin
#define TX_LED_PIN 6  // the PCB, on board LED

static bool blinkRxLed;
static bool blinkTxLed;

void setup() {
  pinMode(RX_LED_PIN, OUTPUT);
  pinMode(TX_LED_PIN, OUTPUT);

  Serial.begin(GW_SERIAL_BAUDRATE);

  radio.initialize(FREQUENCY, MYNODEID, NETWORKID);
  // radio.setHighPower(); // Always use this for RFM69HCW
  radio.setPowerLevel(31);
}

void radioDataProcessingTask() {
  if (radio.receiveDone()) {
    blinkRxLed = true;
    char buff[RF69_MAX_DATA_LEN];
    memset(buff, '\0', sizeof(buff));
    memcpy(buff, radio.DATA, radio.DATALEN);
    Serial.println(buff);

    if (radio.ACKRequested()) {
      radio.sendACK();
      blinkTxLed = true;
    }
  }
}

void ledsTask() {
  static uint32_t lastRxBlinkTimestamp;
  static uint32_t lastTxBlinkTimestamp;

  if (blinkRxLed && !digitalRead(RX_LED_PIN)) {
    digitalWrite(RX_LED_PIN, HIGH);
  }

  if (blinkTxLed && !digitalRead(TX_LED_PIN)) {
    digitalWrite(TX_LED_PIN, HIGH);
  }

  if (blinkRxLed && millis() - lastRxBlinkTimestamp >= 100) {
    blinkRxLed = false;
    digitalWrite(RX_LED_PIN, LOW);
    lastRxBlinkTimestamp = millis();
  }

  if (blinkTxLed && millis() - lastTxBlinkTimestamp >= 100) {
    blinkTxLed = false;
    digitalWrite(TX_LED_PIN, LOW);
    lastTxBlinkTimestamp = millis();
  }
}

void loop() {
  radioDataProcessingTask();
  ledsTask();
}
