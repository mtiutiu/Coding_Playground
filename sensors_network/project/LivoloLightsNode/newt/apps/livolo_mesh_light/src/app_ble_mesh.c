#include "nimble/ble.h"
#include "host/ble_hs.h"
#include "services/gap/ble_svc_gap.h"
#include "mesh/glue.h"
#include "mesh/mesh.h"
#include "hal/hal_gpio.h"
#include "bsp/bsp.h"

#if (MYNEWT_VAL(BSP_UART_CONSOLE))
#include "console/console.h"
#endif
#include "app_ble_mesh.h"

static user_cb user_callbacks;

/* Company ID */
#define CID_NUMBER 0x05C3

static struct bt_mesh_model_pub gen_onoff_pub;

static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx);
static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void prov_complete(u16_t net_idx, u16_t addr);
static void prov_reset(void);
#if (MYNEWT_VAL(BLE_MESH_OOB_PROV_ENABLED))
static int output_number(bt_mesh_output_action_t action, uint32_t number);
#endif

static struct bt_mesh_cfg_srv cfg_srv = {
  .relay = BT_MESH_RELAY_ENABLED,
  .beacon = BT_MESH_BEACON_ENABLED,
#if MYNEWT_VAL(BLE_MESH_FRIEND)
  .frnd = BT_MESH_FRIEND_ENABLED,
#else
  .gatt_proxy = BT_MESH_GATT_PROXY_NOT_SUPPORTED,
#endif
#if MYNEWT_VAL(BLE_MESH_GATT_PROXY)
  .gatt_proxy = BT_MESH_GATT_PROXY_ENABLED,
#else
  .gatt_proxy = BT_MESH_GATT_PROXY_NOT_SUPPORTED,
#endif
  .default_ttl = 7,

  /* 3 transmissions with 20ms interval */
  .net_transmit = BT_MESH_TRANSMIT(2, 20),
  .relay_retransmit = BT_MESH_TRANSMIT(2, 20),
};

static const struct bt_mesh_model_op gen_onoff_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_GET, 0, gen_onoff_get },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET, 2, gen_onoff_set },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK, 2, gen_onoff_set_unack },
  BT_MESH_MODEL_OP_END,
};

static struct bt_mesh_model root_models[] = {
  BT_MESH_MODEL_CFG_SRV(&cfg_srv),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_op, &gen_onoff_pub, &user_callbacks)
};

static struct bt_mesh_elem elements[] = {
  BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE),
};

static const struct bt_mesh_comp comp = {
  .cid = CID_NUMBER,
  .elem = elements,
  .elem_count = ARRAY_SIZE(elements),
};

static const struct bt_mesh_prov prov = {
  .uuid = MYNEWT_VAL(BLE_MESH_DEV_UUID),
#if (MYNEWT_VAL(BLE_MESH_OOB_PROV_ENABLED))
  .output_size = 4,
  .output_actions = BT_MESH_DISPLAY_NUMBER,
  .output_number = output_number,
#else
  .output_size = 0,
  .output_actions = 0,
  .output_number = 0,
#endif
  .complete = prov_complete,
  .reset = prov_reset
};

static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx) {
  struct os_mbuf *msg = NET_BUF_SIMPLE(3);
  uint8_t *state;
  user_cb *cb = model->user_data;

#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("#mesh-onoff STATUS\n");
#endif
  bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  state = net_buf_simple_add(msg, 1);

  if (cb && cb->get_handler) {
    cb->get_handler(state);
  }

  if (bt_mesh_model_send(model, ctx, msg, NULL, NULL)) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("#mesh-onoff STATUS: send status failed\n");
#endif
  }

  os_mbuf_free_chain(msg);
}

static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("#mesh-onoff GET\n");
#endif
  gen_onoff_status(model, ctx);
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("#mesh-onoff SET-UNACK\n");
#endif
  user_cb *cb =  model->user_data;
  if (cb && cb->set_handler) {
    uint8_t gen_on_off_state = buf->om_data[0];
    cb->set_handler(gen_on_off_state);
  }
}

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("#mesh-onoff SET\n");
#endif
  gen_onoff_set_unack(model, ctx, buf);
  gen_onoff_status(model, ctx);
}

void app_ble_mesh_register_user_onoff_cb(user_cb *cbs) {
  user_callbacks = *cbs;
}

#if (MYNEWT_VAL(BLE_MESH_OOB_PROV_ENABLED))
    static int output_number(bt_mesh_output_action_t action, uint32_t number) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("OOB Number: %lu\n", number);
#endif
  return 0;
}
#endif

static void prov_complete(u16_t net_idx, u16_t addr) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("Local node provisioned, primary address 0x%04x\n", addr);
#endif
}

static void prov_reset(void) {
  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

void blemesh_on_reset(int reason) {
  BLE_HS_LOG(ERROR, "Resetting state; reason=%d\n", reason);
}

void blemesh_on_sync(void) {
  int err;
  ble_addr_t addr;
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("Bluetooth initialized\n");
#endif
  /* Use NRPA */
  err = ble_hs_id_gen_rnd(1, &addr);
  assert(err == 0);
  err = ble_hs_id_set_rnd(addr.val);
  assert(err == 0);

  err = bt_mesh_init(addr.type, &prov, &comp);
  if (err) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("Initializing mesh failed (err %d)\n", err);
#endif
    return;
  }
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
  console_printf("Mesh initialized\n");
#endif

  if (IS_ENABLED(CONFIG_SETTINGS)) {
    settings_load();
  }

  if (bt_mesh_is_provisioned()) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    printk("Mesh network restored from flash\n");
#endif
  }
}
