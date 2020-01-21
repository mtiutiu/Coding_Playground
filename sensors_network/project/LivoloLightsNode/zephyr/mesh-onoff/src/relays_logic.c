#include <drivers/gpio.h>
#include "relays_logic.h"
#include "ts_buttons_logic.h"
#include "mesh_logic.h"


static uint8_t ch1_state;

static void relay_pulse_timeout(struct k_timer *tim);
K_TIMER_DEFINE(relay_pulse_timer, relay_pulse_timeout, NULL);


static void relay_pulse_timeout(struct k_timer *tim) {

}

uint8_t get_ch1_relay_state(void) {
  return ch1_state;
}

void set_ch1_relay_state(uint8_t new_state) {
  ch1_state = new_state;
  gpio_pin_write(port0, S1_LED_PIN, !ch1_state);
}

void ch1_relay_toggle(void) {
  ch1_state = !ch1_state;

  gpio_pin_write(port0, S1_LED_PIN, !ch1_state);
  mesh_publish_state(ch1_state);
}
