#include <Arduino.h>
#include <WS2812.h>

#define LEDS_COUNT				16
#define LED_RING_DATA_IN_PIN	0
#define FORWARD					0
#define REVERSE					1

WS2812 LED(LEDS_COUNT);
	
cRGB ledRGBData;

static cRGB pallete[] = {
	{10, 0, 0},
	{0, 10, 0},
	{0, 0, 10}
};

static const uint16_t pattern1[LEDS_COUNT] PROGMEM = {
	0b0000000000000001,
	0b0000000000000010,
	0b0000000000000100,
	0b0000000000001000,
	0b0000000000010000,
	0b0000000000100000,
	0b0000000001000000,
	0b0000000010000000,
	0b0000000100000000,
	0b0000001000000000,
	0b0000010000000000,
	0b0000100000000000,
	0b0001000000000000,
	0b0010000000000000,
	0b0100000000000000,
	0b1000000000000000
};

static const uint16_t pattern2[LEDS_COUNT] PROGMEM = {
	0b1000000000000001,
	0b0100000000000010,
	0b0010000000000100,
	0b0001000000001000,
	0b0000100000010000,
	0b0000010000100000,
	0b0000001001000000,
	0b0000000110000000,
	0b0000000110000000,
	0b0000001001000000,
	0b0000010000100000,
	0b0000100000010000,
	0b0001000000001000,
	0b0010000000000100,
	0b0100000000000010,
	0b1000000000000001
};

void blank() {
	for(uint8_t i = 0; i < LEDS_COUNT; i++){
	    ledRGBData.b = 0;
		ledRGBData.g = 0;
		ledRGBData.r = 0;
		LED.set_crgb_at(i, ledRGBData); 
		LED.sync();
	}
}

void loadPattern(const cRGB& color, const uint16_t pattern, bool inverse) {
	uint16_t patternToDisplay = pattern;

	if(inverse) {
		patternToDisplay ^= 0xFFFF;
	}

	for(uint8_t i = 0; i < LEDS_COUNT; i++) {
		if ((patternToDisplay >> i) & 0x0001) {
			LED.set_crgb_at(i, color);
		} else {
			LED.set_crgb_at(i, {0, 0, 0});
		}
		LED.sync();
	}
}

void playPattern(const cRGB colorPallete[], const uint16_t pattern[], 
					uint32_t sequenceDelay, uint8_t mode, bool inverse = false) {
	for(uint8_t i = 0; i < 3; i++){
	    for(uint8_t j = 0; j < LEDS_COUNT; j++) {
			loadPattern(colorPallete[i], 
						pgm_read_word(&pattern[(mode == FORWARD) ? j : (LEDS_COUNT - j - 1)]),
						inverse);
			delay(sequenceDelay);
		}
	}
}

void setup() {
	LED.setOutput(LED_RING_DATA_IN_PIN);
	blank();
}

void loop() {
	playPattern(pallete, pattern1, 100, FORWARD);
	delay(500);

	playPattern(pallete, pattern1, 100, REVERSE);
	delay(500);

	playPattern(pallete, pattern2, 150, FORWARD);
	delay(500);

	playPattern(pallete, pattern2, 150, FORWARD, true);
	delay(500);

	playPattern(pallete, pattern1, 100, FORWARD, true);
	delay(500);

	playPattern(pallete, pattern1, 100, REVERSE, true);
	delay(500);
}

