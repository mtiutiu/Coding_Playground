#include "IRPowerControl.h"
								  
// ------------------- public methods ----------------------------------
IRPowerControl::IRPowerControl( const uint8_t irSensorRecvPin, 
				const uint8_t pwrControllerChannelsNo,
				const uint8_t pwrControllerChannelsPins[]) {
	
	_irSensorRecv = new IRSensorRecv(irSensorRecvPin);
								   
	// registering this class with the ir receiver sensor so that we get
	//  events from it
	_irSensorRecv->addEventListener(this);
	
	_pwrController = new PowerController(pwrControllerChannelsNo, pwrControllerChannelsPins);
}

IRPowerControl::~IRPowerControl() {
	//delete _irSensorRecv;
	//delete _powerDimmer;
}

void IRPowerControl::run() {
	while(true) {
		_irSensorRecv->poll();
	}
}
// ---------------------------------------------------------------------

// ------------------- private methods ---------------------------------
void IRPowerControl::irSensorRecvEvent(KeyEventType keyEventType, uint32_t keyCode) {
	
	//Serial.println(keyCode, HEX);
									
	switch(keyEventType) {
		case SHORT_KEYPRESS_EVENT:
			handleShortKeyPressEvent(keyCode);
			break;
		case LONG_KEYPRESS_EVENT:
			handleLongKeyPressEvent(keyCode);
			break;
		default: ;
	}
}

void IRPowerControl::handleShortKeyPressEvent(uint32_t keyCode) {	
	PowerChannel* workingPwrChannel = NULL;
	
	switch(keyCode) {
		case KEY_POWER_ON_OFF:
			_pwrController->toggleOnOffAllChannels();
			break;
		case KEY_CH1:
			workingPwrChannel = _pwrController->getChannel(0);
			break;
		case KEY_CH2:
			workingPwrChannel = _pwrController->getChannel(1);
			break;
		case KEY_CH3:
			workingPwrChannel = _pwrController->getChannel(2);
			break;
	}
	
	if(workingPwrChannel) {
		workingPwrChannel->toggleOnOff();
	}
}

void IRPowerControl::handleLongKeyPressEvent(uint32_t keyCode) {
	// act only if the power dimmer is in the ON state
	//Serial.print(F("LONG KEY PRESS: "));
	//Serial.println(keyCode, HEX);
}
// ---------------------------------------------------------------------
