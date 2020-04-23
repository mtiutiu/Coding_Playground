#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include <bsp/bsp.h>
#include <hal/hal_gpio.h>
#include <os/mynewt.h>

#define LOW  0
#define HIGH 1

#define MSEC_TO_USEC(interval) (interval * 1000)

#define BUTTON_DEBOUNCE_INTERVAL_MS 800

static uint8_t light_channel_idx[LIGHT_CHANNELS] = {
  LIGHT_CHANNEL_1_INDEX,
#if LIGHT_CHANNELS == 2
  LIGHT_CHANNEL_2_INDEX
#endif
};

uint16_t TS_PINS[LIGHT_CHANNELS] = {
  TS1_PIN,
#if LIGHT_CHANNELS == 2
  TS2_PIN
#endif
};

static void btn_handler(void *arg) {
  uint8_t *channel = (uint8_t *)arg;
  static uint64_t last_press_timestamp;

  // simple debouncing
  if ((os_get_uptime_usec() - last_press_timestamp) >= MSEC_TO_USEC(BUTTON_DEBOUNCE_INTERVAL_MS)) {
    relay_toggle(*channel);
    last_press_timestamp = os_get_uptime_usec();
  }
}

void init_ts(void) {
  // Touch sensor reading
  for (uint8_t i = 0; i < LIGHT_CHANNELS; i++) {
    hal_gpio_irq_init(TS_PINS[i], btn_handler, &light_channel_idx[i], HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_NONE);
    hal_gpio_irq_enable(TS_PINS[i]);
  }
}
