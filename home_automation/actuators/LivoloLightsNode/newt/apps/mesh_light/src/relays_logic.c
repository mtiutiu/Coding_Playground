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

#define RELAY_INIT_TIMEOUT_S (3 * OS_TICKS_PER_SEC)
#define RELAY_TRIGGER_PULSE_DURATION_MS 20

#define RELAY_COIL_COUNT 2


static uint8_t COILS_CFG[LIGHT_CHANNELS][RELAY_COIL_COUNT] = {
  { RELAY1_RESET_PIN, RELAY1_SET_PIN },
#if LIGHT_CHANNELS == 2
  { RELAY2_RESET_PIN, RELAY2_SET_PIN }
#endif
};

static uint8_t ch_state[LIGHT_CHANNELS];


static void relay1_pulse_timeout_cb(struct os_event *);
#if LIGHT_CHANNELS == 2
static void relay2_pulse_timeout_cb(struct os_event *);
#endif

typedef void (*timer_cb)(struct os_event *);

static struct os_callout relay_startup_timer;
static struct os_callout relay_pulse_timer[LIGHT_CHANNELS];

static timer_cb relay_timer_cb[LIGHT_CHANNELS] = {
  relay1_pulse_timeout_cb,
#if LIGHT_CHANNELS == 2
  relay2_pulse_timeout_cb
#endif
};

// not very clean implementation here... but we need separate handlers to avoid concurrency issues
static void relay1_pulse_timeout_cb(struct os_event *ev) {
  uint8_t new_state = ch_state[LIGHT_CHANNEL_1_INDEX];

  hal_gpio_write(COILS_CFG[LIGHT_CHANNEL_1_INDEX][new_state], LOW);

  set_led_state(LIGHT_CHANNEL_1_INDEX, new_state);
  mesh_publish_state(LIGHT_CHANNEL_1_INDEX, new_state);
}

#if LIGHT_CHANNELS == 2
static void relay2_pulse_timeout_cb(struct os_event *ev) {
  uint8_t new_state = ch_state[LIGHT_CHANNEL_2_INDEX];

  hal_gpio_write(COILS_CFG[LIGHT_CHANNEL_2_INDEX][new_state], LOW);

  set_led_state(LIGHT_CHANNEL_2_INDEX, new_state);
  mesh_publish_state(LIGHT_CHANNEL_2_INDEX, new_state);
}
#endif

uint8_t get_relay_state(uint8_t channel) {
  return ch_state[channel];
}

void set_relay_state(uint8_t channel, uint8_t new_state, bool force) {
  if (!force && (ch_state[channel] == new_state)) {
    return;
  }

  ch_state[channel] = new_state;

  hal_gpio_write(COILS_CFG[channel][new_state], HIGH);
  os_callout_reset(&relay_pulse_timer[channel], os_time_ms_to_ticks32(RELAY_TRIGGER_PULSE_DURATION_MS));
}

void relay_toggle(uint8_t channel) {
  set_relay_state(channel, !get_relay_state(channel), false);
}

static void relay_init_timeout_cb(struct os_event *ev) {
#ifdef VSENSE_PIN
  uint8_t switch_state = hal_gpio_read(VSENSE_PIN);
#endif

#ifdef VSENSE_PIN
  if (switch_state == ON) {
#endif
    for (uint8_t i = 0; i < LIGHT_CHANNELS; i++) {
      set_relay_state(i, OFF, true);
    }
#ifdef VSENSE_PIN
  }
#endif
}

void init_relays(void) {
  for (uint8_t i = 0; i < LIGHT_CHANNELS; i++) {
    for (uint8_t j = 0; j < RELAY_COIL_COUNT; j++) {
      hal_gpio_init_out(COILS_CFG[i][j], LOW);
    }
  }

#ifdef VSENSE_PIN
  hal_gpio_init_in(VSENSE_PIN, HAL_GPIO_PULL_NONE);
#endif

  os_callout_init(&relay_startup_timer, os_eventq_dflt_get(), relay_init_timeout_cb, NULL);
  for (uint8_t i = 0; i < LIGHT_CHANNELS; i++) {
    os_callout_init(&relay_pulse_timer[i], os_eventq_dflt_get(), relay_timer_cb[i], NULL);
  }

  // reset relays to the OFF state after some time when system starts
  os_callout_reset(&relay_startup_timer, RELAY_INIT_TIMEOUT_S);
}
