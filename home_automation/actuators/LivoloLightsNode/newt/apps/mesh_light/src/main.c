#include "host/ble_hs.h"
#include "leds_logic.h"
#include "mesh_logic.h"
#include <os/mynewt.h>
#include "relays_logic.h"
#include "ts_buttons_logic.h"


int main(void) {
  /* Initialize OS */
  sysinit();

  init_leds();
  init_relays();
  init_ts();

  init_pub();

  /* Initialize the NimBLE host configuration. */
  ble_hs_cfg.reset_cb = blemesh_on_reset;
  ble_hs_cfg.sync_cb = blemesh_on_sync;
  ble_hs_cfg.store_status_cb = ble_store_util_status_rr;

  while (1) {
    os_eventq_run(os_eventq_dflt_get());
  }

  return 0;
}
