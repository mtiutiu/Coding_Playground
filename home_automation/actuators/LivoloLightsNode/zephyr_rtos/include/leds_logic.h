#ifndef LEDS_LOGIC_H
#define LEDS_LOGIC_H

#include <stdint.h>


void init_leds(void);
void set_led_state(uint8_t channel, uint8_t state);

#endif
