#!/usr/bin/env python3

# Message Types
M_PRESENTATION    = 0  # Sent by a node when they present attached sensors. This is usually done in setup() at startup.
M_SET             = 1  # This message is sent from or to a sensor when a sensor value should be updated
M_REQ             = 2  # Requests a variable value (usually from an actuator destined for controller).
M_INTERNAL        = 3  # This is a special internal message. See table below for the details
M_STREAM          = 4  # Used for OTA firmware updates

# SubTypes for MessageType M_PRESENTATION #
S_DOOR                  = 0	  # Door and window sensors	V_TRIPPED, V_ARMED
S_MOTION	              = 1	  # Motion sensors	V_TRIPPED, V_ARMED
S_SMOKE	                = 2	  # Smoke sensor	V_TRIPPED, V_ARMED
S_BINARY                = 3	  # Binary device (on/off)	V_STATUS, V_WATT
S_DIMMER                = 4   # Dimmable device of some kind	V_STATUS (on/off), V_PERCENTAGE (dimmer level 0-100), V_WATT
S_COVER	                = 5	  # Window covers or shades	V_UP, V_DOWN, V_STOP, V_PERCENTAGE
S_TEMP                  = 6	  # Temperature sensor	V_TEMP, V_ID
S_HUM	                  = 7	  # Humidity sensor	V_HUM
S_BARO                  = 8	  # Barometer sensor (Pressure)	V_PRESSURE, V_FORECAST
S_WIND                  = 9	  # Wind sensor	V_WIND, V_GUST, V_DIRECTION
S_RAIN	                = 10  # Rain sensor	V_RAIN, V_RAINRATE
S_UV                    = 11  # UV sensor	V_UV
S_WEIGHT                = 12  # Weight sensor for scales etc.	V_WEIGHT, V_IMPEDANCE
S_POWER	                = 13  # Power measuring device, like power meters	V_WATT, V_KWH, V_VAR, V_VA, V_POWER_FACTOR
S_HEATER                = 14  #	Heater device	V_HVAC_SETPOINT_HEAT, V_HVAC_FLOW_STATE, V_TEMP, V_STATUS
S_DISTANCE              = 15  # Distance sensor	V_DISTANCE, V_UNIT_PREFIX
S_LIGHT_LEVEL           = 16  # Light sensor	V_LIGHT_LEVEL (uncalibrated percentage), V_LEVEL (light level in lux)
S_ARDUINO_NODE          = 17  # Arduino node device
S_ARDUINO_REPEATER_NODE	= 18  # Arduino repeating node device
S_LOCK                  = 19  # Lock device	V_LOCK_STATUS
S_IR                    = 20  # Ir sender/receiver device	V_IR_SEND, V_IR_RECEIVE, V_IR_RECORD
S_WATER                 = 21  # Water meter	V_FLOW, V_VOLUME
S_AIR_QUALITY           = 22  # Air quality sensor e.g. MQ-2	V_LEVEL, V_UNIT_PREFIX
S_CUSTOM                = 23  # Use this for custom sensors where no other fits.
S_DUST                  = 24  # Dust level sensor	V_LEVEL, V_UNIT_PREFIX
S_SCENE_CONTROLLER      = 25  # Scene controller device	V_SCENE_ON, V_SCENE_OFF
S_RGB_LIGHT             = 26  # RGB light	V_RGB, V_WATT
S_RGBW_LIGHT            = 27  # RGBW light (with separate white component)	V_RGBW, V_WATT
S_COLOR_SENSOR          = 28  # Color sensor	V_RGB
S_HVAC                  = 29  # Thermostat/HVAC device	V_STATUS, V_TEMP, V_HVAC_SETPOINT_HEAT, V_HVAC_SETPOINT_COOL, V_HVAC_FLOW_STATE, V_HVAC_FLOW_MODE, V_HVAC_SPEED
S_MULTIMETER            = 30  # Multimeter device	V_VOLTAGE, V_CURRENT, V_IMPEDANCE
S_SPRINKLER             = 31  # Sprinkler device	V_STATUS (turn on/off), V_TRIPPED (if fire detecting device)
S_WATER_LEAK            = 32  # Water leak sensor	V_TRIPPED, V_ARMED
S_SOUND                 = 33  # Sound sensor	V_LEVEL (in dB), V_TRIPPED, V_ARMED
S_VIBRATION             = 34  # Vibration sensor	V_LEVEL (vibration in Hz), V_TRIPPED, V_ARMED
S_MOISTURE              = 35  # Moisture sensor	V_LEVEL (water content or moisture in percentage?), V_TRIPPED, V_ARMED
S_INFO                  = 36  # LCD text device	V_TEXT
S_GAS                   = 37  # Gas meter	V_FLOW, V_VOLUME
S_GPS                   = 38  # GPS Sensor	V_POSITION
S_WATER_QUALITY         = 39  # Water quality sensor	V_TEMP, V_PH, V_ORP, V_EC, V_STATUS


# SubTypes for MessageType M_SET #
V_TEMP                  = 0   # Temperature
V_HUM                   = 1   # Humidity
V_STATUS                = 2   # Binary status. 0=off 1=on
V_PERCENTAGE            = 3   # Percentage value. 0-100 (%)
V_PRESSURE              = 4   # Atmospheric Pressure
V_FORECAST              = 5   # Weather forecast. One of "stable", "sunny", "cloudy", "unstable", "thunderstorm" or "unknown"
V_RAIN                  = 6   # Amount of rain
V_RAINRATE              = 7   # Rate of rain
V_WIND                  = 8   # Windspeed
V_GUST                  = 9   # Gust
V_DIRECTION             = 10  # Wind direction
V_UV                    = 11  # UV light level
V_WEIGHT                = 12  # Weight (for scales etc)
V_DISTANCE              = 13  # Distance
V_IMPEDANCE             = 14  # Impedance value
V_ARMED                 = 15  # Armed status of a security sensor. 1=Armed, 0=Bypassed
V_TRIPPED               = 16  # Tripped status of a security sensor. 1=Tripped, 0=Untripped
V_WATT                  = 17  # Watt value for power meters
V_KWH                   = 18  # Accumulated number of KWH for a power meter
V_SCENE_ON              = 19  # Turn on a scene
V_SCENE_OFF             = 20  # Turn of a scene
V_HVAC_FLOW_STATE       = 21  # Mode of header. One of "Off", "HeatOn", "CoolOn", or "AutoChangeOver"
V_HVAC_SPEED            = 22  # HVAC/Heater fan speed ("Min", "Normal", "Max", "Auto")
V_LIGHT_LEVEL           = 23  # Uncalibrated light level. 0-100%. Use V_LEVEL for light level in lux.
V_VAR1                  = 24  # Custom value
V_VAR2                  = 25  # Custom value
V_VAR3                  = 26  # Custom value
V_VAR4                  = 27  # Custom value
V_VAR5                  = 28  # Custom value
V_UP                    = 29  # Window covering. Up.
V_DOWN                  = 30  # Window covering. Down.
V_STOP                  = 31  # Window covering. Stop.
V_IR_SEND               = 32  # Send out an IR-command
V_IR_RECEIVE            = 33  # This message contains a received IR-command
V_FLOW                  = 34  # Flow of water (in meter)
V_VOLUME                = 35  # Water volume
V_LOCK_STATUS           = 36  # Set or get lock status. 1=Locked, 0=Unlocked
V_LEVEL                 = 37  # Used for sending level-value
V_VOLTAGE               = 38  # Voltage level
V_CURRENT               = 39  # Current level
V_RGB                   = 40  # RGB value transmitted as ASCII hex string (I.e "ff0000" for red)
V_RGBW                  = 41  # RGBW value transmitted as ASCII hex string (I.e "ff0000ff" for red + full white)
V_ID                    = 42  # Optional unique sensor id (e.g. OneWire DS1820b ids)
V_UNIT_PREFIX           = 43  # Allows sensors to send in a string representing the unit prefix to be displayed in GUI. This is not parsed by controller! E.g. cm, m, km, inch.
V_HVAC_SETPOINT_COOL    = 44  # HVAC cold setpoint
V_HVAC_SETPOINT_HEAT    = 45  # HVAC/Heater setpoint
V_HVAC_FLOW_MODE        = 46  # Flow mode for HVAC ("Auto", "ContinuousOn", "PeriodicOn")
V_TEXT                  = 47	# Text message to display on LCD or controller device	S_INFO
V_CUSTOM                = 48	# Custom messages used for controller/inter node specific commands, preferably using S_CUSTOM device type.	S_CUSTOM
V_POSITION              = 49	# GPS position and altitude. Payload: latitude;longitude;altitude(m). E.g. "55.722526;13.017972;18"	S_GPS
V_IR_RECORD	            = 50	# Record IR codes S_IR for playback	S_IR
V_PH                    = 51	# Water PH	S_WATER_QUALITY
V_ORP                   = 52	# Water ORP : redox potential in mV	S_WATER_QUALITY
V_EC                    = 53	# Water electric conductivity μS/cm (microSiemens/cm)	S_WATER_QUALITY
V_VAR                   = 54	# Reactive power: volt-ampere reactive (var)	S_POWER
V_VA                    = 55	# Apparent power: volt-ampere (VA)	S_POWER
V_POWER_FACTOR          = 56	# Ratio of real power to apparent power: floating point value in the range [-1,..,1]	S_POWER

# SubTypes for MessageType M_INTERNAL #
I_BATTERY_LEVEL	        = 0	 # Use this to report the battery level (in percent 0-100).
I_TIME	                = 1	 # Sensors can request the current time from the Controller using this message. The time will be reported as the seconds since 1970
I_VERSION	              = 2	 # Used to request gateway version from controller.
I_ID_REQUEST            = 3	 # Use this to request a unique node id from the controller.
I_ID_RESPONSE	          = 4	 # Id response back to node. Payload contains node id.
I_INCLUSION_MODE        = 5	 # Start/stop inclusion mode of the Controller (1=start, 0=stop).
I_CONFIG	              = 6  # Config request from node. Reply with (M)etric or (I)mperal back to sensor.
I_FIND_PARENT	          = 7	 # When a sensor starts up, it broadcast a search request to all neighbor nodes. They reply with a I_FIND_PARENT_RESPONSE.
I_FIND_PARENT_RESPONSE	= 8	 # Reply message type to I_FIND_PARENT request.
I_LOG_MESSAGE	          = 9	 # Sent by the gateway to the Controller to trace-log a message
I_CHILDREN	            = 10 # A message that can be used to transfer child sensors (from EEPROM routing table) of a repeating node.
I_SKETCH_NAME	          = 11 # Optional sketch name that can be used to identify sensor in the Controller GUI
I_SKETCH_VERSION        = 12 # Optional sketch version that can be reported to keep track of the version of sensor in the Controller GUI.
I_REBOOT                = 13 # Used by OTA firmware updates. Request for node to reboot.
I_GATEWAY_READY	        = 14 # Send by gateway to controller when startup is complete.
I_SIGNING_PRESENTATION  = 15 # Provides signing related preferences (first byte is preference version).
I_NONCE_REQUEST         = 16 # Used between sensors when requesting nonce.
I_NONCE_RESPONSE        = 17 # Used between sensors for nonce response.
I_HEARTBEAT_REQUEST     = 18 # Heartbeat request
I_PRESENTATION          = 19 # Presentation message
I_DISCOVER_REQUEST      = 20 # Discover request
I_DISCOVER_RESPONSE     = 21 # Discover response
I_HEARTBEAT_RESPONSE    = 22 # Heartbeat response
I_LOCKED                = 23 # Node is locked (reason in string-payload)
I_PING                  = 24 # Ping sent to node, payload incremental hop counter
I_PONG                  = 25 # In return to ping, sent back to sender, payload incremental hop counter
I_REGISTRATION_REQUEST  = 26 # Register request to GW
I_REGISTRATION_RESPONSE	= 27 # Register response from GW
I_DEBUG	                = 28 # Debug message
