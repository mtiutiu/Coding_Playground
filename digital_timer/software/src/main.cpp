#include <Arduino.h>
#include <Button.h>
#include <SevSeg.h>
#include <MsTimer2.h>

// keypad buttons constants
const uint8_t SECONDS_UP_KEY = 18;	//SW1	
const uint8_t SECONDS_DOWN_KEY = 14;//SW2
const uint8_t MINUTES_UP_KEY = 16;	//SW3
const uint8_t MINUTES_DOWN_KEY = 17;//SW4
const uint8_t RESET_KEY = 15;	//SW5
const uint8_t START_KEY = 19;	//SW6
const uint32_t KEY_HOLD_TIME_MS = 1500;
const int32_t DEBOUNCE_DURATION_MS = 50;
const int8_t UP = 1;
const int8_t DOWN = -1;

// display constants
const uint8_t DISPLAY_DIGITS_NO = 4;
const uint8_t DISPLAY_ANODE1_PIN = 12;
const uint8_t DISPLAY_ANODE2_PIN = 11;
const uint8_t DISPLAY_ANODE3_PIN = 10;
const uint8_t DISPLAY_ANODE4_PIN = 9;
const uint8_t DISPLAY_DP_PIN = 1;
const uint8_t DISPLAY_SEGA_PIN = 2;
const uint8_t DISPLAY_SEGB_PIN = 3;
const uint8_t DISPLAY_SEGC_PIN = 4;
const uint8_t DISPLAY_SEGD_PIN = 5;
const uint8_t DISPLAY_SEGE_PIN = 6;
const uint8_t DISPLAY_SEGF_PIN = 7;
const uint8_t DISPLAY_SEGG_PIN = 8;
const uint32_t TIME_UNIT_UPDATE_INTERVAL = 100;
const byte DISPLAY_BRIGHTNESS_LEVEL = 80;

// timer constants
const uint32_t TIMER_BASE_1S = 1000; // 1s timer base(1000ms)
const uint8_t SECONDS_MIN_VALUE = 0;
const uint8_t SECONDS_MAX_VALUE = 59;
const uint8_t MINUTES_MIN_VALUE = 0;
const uint8_t MINUTES_MAX_VALUE = 99;

// relay constants
const uint8_t RELAY_DRIVE_PIN = 13;

// system state constants
const uint8_t IDLE = 0;
const uint8_t WORKING = 1;
const uint8_t FINISHED = 2;
const uint8_t SETUP = 3;
const uint8_t RESET = 4;
static uint8_t currentSystemState = IDLE;

static char displayBuffer[DISPLAY_DIGITS_NO + 1];
static char seconds = 0;
static char minutes = 0;

static bool isPresetedTimeElapsed = false;

Button secondsUpBtn = Button(SECONDS_UP_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);
Button secondsDownBtn = Button(SECONDS_DOWN_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);
Button minutesUpBtn = Button(MINUTES_UP_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);
Button minutesDownBtn = Button(MINUTES_DOWN_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);
Button resetBtn = Button(RESET_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);
Button startBtn = Button(START_KEY, BUTTON_PULLUP_INTERNAL, true, DEBOUNCE_DURATION_MS);

SevSeg digTimerDisplay = SevSeg();

inline void lightOn() {
	digitalWrite(RELAY_DRIVE_PIN, HIGH);
}

inline void lightOff() {
	digitalWrite(RELAY_DRIVE_PIN, LOW);
}

void resetSystem() {
	seconds = SECONDS_MIN_VALUE;
	minutes = MINUTES_MIN_VALUE;
	isPresetedTimeElapsed = false; // reset the required time elapsed flag
	MsTimer2::stop(); // stop the timer
	lightOff(); //de-activate the relay
	currentSystemState = RESET;
}

void startSystem() {
	lightOn(); //activate the relay
	MsTimer2::restart(); // restart the timer
	currentSystemState = WORKING;
}

void checkModifyTimeUnit(char* timeUnit, int8_t upDown, uint8_t minValue , uint8_t maxValue) {
	if(currentSystemState != WORKING) {
		*timeUnit = constrain((*timeUnit + upDown), minValue, maxValue);
		currentSystemState = SETUP;
	}
}

void secondsUpEventHandler(Button&) {
	checkModifyTimeUnit(&seconds, UP, SECONDS_MIN_VALUE, SECONDS_MAX_VALUE);
}

void secondsDownEventHandler(Button&) {
	checkModifyTimeUnit(&seconds, DOWN, SECONDS_MIN_VALUE, SECONDS_MAX_VALUE);
}

void minutesUpEventHandler(Button&) {
	checkModifyTimeUnit(&minutes, UP, MINUTES_MIN_VALUE, MINUTES_MAX_VALUE);
}

void minutesDownEventHandler(Button&) {
	checkModifyTimeUnit(&minutes, DOWN, MINUTES_MIN_VALUE, MINUTES_MAX_VALUE);
}

void resetEventHandler(Button&) {
	resetSystem();
}

void startEventHandler(Button&) {
	if((currentSystemState == SETUP) && 
		((seconds != SECONDS_MIN_VALUE) || (minutes != MINUTES_MIN_VALUE))) {
		startSystem();
	}
}

void timerHandler1s() {
	if(seconds > SECONDS_MIN_VALUE) {
		--seconds;
	} else {
		seconds = SECONDS_MAX_VALUE;
		if(minutes > MINUTES_MIN_VALUE) {
			--minutes;
		} else {
			seconds = SECONDS_MIN_VALUE;
			isPresetedTimeElapsed = true; // set the required time elapsed flag
		}
	}
}

void setup() {
	// registering buttons events
	secondsUpBtn.clickHandler(secondsUpEventHandler);
	//secondsUpBtn.holdHandler(secondsUpEventHandler, KEY_HOLD_TIME_MS);
	secondsDownBtn.clickHandler(secondsDownEventHandler);
	//secondsDownBtn.holdHandler(secondsDownEventHandler, KEY_HOLD_TIME_MS);
	minutesUpBtn.clickHandler(minutesUpEventHandler);
	//minutesUpBtn.holdHandler(minutesUpEventHandler, KEY_HOLD_TIME_MS);
	minutesDownBtn.clickHandler(minutesDownEventHandler);
	//minutesDownBtn.holdHandler(minutesDownEventHandler, KEY_HOLD_TIME_MS);
	resetBtn.clickHandler(resetEventHandler);
	startBtn.clickHandler(startEventHandler);
	
	// display setup
	digTimerDisplay.Begin(COMMON_ANODE, 
						  DISPLAY_DIGITS_NO,
						  DISPLAY_ANODE1_PIN,
						  DISPLAY_ANODE2_PIN,
						  DISPLAY_ANODE3_PIN,
						  DISPLAY_ANODE4_PIN,
						  DISPLAY_SEGA_PIN,
						  DISPLAY_SEGB_PIN,
						  DISPLAY_SEGC_PIN,
						  DISPLAY_SEGD_PIN,
						  DISPLAY_SEGE_PIN,
						  DISPLAY_SEGF_PIN,
						  DISPLAY_SEGG_PIN,
						  DISPLAY_DP_PIN);
	digTimerDisplay.SetBrightness(DISPLAY_BRIGHTNESS_LEVEL);
	
	//timer setup
	MsTimer2::set(TIMER_BASE_1S, timerHandler1s);
	
	//relay setup
	pinMode(RELAY_DRIVE_PIN, OUTPUT);
	
	resetSystem();
}

void pollKeypad() {
	static uint32_t lastTime = 0;
	
	secondsUpBtn.isPressed();
	secondsDownBtn.isPressed();
	minutesUpBtn.isPressed();
	minutesDownBtn.isPressed();
	resetBtn.isPressed();
	startBtn.isPressed();
	
	if(millis() - lastTime >= TIME_UNIT_UPDATE_INTERVAL) {
		lastTime = millis();
		if(secondsUpBtn.heldFor(KEY_HOLD_TIME_MS)) {
			checkModifyTimeUnit(&seconds, UP, SECONDS_MIN_VALUE, SECONDS_MAX_VALUE);
		}
		if(secondsDownBtn.heldFor(KEY_HOLD_TIME_MS)) {
			checkModifyTimeUnit(&seconds, DOWN, SECONDS_MIN_VALUE, SECONDS_MAX_VALUE);
		}
		if(minutesUpBtn.heldFor(KEY_HOLD_TIME_MS)) {
			checkModifyTimeUnit(&minutes, UP, MINUTES_MIN_VALUE, MINUTES_MAX_VALUE);
		}
		if(minutesDownBtn.heldFor(KEY_HOLD_TIME_MS)) {
			checkModifyTimeUnit(&minutes, DOWN, MINUTES_MIN_VALUE, MINUTES_MAX_VALUE);
		}
	}
}

void displayUpdate() {
	switch(currentSystemState) {
		case IDLE:
			sprintf(displayBuffer, "%s", "idle");
			break;
		case SETUP:
		case RESET:
		case WORKING:
			sprintf(displayBuffer, "%02d%02d", minutes, seconds);
			break;
		case FINISHED:
			sprintf(displayBuffer, "%s", "done");
			break;
		default: ;
	}
	
	digTimerDisplay.DisplayString(displayBuffer, 0);
}

void checkElapsedTime() {
	if(isPresetedTimeElapsed) {
		resetSystem();
		currentSystemState = FINISHED;
	}
}

int main(void) {
	init();
	setup();
	
	for(;;) {
		// check buttons and fire events
		pollKeypad();
	
		//update display
		displayUpdate();
	
		//check elapsed time
		checkElapsedTime();
	}
	
	return 0;
}
