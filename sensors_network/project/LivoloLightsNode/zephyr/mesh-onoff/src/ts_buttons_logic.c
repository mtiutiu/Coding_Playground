#include <stdint.h>
#include <device.h>
#include <drivers/gpio.h>
#include <drivers/pwm.h>
#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include "node_conf.h"

#define LOW  0
#define HIGH 1

static struct gpio_callback ts_cb;

static void button_pressed(struct device *dev, struct gpio_callback *cb, u32_t pin_pos) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((k_uptime_get_32() - last_press_timestamp) >= BUTTON_DEBOUNCE_INTERVAL_MS) {
    // process TS1
    if (pin_pos == BIT(TS1_PIN)) {
      relay_toggle(LIGHT_CHANNEL_1_INDEX);
    }

#if LIGHT_CHANNELS == 2
    // process TS2
    if (pin_pos == BIT(TS2_PIN)) {
      relay_toggle(LIGHT_CHANNEL_2_INDEX);
    }
#endif

    last_press_timestamp = k_uptime_get_32();
  }
}

void init_ts(void) {
  struct device *ts_port = device_get_binding("GPIO_0");

  // Touch sensor power mode
#ifdef MTPM_PIN
  gpio_pin_configure(ts_port, MTPM_PIN, GPIO_DIR_OUT);
  gpio_pin_write(ts_port, MTPM_PIN, HIGH);
#endif

  // Touch sensor sensitivity
  struct device *pwm0_dev = device_get_binding("PWM_0");
  pwm_pin_set_usec(pwm0_dev, MTSA_PIN, PWM_PERIOD_USEC, PWM_PULSE_US);

  // Touch sensor reading
  gpio_pin_configure(ts_port, TS1_PIN, (GPIO_DIR_IN | GPIO_INT | GPIO_INT_EDGE | GPIO_INT_ACTIVE_LOW | GPIO_PUD_PULL_UP));
  gpio_init_callback(&ts_cb, button_pressed, BIT(TS1_PIN));
#if LIGHT_CHANNELS == 2
  gpio_pin_configure(ts_port, TS2_PIN, (GPIO_DIR_IN | GPIO_INT | GPIO_INT_EDGE | GPIO_INT_ACTIVE_LOW | GPIO_PUD_PULL_UP));
  gpio_init_callback(&ts_cb, button_pressed, BIT(TS2_PIN));
#endif
  gpio_add_callback(ts_port, &ts_cb);
  gpio_pin_enable_callback(ts_port, TS1_PIN);
#if LIGHT_CHANNELS == 2
  gpio_pin_enable_callback(ts_port, TS2_PIN);
#endif
}
