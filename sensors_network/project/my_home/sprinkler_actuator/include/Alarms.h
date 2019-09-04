#ifndef ALARAMS_H
#define ALARAMS_H

#include <TimeAlarms.h>


namespace Alarms {

  void init() {
    Alarm.alarmRepeat(10, 25, 0, []() {
      DEBUG_OUTPUT.println(F("Test alarm ..."));
    });
  }

  void loop() {
    Alarm.delay(0);
  }
}

#endif
