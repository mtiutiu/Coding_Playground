#include "leds_logic.h"
#include <bsp/bsp.h>
#include <hal/hal_gpio.h>
#include <os/mynewt.h>

#define LOW 0
#define HIGH 1

static uint8_t LED_PINS[LIGHT_CHANNELS] = {
  S1_LED_PIN,
#if LIGHT_CHANNELS == 2
  S2_LED_PIN
#endif
};

void set_led_state(uint8_t channel, uint8_t state) {
  hal_gpio_write(LED_PINS[channel], !state);
}

void init_leds(void) {
  hal_gpio_init_out(S1_LED_PIN, HIGH);

#if LIGHT_CHANNELS == 2
  hal_gpio_init_out(S2_LED_PIN, HIGH);
#endif
}
