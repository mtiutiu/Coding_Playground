#ifndef TS_BUTTONS_LOGIC_H
#define TS_BUTTONS_LOGIC_H

#define LOW   0
#define HIGH  1

// module GPIO defs
#define S1_LED_PIN 8
#define TS1_PIN 29
#define MTSA_PIN 28
#define MTPM_PIN 30

#define PWM_DUTY_CYCLE_PERCENT (30U)
#define PWM_FREQUENCY_HZ (100000U)
#define PWM_PERIOD_USEC (1000000U / PWM_FREQUENCY_HZ)
#define PWM_PULSE_US (PWM_PERIOD_USEC * PWM_DUTY_CYCLE_PERCENT) / 100U

#define BUTTON_DEBOUNCE_INTERVAL_MS 250

extern struct device *port0;

void init_ts_gpio(void);

#endif
