#include "bsp/bsp.h"
#include "hal/hal_gpio.h"
#include "app_gpio.h"
#include "app_ble_mesh.h"


static void gpio_irq_handler(void *arg) {
  static uint8_t current_state;

  hal_gpio_toggle(S1_LED_PIN);

  current_state = hal_gpio_read(S1_LED_PIN);

  app_ble_mesh_publish_gen_onoff_state(current_state);
}

void init_app_gpio(void) {
  hal_gpio_init_out(S1_LED_PIN, LOW);
  hal_gpio_init_out(MTPM_PIN, LOW);
  hal_gpio_irq_init(TS1_PIN, gpio_irq_handler, NULL, HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_NONE);
  hal_gpio_irq_enable(TS1_PIN);
}
