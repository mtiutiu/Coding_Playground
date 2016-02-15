#include <Arduino.h>
#include <Button.h>
#include <LiquidCrystal.h>
#include <Sleepy.h>
#include <VirtualWire.h>

enum Commands {
	BRAKE_CMD,
	TURN_LEFT_CMD,
	TURN_RIGHT_CMD,
	DRIVE_FWD_CMD,
	DRIVE_BKWD_CMD
};

const uint8_t SPEED_LVL_SAMPLES	= 4;
const uint8_t SPEED_LVL_SAMPLES_INTERVAL = 10;
const uint8_t BATTERY_LVL_SAMPLES = 4;
const uint8_t BATTERY_LVL_SAMPLES_INTERVAL = 10;

Button turnLeftBtn = Button(7, BUTTON_PULLUP_INTERNAL, true, 50);
Button turnRighttBtn = Button(5, BUTTON_PULLUP_INTERNAL, true, 50);
Button forwardBtn = Button(4, BUTTON_PULLUP_INTERNAL, true, 50);
Button backwardBtn = Button(9, BUTTON_PULLUP_INTERNAL, true, 50);
Button brakeBtn = Button(6, BUTTON_PULLUP_INTERNAL, true, 50);

LiquidCrystal lcd(16, 17, 15, 14, 2, 3);

byte battSymbol1[8] = { B11111, B10000, B10000, B10000, B10000, B10000, B10000, B11111 };
byte battSymbol2[8] = { B11111, B00000, B00000, B00000, B00000, B00000, B00000, B11111 };
byte battSymbol3[8] = { B10000, B01000, B00111, B00111, B00111, B00111, B01000, B10000 };
byte arrowSymbol[8] = { B10000, B11000, B11100, B11111, B11111, B11100, B11000, B10000 };

struct Vehicle {
	byte command;
	byte velocity;
};

Vehicle vehicle;

byte getBatteryUsage(byte samples, word sampleInterval) {
	float voltage = 0.0;

	for(byte i = 0; i < samples; i++) {
		voltage += analogRead(A7);
		Sleepy::loseSomeTime(sampleInterval);
	}

	voltage = (((voltage / samples) / 1023.0) * 10);

	return (byte)round((abs(voltage - 5)/4.0) * 100);
}

byte getSpeedLevel(byte samples, word sampleInterval) {
	int speedLevel = 0;

	for(byte i = 0; i < samples; i++) {
		speedLevel += analogRead(A6);
		Sleepy::loseSomeTime(sampleInterval);
	}

	return (byte)map((speedLevel / samples), 0, 1023, 0, 10);
}

void sendRadioCmds() {
	vw_send((uint8_t*)&vehicle, sizeof(vehicle));
	vw_wait_tx(); // Wait until the whole message is gone
}

void turnLeftPressEventHandler(Button&) {
	vehicle.command = TURN_LEFT_CMD;
}

void turnRightPressEventHandler(Button&) {
	vehicle.command = TURN_RIGHT_CMD;
}

void forwardPressEventHandler(Button&) {
	vehicle.command = DRIVE_FWD_CMD;
}

void backwardPressEventHandler(Button&) {
	vehicle.command = DRIVE_BKWD_CMD;
}

void releaseEventHandler(Button&) {
	vehicle.command = BRAKE_CMD;
}

void checkControlButtons() {
	turnLeftBtn.process();
	turnRighttBtn.process();
	forwardBtn.process();
	backwardBtn.process();
}

void updateControlsDisplay() {
	lcd.setCursor(0, 0);

	switch (vehicle.command) {
	    case TURN_LEFT_CMD:
	      lcd.print("LEFT");
	      break;
	    case TURN_RIGHT_CMD:
	      lcd.print("RIGHT");
	      break;
	     case DRIVE_FWD_CMD:
	     	lcd.print("FORWARD");
	     	break;
	     case DRIVE_BKWD_CMD:
	     	lcd.print("BACKWARD");
	     	break;
	     case BRAKE_CMD:
	     	lcd.print("BRAKE");
	     	break;
	    default:;
	}
}

void updateBatteryUsageDisplay(uint8_t voltagePercentLevel) {
	lcd.setCursor(9, 0);

	lcd.write((uint8_t)0);
	lcd.write((uint8_t)1);
	lcd.write((uint8_t)2);
	lcd.print((voltagePercentLevel >= 0) ? voltagePercentLevel : 0);
	lcd.print("%");
}

void updateSpeedDisplay(uint8_t speedLevel) {
	lcd.setCursor(0, 1);

	for(byte i = 0; i <= speedLevel; i++) {
		if(i > 0) {
			lcd.write((uint8_t)3);
		}
	}

	lcd.setCursor(12, 1);
	lcd.print(">");
	if(speedLevel < 10) {
		lcd.print("0");
	}
	lcd.print(speedLevel);
	lcd.print("<");
}

inline void updateDisplay() {
	lcd.clear();

	updateBatteryUsageDisplay(getBatteryUsage(BATTERY_LVL_SAMPLES, BATTERY_LVL_SAMPLES_INTERVAL));
	updateSpeedDisplay(vehicle.velocity);
	updateControlsDisplay();
}

void setup() {
	turnLeftBtn.pressHandler(turnLeftPressEventHandler);
	turnRighttBtn.pressHandler(turnRightPressEventHandler);
	forwardBtn.pressHandler(forwardPressEventHandler);
	backwardBtn.pressHandler(backwardPressEventHandler);

	turnLeftBtn.releaseHandler(releaseEventHandler);
	turnRighttBtn.releaseHandler(releaseEventHandler);
	forwardBtn.releaseHandler(releaseEventHandler);
	backwardBtn.releaseHandler(releaseEventHandler);

	lcd.createChar(0, battSymbol1);
	lcd.createChar(1, battSymbol2);
	lcd.createChar(2, battSymbol3);
	lcd.createChar(3, arrowSymbol);

	lcd.begin(16, 2);
	lcd.clear();

	vw_setup(2000); // Bits per sec
	vw_rx_start();

	//Serial.begin(9600);
	//Serial.println("started...");
}

void loop() {
	sendRadioCmds();

	vehicle.velocity = getSpeedLevel(SPEED_LVL_SAMPLES, SPEED_LVL_SAMPLES_INTERVAL);
	//Serial.println(vehicle.velocity);

	checkControlButtons();

	Sleepy::loseSomeTime(100);

	updateDisplay();
}