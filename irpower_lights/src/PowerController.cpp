#include "PowerController.h"

// ------------------- public methods ----------------------------------
PowerController::PowerController(const uint8_t pwrChannelsNo,
				 const uint8_t pwrChannelsPins[]) {
							
	_pwrChannelsNo = pwrChannelsNo;
	
	_pwrChannelsPins = pwrChannelsPins;
	
	_pwrChannels = new PowerChannel*[_pwrChannelsNo];
	
	for(uint8_t i = 0; i < _pwrChannelsNo; i++) {
		_pwrChannels[i] = new PowerChannel(_pwrChannelsPins[i]);
	}
	
	powerOnAllChannels();
}	

PowerController::~PowerController() {
}

void PowerController::powerOnChannel(const uint8_t pwrChannelNo) {
	if((pwrChannelNo >= 0) && (pwrChannelNo < _pwrChannelsNo)) {
		_pwrChannels[pwrChannelNo]->powerOn();
	}
}

void PowerController::powerOffChannel(const uint8_t pwrChannelNo) {
	if((pwrChannelNo >= 0) && (pwrChannelNo < _pwrChannelsNo)) {
		_pwrChannels[pwrChannelNo]->powerOff();
	}
}

void PowerController::toggleOnOffChannel(const uint8_t pwrChannelNo) {
	if((pwrChannelNo >= 0) && (pwrChannelNo < _pwrChannelsNo)) {
		_pwrChannels[pwrChannelNo]->toggleOnOff();
	}
}

void PowerController::powerOnAllChannels() {
	for(uint8_t i = 0; i < _pwrChannelsNo; i++) {
		_pwrChannels[i]->powerOn();
	}
}

void PowerController::powerOffAllChannels() {
	for(uint8_t i = 0; i < _pwrChannelsNo; i++) {
		_pwrChannels[i]->powerOff();
	}
}

void PowerController::toggleOnOffAllChannels() {
	static bool toggle = false;
	toggle = !toggle;
	
	if(toggle) {
		powerOnAllChannels();
	} else {
		powerOffAllChannels();
	}
}

PowerChannel* PowerController::getChannel(const uint8_t pwrChannelNo) {
	PowerChannel* channel = NULL;
	
	if((pwrChannelNo >= 0) && (pwrChannelNo < _pwrChannelsNo)) {
		channel = _pwrChannels[pwrChannelNo];
	}
	
	return channel;
}
// ---------------------------------------------------------------------

// ------------------ private methods ----------------------------------

// ---------------------------------------------------------------------
