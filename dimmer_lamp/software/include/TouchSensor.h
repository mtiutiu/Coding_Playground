#ifndef TOUCHSENSOR_H
#define TOUCHSENSOR_H

#include <Arduino.h>
#include <CapSense.h>
#include "TouchSensorListener.h"

const uint8_t SENSOR_SAMPLES =	30;
const uint32_t TOUCHED_THRESHOLD	= 600;
const uint32_t NOT_TOUCHED_THRESHOLD	= 200;
const uint32_t SHORT_TOUCH_THRESHOLD_MS	= 500;
const uint32_t LONG_TOUCH_THRESHOLD_MS	= 1500;

enum sensor_state {PRESSED, RELEASED};

class TouchSensor {
	private:
		CapSense* _capSense;
		uint32_t _tapElapsedTime;
		event_type _sensorEvent;
		sensor_state _sensorState;
		TouchSensorListener* _listener;
		uint32_t readTouchSensorData(){ return _capSense->capSense(SENSOR_SAMPLES); }
		void checkTouchState();
		void fireEvents();
		
	public:
		TouchSensor(uint8_t sourcePin, uint8_t sensePin);
		~TouchSensor();
		void addEventListener(TouchSensorListener* listener){ _listener = listener; }
		void pollSensor();
};

#endif
