#ifndef POWERCONTROLLER_H
#define POWERCONTROLLER_H

#include <Arduino.h>
#include "Constants.h"
#include "PowerChannel.h"

class PowerController {
	public:
		PowerController(const uint8_t pwrChannelsNo, const uint8_t pwrChannelsPins[]);		
		~PowerController();
		void powerOnChannel(const uint8_t pwrChannelNo);
		void powerOffChannel(const uint8_t pwrChannelNo);
		void toggleOnOffChannel(const uint8_t pwrChannelNo);
		void powerOnAllChannels();
		void powerOffAllChannels();
		void toggleOnOffAllChannels();
		PowerChannel* getChannel(const uint8_t pwrChannelNo);
							
	private:
		uint8_t _pwrChannelsNo;
		const uint8_t* _pwrChannelsPins;
		PowerChannel** _pwrChannels;
};

#endif
