#include "app_pwm.h"


static struct pwm_dev *pwm0;
static struct pwm_chan_cfg mtsa_conf;

static struct pwm_dev_cfg dev_conf = {
    .n_cycles = 0,
    .int_prio = 3,
};

static struct pwm_chan_cfg mtsa_conf = {
    .pin = MTSA_PIN,
    .inverted = false,
};


void init_app_pwm0_dev(void) {
    int rc = 0;

    pwm0 = (struct pwm_dev *)os_dev_open("pwm0", 0, NULL);
    assert(pwm0);
    rc = pwm_configure_device(pwm0, &dev_conf);
    assert(rc == 0);
    rc = pwm_configure_channel(pwm0, 0, &mtsa_conf);
    assert(rc == 0);
    rc = pwm_enable(pwm0);
    assert(rc == 0);
}

void set_pwm0_duty_cycle_perc(uint8_t percent) {
  uint16_t top_val = (uint16_t)pwm_get_top_value(pwm0);
  pwm_set_duty_cycle(pwm0, 0, (uint16_t)(percent * top_val / 100));
}