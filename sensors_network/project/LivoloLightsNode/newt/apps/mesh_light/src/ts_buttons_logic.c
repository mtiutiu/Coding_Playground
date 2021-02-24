#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include <bsp/bsp.h>
#include <hal/hal_gpio.h>
#include <os/mynewt.h>
#include <mesh/mesh.h>

#define LOW  0
#define HIGH 1

#define MSEC_TO_USEC(interval) (interval * 1000)

#define BUTTON_DEBOUNCE_INTERVAL_MS 800
#define BUTTON_LONG_PRESS_INTERVAL_MS 5000
#define MESH_RESET_TIMEOUT_S  3

static struct os_callout mesh_reset_timer;

static uint8_t light_channel_idx[LIGHT_CHANNELS] = {
  LIGHT_CHANNEL_1_INDEX,
#if LIGHT_CHANNELS == 2
  LIGHT_CHANNEL_2_INDEX
#endif
};

static uint16_t TS_PINS[LIGHT_CHANNELS] = {
  TS1_PIN,
#if LIGHT_CHANNELS == 2
  TS2_PIN
#endif
};

static void mesh_reset_timer_cb(struct os_event *ev) {
  bt_mesh_reset();
}

static void btn_handler(void *arg) {
  uint8_t *channel = (uint8_t *)arg;
  static uint64_t last_press_timestamp;

  // when the button is touched (pressed) we toggle the relay using some simple debouncing
  // also we store the timestamp for computing the touch (press) interval later
  if (hal_gpio_read(TS_PINS[*channel]) == LOW &&
        (os_get_uptime_usec() - last_press_timestamp) >= MSEC_TO_USEC(BUTTON_DEBOUNCE_INTERVAL_MS)) {
    relay_toggle(*channel);
    last_press_timestamp = os_get_uptime_usec();
  }

  // when the button is not touched (released) we can compute for how long it was in this state
  // in this case we use this information for resetting the provisioning state of this node
  if (hal_gpio_read(TS_PINS[*channel]) == HIGH &&
        (os_get_uptime_usec() - last_press_timestamp) >= MSEC_TO_USEC(BUTTON_LONG_PRESS_INTERVAL_MS)) {
    // bt_mesh_reset() doesn't work when called inside an interrupt handler
    // we call it later using a os timer
    os_callout_init(&mesh_reset_timer, os_eventq_dflt_get(), mesh_reset_timer_cb, NULL);
    os_callout_reset(&mesh_reset_timer, MESH_RESET_TIMEOUT_S);
  }
}

void init_ts(void) {
  // Touch sensor reading
  for (uint8_t i = 0; i < LIGHT_CHANNELS; i++) {
    hal_gpio_irq_init(TS_PINS[i], btn_handler, &light_channel_idx[i], HAL_GPIO_TRIG_BOTH, HAL_GPIO_PULL_NONE);
    hal_gpio_irq_enable(TS_PINS[i]);
  }
}
