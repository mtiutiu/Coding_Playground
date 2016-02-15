#include "IRSensorRecv.h"

bool IRSensorRecv::_itsSampleTime = false;

// ---------- public methods -------------------------------------------
IRSensorRecv::IRSensorRecv(const uint8_t irSensorRecvPin) {
	//enable IR receiver and led blink on IR activity
	_irReceiver = new IRrecv(irSensorRecvPin);
	_irReceiver->enableIRIn();
	_irReceiver->blink13(1);
	
	//IR decode results
	_irDecodeResults = new decode_results();
	
	// no listener registered yet
	_irSensorRecvListener = NULL;
	
	// no key events are happening initially
	_keyEventType = NO_KEYPRESS_EVENT;
	
	// no key event initially
	_keyCode = KEY_NOKEY;
	
	// start the IR data sampler
	MsTimer2::set(IR_DATA_SAMPLE_TIME_MS, irRecvDatasampler);
	MsTimer2::start();
}

IRSensorRecv::~IRSensorRecv() {
	// delete _irReceiver;
	// delete _irDecodeResults;
}

void IRSensorRecv::addEventListener(IRSensorRecvListener* irSensorRecvListener) {
	if(irSensorRecvListener != NULL) {
		_irSensorRecvListener = irSensorRecvListener;
	}
}

void IRSensorRecv::removeEventListener() {
	_irSensorRecvListener = NULL;
}

void IRSensorRecv::poll() {
	noInterrupts();
	
	checkIRSensorRecvState();
	fireEvents();
	
	interrupts();
}
// ---------------------------------------------------------------------

// ------------- private methods ---------------------------------------
void IRSensorRecv::fireEvents() {
	// if none of the conditions required
	//  for an event to take place are met then no events are fired
	if( (_irSensorRecvListener == NULL) || 
		(_keyEventType == NO_KEYPRESS_EVENT) ) {	
		return;
	}
	
	_irSensorRecvListener->irSensorRecvEvent(_keyEventType, _keyCode);
	
	// after the events and key codes were sent to the listener reset them
	_keyEventType = NO_KEYPRESS_EVENT;
	_keyCode = KEY_NOKEY;
}

void IRSensorRecv::checkIRSensorRecvState() {
	uint32_t irRecvData = readIRSensorRecvData();
	
	// from the IR receiver we get a train of impulses
	// so we count(sample) them at a fixed interval of time
	static uint8_t hits = 0;
	
	if(irRecvData) {
		++hits;
		_keyCode = irRecvData;
	}
	
	if(_itsSampleTime) {
		if((hits >= SHORT_KEYPRESS_MIN_THRESHOLD) && 
			(hits <= SHORT_KEYPRESS_MAX_THRESHOLD)) {
			_keyEventType = SHORT_KEYPRESS_EVENT;
		}
		if(hits >= LONG_KEYPRESS_THRESHOLD) {
			_keyEventType = LONG_KEYPRESS_EVENT;
		}
		hits = 0;
		_itsSampleTime = false;
	}
	
}

uint32_t IRSensorRecv::readIRSensorRecvData() {
	uint32_t irSensorRecvData = 0;
	
	if (_irReceiver->decode(_irDecodeResults)) {
		irSensorRecvData = _irDecodeResults->value;
		_irReceiver->resume(); // Receive the next value
	} 
	
	return irSensorRecvData;
}

inline void IRSensorRecv::irRecvDatasampler() {
	_itsSampleTime = true;
}
// ---------------------------------------------------------------------
