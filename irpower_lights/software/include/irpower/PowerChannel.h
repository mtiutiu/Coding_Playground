#ifndef POWERCHANNEL_H
#define POWERCHANNEL_H

#include <Arduino.h>

enum PowerChannelState {ON, OFF};

class PowerChannel {
	public:
		PowerChannel(const uint8_t pwrChannelPin);
		~PowerChannel();
		PowerChannelState getState();
		void powerOn();
		void powerOff();
		void toggleOnOff();
	
	private:
		uint8_t _pwrChannelPin;
		PowerChannelState _pwrChannelState;
};

#endif
