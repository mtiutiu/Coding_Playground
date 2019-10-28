#ifndef APP_PWM_H
#define APP_PWM_H

#include "bsp/bsp.h"
#include "pwm/pwm.h"

void init_app_pwm0_dev(void);
void set_pwm0_duty_cycle_perc(uint8_t percent);

#endif