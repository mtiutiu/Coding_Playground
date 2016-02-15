// sevseg_drv_print_test.ino

#include <Arduino.h>
#include <SevSegDisplay595.h>

const uint8_t DIO_PIN = 9;
const uint8_t LATCH_PIN = 10;
const uint8_t SCLK_PIN = 11;
const uint8_t TOTAL_DIGITS = 4;

SevSegDisplay595 display(DIO_PIN, SCLK_PIN, LATCH_PIN, TOTAL_DIGITS);

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
	display.print(counter);

	return (counter <= POSITIVE_LIMIT);
}

void setup() {
	display.begin();
}

void loop() {
	// test negative and positive numbers limits
	while(testDisplayWithNegativePositiveRange());
}

