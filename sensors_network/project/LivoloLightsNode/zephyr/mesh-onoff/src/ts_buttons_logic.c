#include <stdint.h>
#include <device.h>
#include <drivers/gpio.h>
#ifdef TOUCH_SENSITIVITY_ADJUST
#include <drivers/pwm.h>
#endif
#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include "node_conf.h"

#define LOW  0
#define HIGH 1

#ifdef TOUCH_SENSITIVITY_ADJUST
#define PWM_DUTY_CYCLE_PERCENT 30
#define PWM_FREQUENCY_HZ 100000
#define PWM_PERIOD_USEC (1000000 / PWM_FREQUENCY_HZ)
#define PWM_PULSE_US (PWM_PERIOD_USEC * PWM_DUTY_CYCLE_PERCENT) / 100
#endif

#define BUTTON_DEBOUNCE_INTERVAL_MS 250

static struct gpio_callback ts_cb;

static void button_pressed(struct device *dev, struct gpio_callback *cb, u32_t pins) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((k_uptime_get_32() - last_press_timestamp) >= BUTTON_DEBOUNCE_INTERVAL_MS) {
    // process TS1
    if (pins & BIT(TS1_PIN)) {
      relay_toggle(LIGHT_CHANNEL_1_INDEX);
    }

#if LIGHT_CHANNELS == 2
    // process TS2
    if (pins & BIT(TS2_PIN)) {
      relay_toggle(LIGHT_CHANNEL_2_INDEX);
    }
#endif

    last_press_timestamp = k_uptime_get_32();
  }
}

void init_ts(void) {
  struct device *gpio_dev_port = device_get_binding("GPIO_0");

  // Touch sensor power mode
#ifdef MTPM1_PIN
  gpio_pin_configure(gpio_dev_port, MTPM1_PIN, GPIO_OUTPUT);
  gpio_pin_set(gpio_dev_port, MTPM1_PIN, HIGH);
#endif

#ifdef TOUCH_SENSITIVITY_ADJUST
  // Touch sensor sensitivity
  struct device *ts_pwm = device_get_binding("PWM_0");
  pwm_pin_set_usec(ts_pwm, MTSA1_PIN, PWM_PERIOD_USEC, PWM_PULSE_US);
#ifdef MTSA2_PIN
  pwm_pin_set_usec(ts_pwm, MTSA2_PIN, PWM_PERIOD_USEC, PWM_PULSE_US);
#endif
#endif

  // Touch sensor reading
  gpio_pin_configure(gpio_dev_port, TS1_PIN, GPIO_INPUT);
  gpio_pin_interrupt_configure(gpio_dev_port, TS1_PIN, GPIO_INT_EDGE_FALLING);
#if LIGHT_CHANNELS == 2
  gpio_pin_configure(gpio_dev_port, TS2_PIN, GPIO_INPUT);
  gpio_pin_interrupt_configure(gpio_dev_port, TS2_PIN, GPIO_INT_EDGE_FALLING);
#endif
  gpio_init_callback(&ts_cb, button_pressed, BIT(TS1_PIN)
#if LIGHT_CHANNELS == 2
    | BIT(TS2_PIN)
#endif
  );
  gpio_add_callback(gpio_dev_port, &ts_cb);
}
