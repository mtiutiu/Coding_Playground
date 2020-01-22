#include <device.h>
#include <drivers/gpio.h>
#include "relays_logic.h"
#include "ts_buttons_logic.h"
#include "mesh_logic.h"


#define OFF 0
#define ON  1

static struct device *port0;
static uint8_t ch1_state;
static uint8_t coil_pin;


static void relay1_pulse_timeout(struct k_timer *tim);
K_TIMER_DEFINE(relay1_pulse_timer, relay1_pulse_timeout, NULL);

static void relay1_pulse_timeout(struct k_timer *tim) {
  gpio_pin_write(port0, coil_pin, LOW);
}

uint8_t get_ch1_relay_state(void) {
  return ch1_state;
}

void set_ch1_relay_state(uint8_t new_state) {
  ch1_state = new_state;
  coil_pin = (ch1_state == ON) ? RELAY1_SET_PIN : RELAY1_RESET_PIN;

  gpio_pin_write(port0, coil_pin, HIGH);
  k_timer_start(&relay1_pulse_timer, K_MSEC(RELAY_TRIGGER_PULSE_DURATION_MS), 0);
  gpio_pin_write(port0, S1_LED_PIN, !ch1_state);
  mesh_publish_state(LIGHT_CHANNEL_1_INDEX, ch1_state);
}

void ch1_relay_toggle(void) {
  ch1_state = !ch1_state;

  set_ch1_relay_state(ch1_state);
}

void init_relays_gpio(void) {
  port0 = device_get_binding("GPIO_0");

  // Channel 1 relay
  gpio_pin_configure(port0, RELAY1_SET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, RELAY1_SET_PIN, LOW);
  gpio_pin_configure(port0, RELAY1_RESET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, RELAY1_RESET_PIN, LOW);
}
