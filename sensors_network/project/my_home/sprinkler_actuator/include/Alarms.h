#ifndef ALARAMS_H
#define ALARAMS_H

#include <TimeAlarms.h>

namespace Alarms {

  void init() {
    Alarm.alarmRepeat(1, 28, 0, []() {
      DEBUG_OUTPUT.println(F("Test alarm ..."));
    });
    Alarm.timerRepeat(5, []() {
      DEBUG_OUTPUT.println(F("Test 5s timer alarm ..."));
    });
  }

  void loop() {
    Alarm.delay(1000);
  }
}

#endif
