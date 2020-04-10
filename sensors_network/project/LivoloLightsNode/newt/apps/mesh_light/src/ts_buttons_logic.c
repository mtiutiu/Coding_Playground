#include "ts_buttons_logic.h"
#include "node_conf.h"
#include "relays_logic.h"
#include <hal/hal_gpio.h>
#include <os/mynewt.h>

#define LOW  0
#define HIGH 1

#define BUTTON_DEBOUNCE_INTERVAL_MS 250


static void btn1_handler(void *arg) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((os_cputime_get32() - last_press_timestamp) >= BUTTON_DEBOUNCE_INTERVAL_MS) {
    relay_toggle(LIGHT_CHANNEL_1_INDEX);
    last_press_timestamp = os_cputime_get32();
  }
}

#if LIGHT_CHANNELS == 2
static void btn2_handler(void *arg) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((os_cputime_get32() - last_press_timestamp) >= BUTTON_DEBOUNCE_INTERVAL_MS) {
    relay_toggle(LIGHT_CHANNEL_2_INDEX);
    last_press_timestamp = os_cputime_get32();
  }
}
#endif

void init_ts(void) {
  // Touch sensor reading
  hal_gpio_irq_init(TS1_PIN, btn1_handler, NULL, HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_NONE);
  hal_gpio_irq_enable(TS1_PIN);
#if LIGHT_CHANNELS == 2
  hal_gpio_irq_init(TS2_PIN, btn2_handler, NULL, HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_NONE);
  hal_gpio_irq_enable(TS2_PIN)
#endif
}
