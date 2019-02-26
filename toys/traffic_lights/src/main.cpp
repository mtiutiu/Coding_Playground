#include <LivoloRX.h>

#define INTERRUPT_CHANNEL 0
Remote remote;

#define REMOTE_ID   22253
#define KEY_A_CODE      8
#define KEY_B_CODE     16
#define KEY_C_CODE     56
#define KEY_D_CODE     42

void setup() {
  Serial.begin(9600);
  LivoloRX::init(INTERRUPT_CHANNEL);
}

void loop() {
  static uint32_t last_read_timestamp;

  if(LivoloRX::decode(remote) && millis() - last_read_timestamp >= 1000) {
    Serial.print(F("remoteID: "));
    Serial.print(remote.id);
    Serial.print(F(" - "));
    Serial.print(F("key code: "));
    Serial.println(remote.key);
    last_read_timestamp = millis();
  }
}
