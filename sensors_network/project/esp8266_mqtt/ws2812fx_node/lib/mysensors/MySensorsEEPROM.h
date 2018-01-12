#ifndef MYSENSORS_EEPROM_H
#define MYSENSORS_EEPROM_H

#include <Arduino.h>
#include <EEPROM.h>

#define EEPROM_size (1024)

namespace MySensorsEEPROM {
  bool hwInit(void) {
  	EEPROM.begin(EEPROM_size);
  	return true;
  }

  void hwReadConfigBlock(void* buf, void* addr, size_t length) {
  	uint8_t* dst = static_cast<uint8_t*>(buf);
  	int pos = reinterpret_cast<int>(addr);
  	while (length-- > 0) {
  		*dst++ = EEPROM.read(pos++);
  	}
  }

  void hwWriteConfigBlock(void* buf, void* addr, size_t length) {
  	uint8_t* src = static_cast<uint8_t*>(buf);
  	int pos = reinterpret_cast<int>(addr);
  	while (length-- > 0) {
  		EEPROM.write(pos++, *src++);
  	}
  	// see implementation, commit only executed if diff
  	EEPROM.commit();
  }

  uint8_t hwReadConfig(const int addr) {
  	uint8_t value;
  	hwReadConfigBlock(&value, reinterpret_cast<void*>(addr), 1);
  	return value;
  }

  void hwWriteConfig(const int addr, uint8_t value) {
  	hwWriteConfigBlock(&value, reinterpret_cast<void*>(addr), 1);
  }
}
#endif
