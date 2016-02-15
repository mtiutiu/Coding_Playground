#include <Arduino.h>
#include <Sleepy.h>
#include <VirtualWire.h>

enum Commands {
	BRAKE_CMD,
	TURN_LEFT_CMD,
	TURN_RIGHT_CMD,
	DRIVE_FWD_CMD,
	DRIVE_BKWD_CMD
};

// PWM PINS(ARDUINo PRO MINI): 3, 5, 6, 9, 10, 11

const uint8_t STEERING_ENGINE_CTRL_PIN1	= 2;
const uint8_t STEERING_ENGINE_CTRL_PIN2	= 3;

const uint8_t MAIN_ENGINE_CTRL_PIN1	= 4;
const uint8_t MAIN_ENGINE_CTRL_PIN2	= 5;

const uint8_t MAIN_ENGINE_VELOCITY_CTRL_PIN = 6;

struct Vehicle {
	byte command;
	byte velocity;
};

static Vehicle vehicle;

void setVelocity(byte velocity) {
	analogWrite(MAIN_ENGINE_VELOCITY_CTRL_PIN, map(velocity, 0, 10, 0, 255));
}

void turnCarLeft() {
	//Serial.println("LEFT");

	digitalWrite(STEERING_ENGINE_CTRL_PIN1, LOW);
	digitalWrite(STEERING_ENGINE_CTRL_PIN2, HIGH);
}

void turnCarRight() {
	//Serial.println("RIGHT");

	digitalWrite(STEERING_ENGINE_CTRL_PIN1, HIGH);
	digitalWrite(STEERING_ENGINE_CTRL_PIN2, LOW);
}

void driveCarForward() {
	//Serial.println("FORWARD");

	digitalWrite(MAIN_ENGINE_CTRL_PIN1, LOW);
	digitalWrite(MAIN_ENGINE_CTRL_PIN2, HIGH);
}

void driveCarBackward() {
	//Serial.println("BACKWARD");

	digitalWrite(MAIN_ENGINE_CTRL_PIN1, HIGH);
	digitalWrite(MAIN_ENGINE_CTRL_PIN2, LOW);
}

void carBrake() {
	//Serial.println("BRAKE");

	digitalWrite(MAIN_ENGINE_CTRL_PIN1, LOW);
	digitalWrite(MAIN_ENGINE_CTRL_PIN2, LOW);

	digitalWrite(STEERING_ENGINE_CTRL_PIN1, LOW);
	digitalWrite(STEERING_ENGINE_CTRL_PIN2, LOW);

	setVelocity(0);
}

void processRadioCommands() {

	switch (vehicle.command) {
	    case TURN_LEFT_CMD:
	    	turnCarLeft();
	      	break;
	    case TURN_RIGHT_CMD:
	    	turnCarRight();
	    	break;
	    case DRIVE_FWD_CMD:
	     	driveCarForward();
	     	break;
	    case DRIVE_BKWD_CMD:
	     	driveCarBackward();
	     	break;
	    case BRAKE_CMD:
	    default: 
	    	carBrake();
	}

	setVelocity(vehicle.velocity);
	//Serial.println(vehicle.velocity, DEC);
}

void getRadioCommands() {
	uint8_t dataLen = sizeof(Vehicle);

	if (vw_get_message((uint8_t*)&vehicle, &dataLen)) {
		processRadioCommands();
	}
}

inline void resetCarState() {
	vehicle.command = BRAKE_CMD;
	setVelocity(0);
}

void setup() {
	pinMode(STEERING_ENGINE_CTRL_PIN1, OUTPUT);
	pinMode(STEERING_ENGINE_CTRL_PIN2, OUTPUT);

	pinMode(MAIN_ENGINE_CTRL_PIN1, OUTPUT);
	pinMode(MAIN_ENGINE_CTRL_PIN2, OUTPUT);

	resetCarState();

	vw_setup(2000); // Bits per sec
	vw_rx_start();

	//Serial.begin(9600);
	//Serial.println("ready");
}

void loop() {
	getRadioCommands();

	//Sleepy::loseSomeTime(100);
}