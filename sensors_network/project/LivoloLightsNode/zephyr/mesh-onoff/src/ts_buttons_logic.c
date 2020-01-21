#include <drivers/gpio.h>
#include <drivers/pwm.h>
#include "ts_buttons_logic.h"
#include "relays_logic.h"


struct device *port0;
static struct gpio_callback button_cb;

static void button_pressed(struct device *dev, struct gpio_callback *cb, u32_t pin_pos) {
  static uint32_t last_press_timestamp;

  // simple debouncing
  if ((k_uptime_get_32() - last_press_timestamp) >=
      BUTTON_DEBOUNCE_INTERVAL_MS) {
    // process TS1
    if (pin_pos == BIT(TS1_PIN)) {
      ch1_relay_toggle();
    }

    last_press_timestamp = k_uptime_get_32();
  }
}

void init_ts_gpio(void) {
  port0 = device_get_binding("GPIO_0");

  // LEDs
  gpio_pin_configure(port0, S1_LED_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, S1_LED_PIN, HIGH);

  // Touch sensor power mode
  gpio_pin_configure(port0, MTPM_PIN, GPIO_DIR_OUT);
  gpio_pin_write(port0, MTPM_PIN, HIGH);

  // Touch sensor sensitivity
  struct device *pwm0_dev = device_get_binding("PWM_0");
  pwm_pin_set_usec(pwm0_dev, MTSA_PIN, PWM_PERIOD_USEC, PWM_PULSE_US);

  // Touch sensor reading
  gpio_pin_configure(port0, TS1_PIN, (GPIO_DIR_IN | GPIO_INT | GPIO_INT_EDGE | GPIO_INT_ACTIVE_LOW | GPIO_PUD_PULL_UP));
  gpio_init_callback(&button_cb, button_pressed, BIT(TS1_PIN));
  gpio_add_callback(port0, &button_cb);
  gpio_pin_enable_callback(port0, TS1_PIN);
}
