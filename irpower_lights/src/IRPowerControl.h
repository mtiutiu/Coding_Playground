#ifndef IRPOWERCONTROL_H
#define IRPOWERCONTROL_H

#include <Arduino.h>
#include "PowerController.h"
#include "IRSensorRecv.h"
#include "IRSensorRecvListener.h"

class IRPowerControl : public IRSensorRecvListener {
	public:
		IRPowerControl( const uint8_t irSensorRecvPin, 
				const uint8_t pwrControllerChannelsNo,
				const uint8_t pwrControllerChannelsPins[]);	  
		~IRPowerControl();
		void run();
		
	private:
		IRSensorRecv* _irSensorRecv;
		PowerController* _pwrController;
		void irSensorRecvEvent(KeyEventType keyEventType, uint32_t keyCode);
		void handleShortKeyPressEvent(uint32_t keyCode);
		void handleLongKeyPressEvent(uint32_t keyCode);
};

#endif
