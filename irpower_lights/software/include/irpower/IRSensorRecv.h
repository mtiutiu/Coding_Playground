#ifndef IRSENSORRECV_H
#define IRSENSORRECV_H

#include <Arduino.h>
#include <IRremote.h>
#include <MsTimer2.h>
#include "Constants.h"
#include "IRSensorRecvListener.h"

class IRSensorRecv {
	public:
		IRSensorRecv(const uint8_t irSensorRecvPin);
		~IRSensorRecv();
		void addEventListener(IRSensorRecvListener* irSensorRecvListener);
		void removeEventListener();
		void poll();
		
	private:
		IRrecv* _irReceiver;
		decode_results* _irDecodeResults;
		KeyEventType _keyEventType;
		uint32_t _keyCode;
		IRSensorRecvListener* _irSensorRecvListener;
		uint32_t readIRSensorRecvData();
		void checkIRSensorRecvState();
		void fireEvents();
		static void irRecvDatasampler();
		static bool _itsSampleTime;
};

#endif
