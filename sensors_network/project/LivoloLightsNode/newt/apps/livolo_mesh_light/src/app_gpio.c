#include "bsp/bsp.h"
#include "hal/hal_gpio.h"
#include "app_gpio.h"

static void gpio_irq_handler(void *arg) {
  hal_gpio_toggle(S1_LED_PIN);
}

void init_app_gpio(void) {
  hal_gpio_init_out(S1_LED_PIN, LOW);
  hal_gpio_init_out(MTPM_PIN, LOW);
  hal_gpio_irq_init(TS1_PIN, gpio_irq_handler, NULL, HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_NONE);
  hal_gpio_irq_enable(TS1_PIN);
}
