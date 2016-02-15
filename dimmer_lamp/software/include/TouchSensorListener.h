#ifndef TOUCHSENSORLISTENER_H
#define TOUCHSENSORLISTENER_H

enum event_type {SHORT_TAP_EVENT, LONG_TAP_EVENT, NO_EVENT};

class TouchSensorListener {
	public:
		virtual void tapEvent(event_type eventType) = 0;
};

#endif
