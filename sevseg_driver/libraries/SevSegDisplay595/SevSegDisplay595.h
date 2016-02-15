#ifndef SEV_SEG_595_H
#define SEV_SEG_595_H

#include <Arduino.h>

class SevSegDisplay595 : public Print {

	public:
		SevSegDisplay595(const uint8_t dioPin, const uint8_t sclkPin, const uint8_t latchPin, uint8_t digits);
		void begin();
		void blank();
		
	private:
		uint8_t _dioPin, _sclkPin, _latchPin, _digits, _dataFrameLength;
		static const uint8_t SEGMENT_DATA_FRAME_LEN = 8;
		static const uint8_t DIGIT_SEGMENT_DATA_LEN = 13;

		const uint8_t DIGIT_SEGMENT_DATA[DIGIT_SEGMENT_DATA_LEN] = {
			//abcdefgh  
			0b00000011,	// 0
			0b10011111,	// 1
			0b00100101,	// 2
			0b00001101,	// 3
			0b10011001,	// 4
			0b01001001,	// 5
			0b01000001,	// 6
			0b00011111,	// 7
			0b00000001,	// 8
			0b00001001,	// 9
			0b11111110,	// .
			0b11111101,	// -
			0b11111111	// BLANK
		};

		const uint8_t BLANK_INDEX = DIGIT_SEGMENT_DATA_LEN - 1;
		const uint8_t MINUS_SIGN_INDEX = DIGIT_SEGMENT_DATA_LEN - 2;
		const uint8_t DOT_SIGN_INDEX = DIGIT_SEGMENT_DATA_LEN - 3;

		void shiftData(uint8_t data, uint8_t len);
		void displayDigitData(uint8_t data, uint8_t digit);
		size_t write(const uint8_t *buffer, size_t size);
		size_t write(uint8_t data);
};

#endif