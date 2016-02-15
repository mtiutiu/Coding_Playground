#ifndef IRSENSORRECVLISTENER_H
#define IRSENSORRECVLISTENER_H

enum KeyEventType { SHORT_KEYPRESS_EVENT,
		    LONG_KEYPRESS_EVENT, 
		    NO_KEYPRESS_EVENT 
		   };
				  
// these key codes are for sANYO remote control
enum KeyCode { KEY_CH1 = 0x772BC403, 
	       KEY_CH2 = 0xEAF0453D,
	       KEY_CH3 = 0x8F0D4ADF,
	       KEY_POWER_ON_OFF = 0x438E0879,
	       //KEY_POWER_ON = 0x438E0879,
	       KEY_NOKEY = 0x00000000
	      };

class IRSensorRecvListener {
	public:
		virtual void irSensorRecvEvent(KeyEventType keyEventType, uint32_t keyCode) = 0;
};

#endif
