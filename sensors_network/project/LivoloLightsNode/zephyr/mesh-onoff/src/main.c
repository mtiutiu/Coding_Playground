#include <bluetooth/bluetooth.h>
#include "mesh_logic.h"
#include "ts_buttons_logic.h"


void main(void) {
  // gpios
  init_ts_gpio();

  /* Initialize the Bluetooth Subsystem */
  int err;
  err = bt_enable(bt_ready);
  if (err) {

  }
}
