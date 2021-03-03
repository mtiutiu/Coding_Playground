#include <Arduino.h>
#include "SevSegDisplay595.h"

SevSegDisplay595::SevSegDisplay595(const uint8_t dioPin, const uint8_t sclkPin, const uint8_t latchPin, uint8_t digits) {
	_dioPin = dioPin;
	_sclkPin = sclkPin;
	_latchPin = latchPin;
	_digits = digits;
	_dataFrameLength = _digits + SEGMENT_DATA_FRAME_LEN;
}

void SevSegDisplay595::begin() {
	pinMode(_dioPin, OUTPUT);
	pinMode(_sclkPin, OUTPUT);
	pinMode(_latchPin, OUTPUT);

	// make display blank initially
	blank();
}

void SevSegDisplay595::blank() {
	for(uint8_t i = 0; i < _digits; i++) {
		displayDigitData(DIGIT_SEGMENT_DATA[BLANK_INDEX], i);
	}
}

void SevSegDisplay595::shiftData(uint8_t data, uint8_t len) {
	// data is shifted into 595 registers on the rising clock edge
	// we shift the data to the right one bit at a time 
	//	and mask all the bits excluding the last one which is the bit we're interested in

	for(uint8_t i = 0; i < len; i++) {
		digitalWrite(_sclkPin, LOW);

		digitalWrite(_dioPin, ((data >> i) & 0b00000001));
		
		digitalWrite(_sclkPin, HIGH);
	}
}

void SevSegDisplay595::displayDigitData(uint8_t data, uint8_t digit) {
	/*		
		The display module expects data in this format: 
			<DIGIT_MULTIPLEXING_DATA><SEGMENT_DATA>
			- digit multiplexing data needs to be shifted in first

		Data frame format explained:
			<BD3 BD2 BD1 BD0><BA BB BC BD BE BF BG BH>

			- there are 4 bits for digits multiplexing as we have 4 digits obvious
			- there are 8 bits for segment data as we have a 7 segment display + the decimal dot

	 		BD - digit activation bit: 0 - digit off, 1 - digit on
		 	BA, BB, BC,.. - segment activation bit(s): 0 - segment on, 1 - segment off
	*/

	// disable internal latch first
	digitalWrite(_latchPin, LOW);

	// shift data in
	shiftData((1 << digit), _digits);
	shiftData(data, SEGMENT_DATA_FRAME_LEN);

	// enable internal latch and display shifted data
	digitalWrite(_latchPin, HIGH);
}

// overriding the default implementation with ours
size_t SevSegDisplay595::write(const uint8_t *buffer, size_t size) {
	// need to handle float...

	const uint8_t ASCII_ALPHANUMERIC_INDEX = 48;

	// we cannot display more than the display is capable of...
	// need a better handling for this - especially for negative numbers
	if(size > _digits) {
		return 0;
	}

	// display the data on each digit using multiplexing
	for(uint8_t i = 0; i < size; i++) {
		// buffer data is ascii so we substract ASCII_ALPHANUMERIC_INDEX from it
		//	 as this is the index in the ascii table where the alphanumeric data starts

		uint8_t segmentDataIndex = buffer[i] - ASCII_ALPHANUMERIC_INDEX;

		displayDigitData(DIGIT_SEGMENT_DATA[segmentDataIndex], (size - i - 1));
	}

	return size;
}

// overriding the default implementation with ours
size_t SevSegDisplay595::write(uint8_t data) {
	size_t n = 0;

	if(data == '-') {
		displayDigitData(DIGIT_SEGMENT_DATA[MINUS_SIGN_INDEX], _digits - 1);
		n = 1;
	}

	return n;
}
