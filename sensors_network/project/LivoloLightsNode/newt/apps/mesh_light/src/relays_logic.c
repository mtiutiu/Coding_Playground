#include "relays_logic.h"
#include "leds_logic.h"
#include "mesh_logic.h"
#include <bsp/bsp.h>
#include <hal/hal_gpio.h>
#include <os/mynewt.h>

#define OFF 0
#define ON  1

#define LOW  0
#define HIGH 1

#define RELAY_INIT_TIMEOUT_S (5 * OS_TICKS_PER_SEC)
#define RELAY_TRIGGER_PULSE_DURATION_MS 20


static uint8_t coil_pin;
static uint8_t ch_state[LIGHT_CHANNELS];

static uint8_t RELAY_COIL[][2] = {
  { RELAY1_RESET_PIN, RELAY1_SET_PIN },
#if LIGHT_CHANNELS == 2
  { RELAY2_RESET_PIN, RELAY2_SET_PIN }
#endif
};

static struct os_callout relay_startup_timer;
static struct os_callout relay_pulse_timer;


static void relay_pulse_timeout_cb(struct os_event *ev) {
  hal_gpio_write(coil_pin, LOW);
}

uint8_t get_relay_state(uint8_t channel) {
  return ch_state[channel];
}

void set_relay_state(uint8_t channel, uint8_t new_state) {
  ch_state[channel] = new_state;
  coil_pin = RELAY_COIL[channel][new_state];

  hal_gpio_write(coil_pin, HIGH);
  os_callout_reset(&relay_pulse_timer, os_time_ms_to_ticks32(RELAY_TRIGGER_PULSE_DURATION_MS));
  set_led_state(channel, new_state);
  mesh_publish_state(channel, ch_state[channel]);
}

void relay_toggle(uint8_t channel) {
  ch_state[channel] = !ch_state[channel];

  set_relay_state(channel, ch_state[channel]);
}

static void relay_init_timeout_cb(struct os_event *ev) {
#ifdef VSENSE_PIN
      uint32_t switch_state = hal_gpio_read(VSENSE_PIN);
#endif

#ifdef VSENSE_PIN
  if (switch_state == ON) {
#endif
    set_relay_state(LIGHT_CHANNEL_1_INDEX, OFF);
#if LIGHT_CHANNELS == 2
    set_relay_state(LIGHT_CHANNEL_2_INDEX, OFF);
#endif
#ifdef VSENSE_PIN
  }
#endif
}

void init_relays(void) {
  // Channel 1 relay coils
  hal_gpio_init_out(RELAY1_SET_PIN, LOW);
  hal_gpio_init_out(RELAY1_RESET_PIN, LOW);

#if LIGHT_CHANNELS == 2
  // Channel 2 relay coils
  hal_gpio_init_out(RELAY2_SET_PIN, LOW);
  hal_gpio_init_out(RELAY2_RESET_PIN, LOW);
#endif

#ifdef VSENSE_PIN
  hal_gpio_init_in(VSENSE_PIN, HAL_GPIO_PULL_NONE);
#endif

  os_callout_init(&relay_startup_timer, os_eventq_dflt_get(), relay_init_timeout_cb, NULL);
  os_callout_init(&relay_pulse_timer, os_eventq_dflt_get(), relay_pulse_timeout_cb, NULL);

  // reset relays to the OFF state after some time when system starts
  os_callout_reset(&relay_startup_timer, RELAY_INIT_TIMEOUT_S);
}
