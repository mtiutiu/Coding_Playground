#include <Arduino.h>
// sevseg_drv_test.ino

const uint8_t DIGIT_MULTIPLEXING_DATA_FRAME_LEN = 4;
const uint8_t SEGMENT_DATA_FRAME_OFFSET = DIGIT_MULTIPLEXING_DATA_FRAME_LEN;	// digit multiplexing data takes 4 bits
const uint8_t SEGMENT_DATA_FRAME_LEN = 8;
const uint8_t DATA_FRAME_LENGTH = DIGIT_MULTIPLEXING_DATA_FRAME_LEN + SEGMENT_DATA_FRAME_LEN;	// total data frame length(multiplexing data + segments data)
const uint8_t DIO_PIN = 9;
const uint8_t LATCH_PIN = 10;
const uint8_t SCLK_PIN = 11;

const uint8_t DIGIT_SEGMENT_DATA[] = {
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
	0b11111111,	// BLANK
};

const uint8_t BLANK_INDEX = sizeof(DIGIT_SEGMENT_DATA) - 1;
const uint8_t MINUS_SIGN_INDEX = sizeof(DIGIT_SEGMENT_DATA) - 2;
const uint8_t DOT_SIGN_INDEX = sizeof(DIGIT_SEGMENT_DATA) - 3;

void intToBCD(int16_t data, uint8_t* result) {
	boolean negative = (data < 0) ? true : false;

	// for negative numbers we must to take the absolute value into account to get correct results
	//	as negative numbers have different internal representation(the msb aka most significant bit is 1)
	if(negative) {
		data = abs(data);
	}

	while(data >= 10) {
		*(result++) = (data % 10);
		data = data / 10;
	}

	*(result++) = data;

	// if we have a negative number then display the sign also
	if(negative) {
		*(result++) = MINUS_SIGN_INDEX;
	}
}

void shiftData(uint8_t data, uint8_t len) {
	// data is shifted into 595 registers on the rising clock edge
	// we shift the data to the right one bit at a time 
	//	and mask all the bits excluding the last one which is the bit we're interested in

	for(uint8_t i = 0; i < len; i++) {
		digitalWrite(SCLK_PIN, LOW);

		digitalWrite(DIO_PIN, ((data >> i) & 0b00000001));
		
		digitalWrite(SCLK_PIN, HIGH);
	}
}

void displayDigitData(uint8_t data, uint8_t digit) {
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
	digitalWrite(LATCH_PIN, LOW);

	// shift data in
	shiftData((1 << digit), DIGIT_MULTIPLEXING_DATA_FRAME_LEN);
	shiftData(data, SEGMENT_DATA_FRAME_LEN);

	// enable internal latch and display shifted data
	digitalWrite(LATCH_PIN, HIGH);
}

void blankDisplay() {
	for(uint8_t i = 0; i < DIGIT_MULTIPLEXING_DATA_FRAME_LEN; i++) {
		displayDigitData(DIGIT_SEGMENT_DATA[BLANK_INDEX], i);
	}
}

void display(int16_t data) {
	uint8_t bcd[DIGIT_MULTIPLEXING_DATA_FRAME_LEN];

	// blank all digits data so that we display only what's necessary
	memset(bcd, BLANK_INDEX, DIGIT_MULTIPLEXING_DATA_FRAME_LEN);
	
	// convert data to BCD format so that we can get digits index data from the segments lookup table
	intToBCD(data, bcd);
	
	// display the data on each digit using multiplexing
	for(uint8_t i = 0; i < DIGIT_MULTIPLEXING_DATA_FRAME_LEN; i++) {
		displayDigitData(DIGIT_SEGMENT_DATA[bcd[i]], i);
	}
}

boolean testDisplayWithNegativePositiveRange() {
	const int16_t POSITIVE_LIMIT = 9999;
	const int16_t NEGATIVE_LIMIT = -999;

	const uint32_t DISPLAY_UPDATE_INTERVAL_MS = 100;
	static uint32_t lastUpdate = 0;

	// start with negative limit and count up from that
	static int16_t counter = NEGATIVE_LIMIT;

	if((millis() - lastUpdate) >= DISPLAY_UPDATE_INTERVAL_MS) {
		counter = (counter <= POSITIVE_LIMIT) ? counter : NEGATIVE_LIMIT;
		lastUpdate = millis();
		++counter;
	}

	// the display needs to be refreshed as fast as possible 
	//	so we cannot afford to use delays when calling display function
	display(counter);

	return (counter <= POSITIVE_LIMIT);
}

void testDisplayDigits() {
	const uint32_t SYMBOLS_TEST_INTERVAL_MS = 200;

	for(uint8_t i = 0; i < DIGIT_MULTIPLEXING_DATA_FRAME_LEN; i++) {
		for(uint8_t j = 0; j < sizeof(DIGIT_SEGMENT_DATA); j++) {
			displayDigitData(DIGIT_SEGMENT_DATA[j], i);
			delay(SYMBOLS_TEST_INTERVAL_MS);
		}
	}
}

void setup() {
	pinMode(DIO_PIN, OUTPUT);
	pinMode(LATCH_PIN, OUTPUT);
	pinMode(SCLK_PIN, OUTPUT);
}

void loop() {
	// test each digit with all the supported symbols
	testDisplayDigits();

	// test negative and positive numbers limits
	while(testDisplayWithNegativePositiveRange());
}

