#include <bluetooth/bluetooth.h>
#include "mesh_logic.h"
#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include "leds_logic.h"

void main(void) {
  init_leds();
  init_relays();
  init_ts();

  /* Initialize the Bluetooth Subsystem */
  int err;
  err = bt_enable(bt_ready);
  if (err) {

  }
}
