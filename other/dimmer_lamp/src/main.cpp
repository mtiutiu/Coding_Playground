#include <Arduino.h>
#include "TouchLamp.h"

const uint8_t SENSOR_SOURCE_PIN = 3;
const uint8_t SENSOR_SENSE_PIN = 4;

const uint8_t POWER_DIMMER_PWM_OUT_PIN = 9;
const uint8_t DIMM_LEVELS = 8; // must be power of 2(max value permitted is 16)

int main(void) {
	init();
	
	TouchLamp* touchLamp = new TouchLamp(SENSOR_SOURCE_PIN, 
					     SENSOR_SENSE_PIN,
					     POWER_DIMMER_PWM_OUT_PIN,
					     DIMM_LEVELS);
	touchLamp->run();

	return 0;
}
