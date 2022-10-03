#ifdef CONFIG_MCUMGR_CMD_IMG_MGMT
#include "img_mgmt/img_mgmt.h"
#endif
#ifdef CONFIG_MCUMGR_CMD_OS_MGMT
#include "os_mgmt/os_mgmt.h"
#endif
#ifdef CONFIG_MCUMGR_SMP_BT
#include <zephyr/mgmt/mcumgr/smp_bt.h>
#endif
#include <zephyr/bluetooth/bluetooth.h>

#include "leds_logic.h"
#include "mesh_logic.h"
#include "relays_logic.h"
#include "ts_buttons_logic.h"


void main(void) {
  init_leds();
  init_relays();
  init_ts();

  // Initialize the Bluetooth Subsystem
  bt_enable(bt_ready);

#ifdef CONFIG_MCUMGR_CMD_OS_MGMT
  os_mgmt_register_group();
#endif

#ifdef CONFIG_MCUMGR_CMD_IMG_MGMT
  img_mgmt_register_group();
#endif

#ifdef CONFIG_MCUMGR_SMP_BT
  smp_bt_register();
#endif
}
