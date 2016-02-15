#ifndef TOUCHLAMP_H
#define TOUCHLAMP_H

#include <Arduino.h>
#include "PowerLedDimmer.h"
#include "TouchSensor.h"
#include "TouchSensorListener.h"

class TouchLamp : public TouchSensorListener {
	public:
		TouchLamp(uint8_t sensorSourcePin, uint8_t sensorSensePin, 
			  uint8_t powerDimmerPWMOutPin, uint8_t maxDimmLevel);	  
		~TouchLamp();
		void run();
		
	private:
		TouchSensor* _touchSensor;
		PowerLedDimmer* _powerDimmer;
		void tapEvent(event_type eventType);
		void handleShortTapEvent();
		void handleLongTapEvent();
};

#endif
