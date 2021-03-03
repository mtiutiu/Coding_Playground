#include "PowerChannel.h"

// ------------------- public methods ----------------------------------
PowerChannel::PowerChannel(const uint8_t pwrChannelPin) {
	_pwrChannelPin = pwrChannelPin;
	
	pinMode(pwrChannelPin, OUTPUT);
	
	// powered off initially
	_pwrChannelState = OFF;
}
	
PowerChannel::~PowerChannel() {
}

PowerChannelState PowerChannel::getState() {
	return _pwrChannelState;
}

void PowerChannel::powerOn() {
	if(this->getState() != ON) {
		digitalWrite(_pwrChannelPin, HIGH);
		_pwrChannelState = ON;
	}
}

void PowerChannel::powerOff() {
	if(this->getState() != OFF) {
		digitalWrite(_pwrChannelPin, LOW);
		_pwrChannelState = OFF;;
	}
}

void PowerChannel::toggleOnOff() {
	if(this->getState() != ON) {
		powerOn();
	} else {
		powerOff();
	}
}
// ---------------------------------------------------------------------

// ------------------ private methods ----------------------------------

// ---------------------------------------------------------------------
