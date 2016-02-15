#include "PowerLedDimmer.h"

const uint8_t MIN_DIMM_LEVEL = 1;
const uint8_t MAX_DIMM_LEVEL = 16;

const uint8_t MIN_PWM_LEVEL = 0; // leds off
const uint8_t MAX_PWM_LEVEL = 255;

// ------------------- public methods ----------------------------------
PowerLedDimmer::PowerLedDimmer(uint8_t pwmDataOutPin, uint8_t dimmLevels) {
	
	_pwmDataOutPin = pwmDataOutPin;
	
	// constrain the number of levels to 1-128 interval of permitted values
	dimmLevels = constrain(dimmLevels, MIN_DIMM_LEVEL, MAX_DIMM_LEVEL);
	
	// dimm step
	_dimmStep = ((MAX_PWM_LEVEL + 1) / dimmLevels);
	
	// populate pwm data circular buffer	
	_pwmDataBuffer = createPWMDataCircularBuffer(dimmLevels, _dimmStep);
	
	// starting in powered off state
	powerOff();
}

PowerLedDimmer::~PowerLedDimmer() {
	// _pwmDataBuffer->deAllocate();
	// delete _pwmDataBuffer;
}

void PowerLedDimmer::powerOn() {
	analogWrite(_pwmDataOutPin, getCurrentDimmLevel());
	setDimmerState(ON);
}

void PowerLedDimmer::powerOff() {
	analogWrite(_pwmDataOutPin, MIN_PWM_LEVEL);
	setDimmerState(OFF);
}

void PowerLedDimmer::dimmContinuously() {
	analogWrite(_pwmDataOutPin, getCircularBufferPWMData(_pwmDataBuffer));
	
	if(getCurrentDimmLevel() == (_dimmStep - 1) || 	getCurrentDimmLevel() == MAX_PWM_LEVEL) {						
		signalLimit();
	}
}
// ---------------------------------------------------------------------

// ------------------ private methods ----------------------------------
ByteBuffer* PowerLedDimmer::createPWMDataCircularBuffer(uint8_t levels, uint8_t step) {
	
	ByteBuffer* buffer = new ByteBuffer();
	
	buffer->init(2 * (levels - 1));
	
	for(uint8_t i = 1; i <= levels; i++) {		
		buffer->put((step * i) - 1);
		if(i <= (levels - 2)) {
			buffer->putInFront((step * (i + 1)) - 1);
		}
	}
	
	return buffer;
}

uint8_t PowerLedDimmer::getCircularBufferPWMData(ByteBuffer* buffer) {
	
	uint8_t pwmData = 0;
	
	if(buffer != NULL) {
		pwmData = buffer->getFromBack();
		buffer->putInFront(pwmData);
	}
	
	return pwmData;
}

void PowerLedDimmer::signalLimit() {
	for(uint8_t i = 0; i < 2; i++) {
		analogWrite(_pwmDataOutPin, MIN_PWM_LEVEL);
		delay(100);
		analogWrite(_pwmDataOutPin, getCurrentDimmLevel());
		delay(100);
	}
}
// ---------------------------------------------------------------------
