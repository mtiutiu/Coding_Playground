#ifndef POWERDIMMER_H
#define POWERDIMMER_H

#include <Arduino.h>
#include <ByteBuffer.h>

enum dimmer_state {ON, OFF};

class PowerLedDimmer {
						
	private:
		ByteBuffer* _pwmDataBuffer;
		uint8_t _dimmStep;
		uint8_t _pwmDataOutPin;
		dimmer_state _dimmerState;
		void setDimmerState(dimmer_state newState) { _dimmerState = newState; }
		ByteBuffer* createPWMDataCircularBuffer(uint8_t levels, uint8_t step);
		uint8_t getCircularBufferPWMData(ByteBuffer* buffer);
		void signalLimit();
	
	public:
		PowerLedDimmer(uint8_t pwmDataOutPin, uint8_t dimmLevels);		
		~PowerLedDimmer();
		void powerOn();
		void powerOff();
		void dimmContinuously();
		uint8_t getCurrentDimmLevel(){ return (_pwmDataBuffer!= NULL) ? _pwmDataBuffer->peek(0) : 0; }
		dimmer_state getDimmerState(){ return _dimmerState; }
};

#endif
