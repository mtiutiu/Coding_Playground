#include <stdint.h>
#include <device.h>
#include <drivers/gpio.h>
#include "relays_logic.h"
#include "leds_logic.h"
#include "mesh_logic.h"
#include "node_conf.h"


#define OFF 0
#define ON  1

#define LOW  0
#define HIGH 1

static struct device *relay_port;
static uint8_t coil_pin;
static uint8_t ch_state[LIGHT_CHANNELS];

static uint8_t RELAY_COIL[][2] = {
  { RELAY1_SET_PIN, RELAY1_RESET_PIN },
#if LIGHT_CHANNELS == 2
  { RELAY2_SET_PIN, RELAY2_RESET_PIN }
#endif
};

static void relay_pulse_timeout(struct k_timer *tim);
K_TIMER_DEFINE(relay_pulse_timer, relay_pulse_timeout, NULL);

static void relay_init_timeout(struct k_timer *tim);
K_TIMER_DEFINE(relay_startup_timer, relay_init_timeout, NULL);


static void relay_init_timeout(struct k_timer *tim) {
  set_relay_state(LIGHT_CHANNEL_1_INDEX, OFF);
#if LIGHT_CHANNELS == 2
  set_relay_state(LIGHT_CHANNEL_2_INDEX, OFF);
#endif
}

static void relay_pulse_timeout(struct k_timer *tim) {
  gpio_pin_write(relay_port, coil_pin, LOW);
}

uint8_t get_relay_state(uint8_t channel) {
  return ch_state[channel];
}

void set_relay_state(uint8_t channel, uint8_t new_state) {
  ch_state[channel] = new_state;
  coil_pin = RELAY_COIL[channel][new_state];

  gpio_pin_write(relay_port, coil_pin, HIGH);
  k_timer_start(&relay_pulse_timer, K_MSEC(RELAY_TRIGGER_PULSE_DURATION_MS), 0);
  set_led_state(new_state);
  mesh_publish_state(channel, ch_state[channel]);
}

void relay_toggle(uint8_t channel) {
  ch_state[channel] = !ch_state[channel];

  set_relay_state(channel, ch_state[channel]);
}

void init_relays(void) {
  relay_port = device_get_binding("GPIO_0");

  // Channel 1 relay coils
  gpio_pin_configure(relay_port, RELAY1_SET_PIN, GPIO_DIR_OUT);
  gpio_pin_configure(relay_port, RELAY1_RESET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(relay_port, RELAY1_SET_PIN, LOW);
  gpio_pin_write(relay_port, RELAY1_RESET_PIN, LOW);

#if LIGHT_CHANNELS == 2
  // Channel 2 relay coils
  gpio_pin_configure(relay_port, RELAY2_SET_PIN, GPIO_DIR_OUT);
  gpio_pin_configure(relay_port, RELAY2_RESET_PIN, GPIO_DIR_OUT);
  gpio_pin_write(relay_port, RELAY2_SET_PIN, LOW);
  gpio_pin_write(relay_port, RELAY2_RESET_PIN, LOW);
#endif

  // reset relays to the OFF state after some time when system starts
  k_timer_start(&relay_startup_timer, K_MSEC(RELAY_INIT_TIMEOUT_MS), 0);
}
