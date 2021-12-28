#include <bluetooth/bluetooth.h>
#include <img_mgmt/img_mgmt.h>
#include "os_mgmt/os_mgmt.h"
#include <mgmt/mcumgr/smp_bt.h>
#include "mesh_logic.h"
#include "ts_buttons_logic.h"
#include "relays_logic.h"
#include "leds_logic.h"

void main(void) {
  init_leds();
  init_relays();
  init_ts();

  // Initialize the Bluetooth Subsystem
  bt_enable(bt_ready);

  img_mgmt_register_group();
  os_mgmt_register_group();

  // start_smp_bluetooth();
  smp_bt_register();
}
