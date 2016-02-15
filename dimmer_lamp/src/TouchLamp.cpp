#include "TouchLamp.h"
								  
// ------------------- public methods ----------------------------------
TouchLamp::TouchLamp(uint8_t sensorSourcePin, 
		     uint8_t sensorSensePin,
		     uint8_t powerDimmerPWMOutPin, 
		     uint8_t maxDimmLevel) {
	
	_touchSensor = new TouchSensor(sensorSourcePin, sensorSensePin);
								   
	// registering this class with the touch sensor so that we get
	// events from it
	_touchSensor->addEventListener(this);
	
	_powerDimmer = new PowerLedDimmer(powerDimmerPWMOutPin, maxDimmLevel);
}

TouchLamp::~TouchLamp() {
	//delete _touchSensor;
	//delete _powerDimmer;
}

void TouchLamp::run() {
	while(true) {
		_touchSensor->pollSensor();
	}
}
// ---------------------------------------------------------------------

// ------------------- private methods ---------------------------------
void TouchLamp::tapEvent(event_type eventType) {
	switch(eventType) {
		case SHORT_TAP_EVENT:
			handleShortTapEvent();
			break;
		case LONG_TAP_EVENT:
			handleLongTapEvent();
			break;
		default: ;
	}
}

void TouchLamp::handleShortTapEvent() {
	// act only if the power dimmer is in the ON state
	if(_powerDimmer->getDimmerState() == ON) {
		_powerDimmer->dimmContinuously();
	}
}

void TouchLamp::handleLongTapEvent() {
	if(_powerDimmer->getDimmerState() == ON) {
		_powerDimmer->powerOff();
	} else {
		_powerDimmer->powerOn();
	}
}
// ---------------------------------------------------------------------
