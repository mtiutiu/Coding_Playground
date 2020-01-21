#include <device.h>
#include <drivers/gpio.h>
#include "relays_logic.h"
#include "ts_buttons_logic.h"
#include "mesh_logic.h"


static struct device *port0;
static uint8_t ch1_state;

static void relay1_pulse_timeout(struct k_timer *tim);
K_TIMER_DEFINE(relay1_pulse_timer, relay1_pulse_timeout, NULL);

static void relay1_pulse_timeout(struct k_timer *tim) {
  uint8_t coil_pin = *((uint8_t*)tim->user_data);

  gpio_pin_write(port0, coil_pin, LOW);
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

  gpio_pin_write(port0, RELAY1_SET_PIN, HIGH);
  relay1_pulse_timer.user_data = RELAY1_SET_PIN;
  k_timer_start(&relay1_pulse_timer, K_MSEC(20), 0);

  mesh_publish_state(LIGHT_CHANNEL_1_INDEX, ch1_state);

}

void init_relays_gpio(void) {
  port0 = device_get_binding("GPIO_0");

  // Channel 1 relay
  gpio_pin_configure(port0, RELAY1_SET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, RELAY1_SET_PIN, LOW);
  gpio_pin_configure(port0, RELAY1_RESET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, RELAY1_RESET_PIN, LOW);
}
