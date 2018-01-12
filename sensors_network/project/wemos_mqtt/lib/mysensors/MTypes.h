#ifndef MTYPES_H
#define MTYPES_H

#include <Arduino.h>

// Message Types

const uint8_t M_PRESENTATION    = 0;  // Sent by a node when they present attached sensors. This is usually done in setup() at startup.
const uint8_t M_SET             = 1;  // This message is sent from or to a sensor when a sensor value should be updated
const uint8_t M_REQ             = 2;  // Requests a variable value (usually from an actuator destined for controller).
const uint8_t M_INTERNAL        = 3;  // This is a special internal message. See table below for the details
const uint8_t M_STREAM          = 4; // Used for OTA firmware updates

// SubTypes for MessageType M_PRESENTATION
const uint8_t S_DOOR                  = 0;	  // Door and window sensors	V_TRIPPED, V_ARMED
const uint8_t S_MOTION	              = 1;  // Motion sensors	V_TRIPPED, V_ARMED
const uint8_t S_SMOKE	                = 2;	  // Smoke sensor	V_TRIPPED, V_ARMED
const uint8_t S_BINARY                = 3;	  // Binary device (on/off)	V_STATUS, V_WATT
const uint8_t S_DIMMER                = 4;   // Dimmable device of some kind	V_STATUS (on/off), V_PERCENTAGE (dimmer level 0-100), V_WATT
const uint8_t S_COVER	                = 5;	  // Window covers or shades	V_UP, V_DOWN, V_STOP, V_PERCENTAGE
const uint8_t S_TEMP                  = 6;	  // Temperature sensor	V_TEMP, V_ID
const uint8_t S_HUM	                  = 7;	  // Humidity sensor	V_HUM
const uint8_t S_BARO                  = 8;	  // Barometer sensor (Pressure)	V_PRESSURE, V_FORECAST
const uint8_t S_WIND                  = 9;	  // Wind sensor	V_WIND, V_GUST, V_DIRECTION
const uint8_t S_RAIN	                = 10;  // Rain sensor	V_RAIN, V_RAINRATE
const uint8_t S_UV                    = 11;  // UV sensor	V_UV
const uint8_t S_WEIGHT                = 12;  // Weight sensor for scales etc.	V_WEIGHT, V_IMPEDANCE
const uint8_t S_POWER	                = 13;  // Power measuring device, like power meters	V_WATT, V_KWH, V_VAR, V_VA, V_POWER_FACTOR
const uint8_t S_HEATER                = 14;  // Heater device	V_HVAC_SETPOINT_HEAT, V_HVAC_FLOW_STATE, V_TEMP, V_STATUS
const uint8_t S_DISTANCE              = 15;  // Distance sensor	V_DISTANCE, V_UNIT_PREFIX
const uint8_t S_LIGHT_LEVEL           = 16;  // Light sensor	V_LIGHT_LEVEL (uncalibrated percentage), V_LEVEL (light level in lux)
const uint8_t S_ARDUINO_NODE          = 17;  // Arduino node device
const uint8_t S_ARDUINO_REPEATER_NODE	= 18;  // Arduino repeating node device
const uint8_t S_LOCK                  = 19;  // Lock device	V_LOCK_STATUS
const uint8_t S_IR                    = 20;  // Ir sender/receiver device	V_IR_SEND, V_IR_RECEIVE, V_IR_RECORD
const uint8_t S_WATER                 = 21;  // Water meter	V_FLOW, V_VOLUME
const uint8_t S_AIR_QUALITY           = 22;  // Air quality sensor e.g. MQ-2	V_LEVEL, V_UNIT_PREFIX
const uint8_t S_CUSTOM                = 23;  // Use this for custom sensors where no other fits.
const uint8_t S_DUST                  = 24;  // Dust level sensor	V_LEVEL, V_UNIT_PREFIX
const uint8_t S_SCENE_CONTROLLER      = 25;  // Scene controller device	V_SCENE_ON, V_SCENE_OFF
const uint8_t S_RGB_LIGHT             = 26;  // RGB light	V_RGB, V_WATT
const uint8_t S_RGBW_LIGHT            = 27;  // RGBW light (with separate white component)	V_RGBW, V_WATT
const uint8_t S_COLOR_SENSOR          = 28;  // Color sensor	V_RGB
const uint8_t S_HVAC                  = 29;  // Thermostat/HVAC device	V_STATUS, V_TEMP, V_HVAC_SETPOINT_HEAT, V_HVAC_SETPOINT_COOL, V_HVAC_FLOW_STATE, V_HVAC_FLOW_MODE, V_HVAC_SPEED
const uint8_t S_MULTIMETER            = 30;  // Multimeter device	V_VOLTAGE, V_CURRENT, V_IMPEDANCE
const uint8_t S_SPRINKLER             = 31;  // Sprinkler device	V_STATUS (turn on/off), V_TRIPPED (if fire detecting device)
const uint8_t S_WATER_LEAK            = 32;  // Water leak sensor	V_TRIPPED, V_ARMED
const uint8_t S_SOUND                 = 33;  // Sound sensor	V_LEVEL (in dB), V_TRIPPED, V_ARMED
const uint8_t S_VIBRATION             = 34;  // Vibration sensor	V_LEVEL (vibration in Hz), V_TRIPPED, V_ARMED
const uint8_t S_MOISTURE              = 35;  // Moisture sensor	V_LEVEL (water content or moisture in percentage?), V_TRIPPED, V_ARMED
const uint8_t S_INFO                  = 36;  // LCD text device	V_TEXT
const uint8_t S_GAS                   = 37;  // Gas meter	V_FLOW, V_VOLUME
const uint8_t S_GPS                   = 38;  // GPS Sensor	V_POSITION
const uint8_t S_WATER_QUALITY         = 39; // Water quality sensor	V_TEMP, V_PH, V_ORP, V_EC, V_STATUS

// SubTypes for MessageType M_SET
const uint8_t V_TEMP                  = 0;   // Temperature
const uint8_t V_HUM                   = 1;   // Humidity
const uint8_t V_STATUS                = 2;   // Binary status. 0=off 1=on
const uint8_t V_PERCENTAGE            = 3;   // Percentage value. 0-100 (%)
const uint8_t V_PRESSURE              = 4;   // Atmospheric Pressure
const uint8_t V_FORECAST              = 5;   // Weather forecast. One of "stable", "sunny", "cloudy", "unstable", "thunderstorm" or "unknown"
const uint8_t V_RAIN                  = 6;   // Amount of rain
const uint8_t V_RAINRATE              = 7;   // Rate of rain
const uint8_t V_WIND                  = 8;   // Windspeed
const uint8_t V_GUST                  = 9;   // Gust
const uint8_t V_DIRECTION             = 10;  // Wind direction
const uint8_t V_UV                    = 11;  // UV light level
const uint8_t V_WEIGHT                = 12;  // Weight (for scales etc)
const uint8_t V_DISTANCE              = 13;  // Distance
const uint8_t V_IMPEDANCE             = 14;  // Impedance value
const uint8_t V_ARMED                 = 15;  // Armed status of a security sensor. 1=Armed, 0=Bypassed
const uint8_t V_TRIPPED               = 16;  // Tripped status of a security sensor. 1=Tripped, 0=Untripped
const uint8_t V_WATT                  = 17;  // Watt value for power meters
const uint8_t V_KWH                   = 18;  // Accumulated number of KWH for a power meter
const uint8_t V_SCENE_ON              = 19;  // Turn on a scene
const uint8_t V_SCENE_OFF             = 20;  // Turn of a scene
const uint8_t V_HVAC_FLOW_STATE       = 21;  // Mode of header. One of "Off", "HeatOn", "CoolOn", or "AutoChangeOver"
const uint8_t V_HVAC_SPEED            = 22;  // HVAC/Heater fan speed ("Min", "Normal", "Max", "Auto")
const uint8_t V_LIGHT_LEVEL           = 23;  // Uncalibrated light level. 0-100%. Use V_LEVEL for light level in lux.
const uint8_t V_VAR1                  = 24;  // Custom value
const uint8_t V_VAR2                  = 25;  // Custom value
const uint8_t V_VAR3                  = 26;  // Custom value
const uint8_t V_VAR4                  = 27;  // Custom value
const uint8_t V_VAR5                  = 28;  // Custom value
const uint8_t V_UP                    = 29;  // Window covering. Up.
const uint8_t V_DOWN                  = 30;  // Window covering. Down.
const uint8_t V_STOP                  = 31;  // Window covering. Stop.
const uint8_t V_IR_SEND               = 32;  // Send out an IR-command
const uint8_t V_IR_RECEIVE            = 33;  // This message contains a received IR-command
const uint8_t V_FLOW                  = 34;  // Flow of water (in meter)
const uint8_t V_VOLUME                = 35;  // Water volume
const uint8_t V_LOCK_STATUS           = 36;  // Set or get lock status. 1=Locked, 0=Unlocked
const uint8_t V_LEVEL                 = 37;  // Used for sending level-value
const uint8_t V_VOLTAGE               = 38;  // Voltage level
const uint8_t V_CURRENT               = 39;  // Current level
const uint8_t V_RGB                   = 40;  // RGB value transmitted as ASCII hex string (I.e "ff0000" for red)
const uint8_t V_RGBW                  = 41;  // RGBW value transmitted as ASCII hex string (I.e "ff0000ff" for red + full white)
const uint8_t V_ID                    = 42;  // Optional unique sensor id (e.g. OneWire DS1820b ids)
const uint8_t V_UNIT_PREFIX           = 43;  // Allows sensors to send in a string representing the unit prefix to be displayed in GUI. This is not parsed by controller! E.g. cm, m, km, inch.
const uint8_t V_HVAC_SETPOINT_COOL    = 44;  // HVAC cold setpoint
const uint8_t V_HVAC_SETPOINT_HEAT    = 45;  // HVAC/Heater setpoint
const uint8_t V_HVAC_FLOW_MODE        = 46;  // Flow mode for HVAC ("Auto", "ContinuousOn", "PeriodicOn")
const uint8_t V_TEXT                  = 47;	// Text message to display on LCD or controller device	S_INFO
const uint8_t V_CUSTOM                = 48;	// Custom messages used for controller/inter node specific commands, preferably using S_CUSTOM device type.	S_CUSTOM
const uint8_t V_POSITION              = 49;	// GPS position and altitude. Payload: latitude;longitude;altitude(m). E.g. "55.722526;13.017972;18"	S_GPS
const uint8_t V_IR_RECORD	            = 50;	// Record IR codes S_IR for playback	S_IR
const uint8_t V_PH                    = 51;	// Water PH	S_WATER_QUALITY
const uint8_t V_ORP                   = 52;	// Water ORP : redox potential in mV	S_WATER_QUALITY
const uint8_t V_EC                    = 53;	// Water electric conductivity μS/cm (microSiemens/cm)	S_WATER_QUALITY
const uint8_t V_VAR                   = 54;	// Reactive power: volt-ampere reactive (var)	S_POWER
const uint8_t V_VA                    = 55;	// Apparent power: volt-ampere (VA)	S_POWER
const uint8_t V_POWER_FACTOR          = 56;// Ratio of real power to apparent power: floating point value in the range [-1,..,1]	S_POWER

// SubTypes for MessageType M_INTERNAL
const uint8_t I_BATTERY_LEVEL	         = 0;	 // Use this to report the battery level (in percent 0-100).
const uint8_t I_TIME	                 = 1;   // Sensors can request the current time from the Controller using this message. The time will be reported as the seconds since 1970
const uint8_t I_VERSION	               = 2;	 // Used to request gateway version from controller.
const uint8_t I_ID_REQUEST             = 3;	 // Use this to request a unique node id from the controller.
const uint8_t I_ID_RESPONSE	           = 4;	 // Id response back to node. Payload contains node id.
const uint8_t I_INCLUSION_MODE         = 5;	 // Start/stop inclusion mode of the Controller (1=start, 0=stop).
const uint8_t I_CONFIG	               = 6;   // Config request from node. Reply with (M)etric or (I)mperal back to sensor.
const uint8_t I_FIND_PARENT	           = 7;  // When a sensor starts up, it broadcast a search request to all neighbor nodes. They reply with a I_FIND_PARENT_RESPONSE.
const uint8_t I_FIND_PARENT_RESPONSE	 = 8;  // Reply message type to I_FIND_PARENT request.
const uint8_t I_LOG_MESSAGE	           = 9;	// Sent by the gateway to the Controller to trace-log a message
const uint8_t I_CHILDREN	             = 10; // A message that can be used to transfer child sensors (from EEPROM routing table) of a repeating node.
const uint8_t I_SKETCH_NAME	           = 11; // Optional sketch name that can be used to identify sensor in the Controller GUI
const uint8_t I_SKETCH_VERSION         = 12; // Optional sketch version that can be reported to keep track of the version of sensor in the Controller GUI.
const uint8_t I_REBOOT                 = 13; // Used by OTA firmware updates. Request for node to reboot.
const uint8_t I_GATEWAY_READY	         = 14; // Send by gateway to controller when startup is complete.
const uint8_t I_SIGNING_PRESENTATION   = 15; // Provides signing related preferences (first byte is preference version).
const uint8_t I_NONCE_REQUEST          = 16; // Used between sensors when requesting nonce.
const uint8_t I_NONCE_RESPONSE         = 17; // Used between sensors for nonce response.
const uint8_t I_HEARTBEAT_REQUEST      = 18; // Heartbeat request
const uint8_t I_PRESENTATION           = 19; // Presentation message
const uint8_t I_DISCOVER_REQUEST       = 20; // Discover request
const uint8_t I_DISCOVER_RESPONSE      = 21; // Discover response
const uint8_t I_HEARTBEAT_RESPONSE     = 22; // Heartbeat response
const uint8_t I_LOCKED                 = 23; // Node is locked (reason in string-payload)
const uint8_t I_PING                   = 24; // Ping sent to node, payload incremental hop counter
const uint8_t I_PONG                   = 25; // In return to ping, sent back to sender, payload incremental hop counter
const uint8_t I_REGISTRATION_REQUEST   = 26; // Register request to GW
const uint8_t I_REGISTRATION_RESPONSE	 = 27; // Register response from GW
const uint8_t I_DEBUG	                 = 28;// Debug message
const uint8_t I_SIGNAL_REPORT_REQUEST	 = 29;	//!< Device signal strength request
const uint8_t	I_SIGNAL_REPORT_REVERSE	 = 30;	//!< Internal
const uint8_t	I_SIGNAL_REPORT_RESPONSE = 31;	//!< Device signal strength response (RSSI)
#endif
