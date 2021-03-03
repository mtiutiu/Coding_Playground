#ifndef UTILS_H
#define UTILS_H

#include <Arduino.h>
#include "common.h"

namespace Utils {
  char* timeToString(char* string, size_t size) {
    uint32_t days = 0;
    uint32_t hours = 0;
    uint32_t mins = 0;
    uint32_t secs = 0;

    secs = millis() / 1000; // set the seconds remaining
    mins = secs / 60; //convert seconds to minutes
    hours = mins / 60; //convert minutes to hours
    days = hours / 24; //convert hours to days
    secs = secs - (mins * 60); //subtract the coverted seconds to minutes in order to display 59 secs max
    mins = mins - (hours * 60); //subtract the coverted minutes to hours in order to display 59 minutes max
    hours = hours - (days * 24); //subtract the coverted hours to days in order to display 23 hours max

    snprintf(string, size, "%dd, %dh, %dm, %ds", days, hours, mins, secs);
    return string;
  }
}

#endif
