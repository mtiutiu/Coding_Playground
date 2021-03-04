#include <stdint.h>
#include <device.h>
#include <drivers/gpio.h>
#include <bluetooth/mesh.h>
#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include "node_conf.h"

#define LOW  0
#define HIGH 1

#define BUTTON_SHORT_PRESS_INTERVAL_MS  500
#define BUTTON_LONG_PRESS_INTERVAL_MS  5000
#define MESH_RESET_TIMEOUT_MS          1000

static struct k_delayed_work mr_work;
static const struct device *gpio_dev_port;
static struct gpio_callback ts_cb;

static void mesh_reset_handler(struct k_work *item) {
  bt_mesh_reset();
}

static void process_button(uint8_t pin, uint8_t channel) {
  static uint64_t last_press_timestamp;

  if ((gpio_pin_get(gpio_dev_port, pin) == LOW) &&
        (k_uptime_get() - last_press_timestamp) >= BUTTON_SHORT_PRESS_INTERVAL_MS) {
    relay_toggle(channel);
    last_press_timestamp = k_uptime_get();
  }

  if ((gpio_pin_get(gpio_dev_port, pin) == HIGH) &&
        (k_uptime_get() - last_press_timestamp) >= BUTTON_LONG_PRESS_INTERVAL_MS) {
    k_delayed_work_submit(&mr_work, K_MSEC(MESH_RESET_TIMEOUT_MS));
  }
}

static void button_pressed_handler(const struct device *dev, struct gpio_callback *cb, uint32_t pins) {
  // process TS1
  if (pins & BIT(TS1_PIN)) {
    process_button(TS1_PIN, LIGHT_CHANNEL_1_INDEX);
  }
#if LIGHT_CHANNELS == 2
  // process TS2
  if (pins & BIT(TS2_PIN)) {
    process_button(TS2_PIN, LIGHT_CHANNEL_2_INDEX);
  }
#endif
}

void init_ts(void) {
  k_delayed_work_init(&mr_work, mesh_reset_handler);
  gpio_dev_port = device_get_binding("GPIO_0");

  // Touch sensor reading
  gpio_pin_configure(gpio_dev_port, TS1_PIN, GPIO_INPUT);
  gpio_pin_interrupt_configure(gpio_dev_port, TS1_PIN, GPIO_INT_EDGE_BOTH);
#if LIGHT_CHANNELS == 2
  gpio_pin_configure(gpio_dev_port, TS2_PIN, GPIO_INPUT);
  gpio_pin_interrupt_configure(gpio_dev_port, TS2_PIN, GPIO_INT_EDGE_BOTH);
#endif
  gpio_init_callback(&ts_cb, button_pressed_handler, BIT(TS1_PIN)
#if LIGHT_CHANNELS == 2
    | BIT(TS2_PIN)
#endif
  );
  gpio_add_callback(gpio_dev_port, &ts_cb);
}
