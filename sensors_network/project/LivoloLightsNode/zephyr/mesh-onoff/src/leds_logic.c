#include <device.h>
#include <drivers/gpio.h>
#include "leds_logic.h"
#include "node_conf.h"

#define LOW 0
#define HIGH 1

static uint8_t LED_PINS[LIGHT_CHANNELS] = {
  S1_LED_PIN,
#if LIGHT_CHANNELS == 2
  S2_LED_PIN
#endif
};

static struct device *led_port;

void set_led_state(uint8_t channel) {
  gpio_pin_write(led_port, LED_PINS[channel], !channel);
}

void init_leds(void) {
  led_port = device_get_binding("GPIO_0");

  gpio_pin_configure(led_port, S1_LED_PIN, GPIO_DIR_OUT);
  gpio_pin_write(led_port, S1_LED_PIN, HIGH);

#if LIGHT_CHANNELS == 2
  gpio_pin_configure(led_port, S2_LED_PIN, GPIO_DIR_OUT);
  gpio_pin_write(led_port, S2_LED_PIN, HIGH);
#endif
}
