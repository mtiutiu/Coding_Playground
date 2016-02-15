#include "TouchSensor.h"

// ---------- public methods -------------------------------------------
TouchSensor::TouchSensor(uint8_t sourcePin, uint8_t sensePin) {

	// for capacitive sensing
	_capSense = new CapSense(sourcePin, sensePin);
	
	// setting elapsed time initial value
	_tapElapsedTime = 0;
	
	//initial sensor state
	_sensorState = RELEASED;
	
	// no listener registered yet
	_listener = NULL;
	
	// no events are happening initially
	_sensorEvent = NO_EVENT;
}

TouchSensor::~TouchSensor() {
	//delete _capSense;
}

void TouchSensor::pollSensor() {
	checkTouchState();
	fireEvents();
}
// ---------------------------------------------------------------------

// ------------- private methods ---------------------------------------
void TouchSensor::fireEvents() {
	// if there is no listener registered then no events are fired
	if((_listener == NULL) || (_sensorEvent == NO_EVENT)) {
		return;
	}
	
	_listener->tapEvent(_sensorEvent);
	_sensorEvent = NO_EVENT;
}

void TouchSensor::checkTouchState() {
	uint32_t sensorData = readTouchSensorData();
	
	// if touch detected then get current elapsed time in ms
	//  and lock on PRESS state
	if((sensorData >= TOUCHED_THRESHOLD) && (_sensorState != PRESSED)) {
		_tapElapsedTime = millis();
		_sensorState = PRESSED;
	} else if((sensorData <= NOT_TOUCHED_THRESHOLD) && (_sensorState != RELEASED)) {
		// calculate elapsed time since PRESS state
		_tapElapsedTime = millis() - _tapElapsedTime;
		
		// fire events based on time elapsed between sensor states
		if(_tapElapsedTime <= SHORT_TOUCH_THRESHOLD_MS) {
			_sensorEvent = SHORT_TAP_EVENT;
		} else if(_tapElapsedTime >= LONG_TOUCH_THRESHOLD_MS) {
			_sensorEvent = LONG_TAP_EVENT;
		}
		
		_sensorState = RELEASED;
	}
}
// ---------------------------------------------------------------------
