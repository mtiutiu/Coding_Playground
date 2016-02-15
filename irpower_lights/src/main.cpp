#include <Arduino.h>
#include "IRPowerControl.h"
#include "Constants.h"

int main(void) {
	init();
	
	//Serial.begin(9600);
	
	IRPowerControl* irPowerControl = new IRPowerControl(IR_SENSOR_RECV_PIN, 
							    PWR_DIMMER_CHANNELS_NO,
							    PWR_DIMMER_CHANNELS_PINS);
	irPowerControl->run();

	return 0;
}
