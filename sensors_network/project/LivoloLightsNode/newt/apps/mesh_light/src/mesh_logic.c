#include "mesh_logic.h"
#include <bsp/bsp.h>
#include <host/ble_hs.h>
#include <mesh/glue.h>
#include <mesh/mesh.h>
#include <os/mynewt.h>
#include "relays_logic.h"


#define CID_RUNTIME 0x05C3

/* Model Operation Codes */
#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);

/*
 * Server Configuration Declaration
 */

static struct bt_mesh_cfg_srv cfg_srv = {
  .relay = BT_MESH_RELAY_DISABLED,
  .beacon = BT_MESH_BEACON_ENABLED,
#if defined(CONFIG_BT_MESH_FRIEND)
  .frnd = BT_MESH_FRIEND_ENABLED,
#else
  .frnd = BT_MESH_FRIEND_NOT_SUPPORTED,
#endif
#if defined(CONFIG_BT_MESH_GATT_PROXY)
  .gatt_proxy = BT_MESH_GATT_PROXY_ENABLED,
#else
  .gatt_proxy = BT_MESH_GATT_PROXY_NOT_SUPPORTED,
#endif
  .default_ttl = 7,

  /* 3 transmissions with 20ms interval */
  .net_transmit = BT_MESH_TRANSMIT(2, 20),
  .relay_retransmit = BT_MESH_TRANSMIT(2, 20)
};

/*
 * Client Configuration Declaration
 */

static struct bt_mesh_cfg_cli cfg_cli = {};

/*
 * Health Server Declaration
 */

static struct bt_mesh_health_srv health_srv = {};

/*
 * Publication Declarations
 *
 * The publication messages are initialized to the
 * the size of the opcode + content
 *
 * For publication, the message must be in static or global as
 * it is re-transmitted several times. This occurs
 * after the function that called bt_mesh_model_publish() has
 * exited and the stack is no longer valid.
 *
 * Note that the additional 4 bytes for the AppMIC is not needed
 * because it is added to a stack variable at the time a
 * transmission occurs.
 *
 */

static struct bt_mesh_model_pub health_pub;
static struct os_mbuf *bt_mesh_pub_msg_health_pub;

static struct bt_mesh_model_pub gen_onoff_pub_srv_ch1;
static struct bt_mesh_model_pub gen_onoff_pub_cli_ch1;
static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_srv_ch1;
static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_cli_ch1;

#if LIGHT_CHANNELS == 2
static struct bt_mesh_model_pub gen_onoff_pub_srv_ch2;
static struct bt_mesh_model_pub gen_onoff_pub_cli_ch2;
static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_srv_ch2;
static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_cli_ch2;
#endif

/*
 * Models in an element must have unique op codes.
 *
 * The mesh stack dispatches a message to the first model in an element
 * that is also bound to an app key and supports the op code in the
 * received message.
 *
 */

/*
 * OnOff Model Server Op Dispatch Table
 *
 */

static const struct bt_mesh_model_op gen_onoff_srv_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_GET, 0, gen_onoff_get },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET, 1, gen_onoff_set },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK, 1, gen_onoff_set_unack },
  BT_MESH_MODEL_OP_END
};

/*
 * OnOff Model Client Op Dispatch Table
 */

static const struct bt_mesh_model_op gen_onoff_cli_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_STATUS, 1, gen_onoff_status },
  BT_MESH_MODEL_OP_END
};

/*
 *
 * Element Model Declarations
 *
 * Element 0 Root Models
 */

static uint8_t light_channel_idx[LIGHT_CHANNELS] = {
  LIGHT_CHANNEL_1_INDEX,
#if LIGHT_CHANNELS == 2
  LIGHT_CHANNEL_2_INDEX
#endif
};

static struct bt_mesh_model root_models[] = {
  BT_MESH_MODEL_CFG_SRV(&cfg_srv),
  BT_MESH_MODEL_CFG_CLI(&cfg_cli),
  BT_MESH_MODEL_HEALTH_SRV(&health_srv, &health_pub)
};

static struct bt_mesh_model secondary_models_ch1[] = {
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_srv_op, &gen_onoff_pub_srv_ch1, &light_channel_idx[0]),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_CLI, gen_onoff_cli_op, &gen_onoff_pub_cli_ch1, &light_channel_idx[0])
};

#if LIGHT_CHANNELS == 2
static struct bt_mesh_model secondary_models_ch2[] = {
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_srv_op, &gen_onoff_pub_srv_ch2, &light_channel_idx[1]),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_CLI, gen_onoff_cli_op, &gen_onoff_pub_cli_ch2, &light_channel_idx[1])
};
#endif


/*
 * Button to Client Model Assignments
 */

static struct bt_mesh_model *mod_cli_ts_btn[] = {
  &secondary_models_ch1[1],
#if LIGHT_CHANNELS == 2
  &secondary_models_ch2[1],
#endif
};

/*
 * Root Element Declarations
 */

static struct bt_mesh_elem elements[] = {
  BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE),
  BT_MESH_ELEM(0, secondary_models_ch1, BT_MESH_MODEL_NONE),
#if LIGHT_CHANNELS == 2
  BT_MESH_ELEM(0, secondary_models_ch2, BT_MESH_MODEL_NONE),
#endif
};

static const struct bt_mesh_comp comp = {
  .cid = CID_RUNTIME,
  .elem = elements,
  .elem_count = ARRAY_SIZE(elements)
};

static uint16_t primary_addr;
static uint16_t primary_net_idx;


void init_pub(void) {
  bt_mesh_pub_msg_health_pub = NET_BUF_SIMPLE(1 + 3 + 0);
  health_pub.msg = bt_mesh_pub_msg_health_pub;

  bt_mesh_pub_msg_gen_onoff_pub_srv_ch1 = NET_BUF_SIMPLE(2 + 1);
  gen_onoff_pub_srv_ch1.msg = bt_mesh_pub_msg_gen_onoff_pub_srv_ch1;
  bt_mesh_pub_msg_gen_onoff_pub_cli_ch1 = NET_BUF_SIMPLE(2 + 1);
  gen_onoff_pub_cli_ch1.msg = bt_mesh_pub_msg_gen_onoff_pub_cli_ch1;

#if LIGHT_CHANNELS == 2
  bt_mesh_pub_msg_gen_onoff_pub_srv_ch2 = NET_BUF_SIMPLE(2 + 1);
  gen_onoff_pub_srv_ch2.msg = bt_mesh_pub_msg_gen_onoff_pub_srv_ch2;
  bt_mesh_pub_msg_gen_onoff_pub_cli_ch2 = NET_BUF_SIMPLE(2 + 1);
  gen_onoff_pub_cli_ch2.msg = bt_mesh_pub_msg_gen_onoff_pub_cli_ch2;
#endif
}

/*
 * Generic OnOff Model Server Message Handlers
 *
 * Mesh Model Specification 3.1.1
 *
 */

static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  struct os_mbuf *msg = NET_BUF_SIMPLE(2 + 1 + 4);
  uint8_t *channel = (uint8_t*)model->user_data;

  bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  net_buf_simple_add_u8(msg, get_relay_state(*channel));

  if (bt_mesh_model_send(model, ctx, msg, NULL, NULL)) {

  }

  os_mbuf_free_chain(msg);
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  struct os_mbuf *msg = model->pub->msg;
  uint8_t *channel = (uint8_t *)model->user_data;

  set_relay_state(*channel, net_buf_simple_pull_u8(buf), false);

  if (model->pub->addr != BT_MESH_ADDR_UNASSIGNED) {
    bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
    net_buf_simple_add_u8(msg, get_relay_state(*channel));
    int err = bt_mesh_model_publish(model);
    if (err) {

    }
  }
}

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  gen_onoff_set_unack(model, ctx, buf);
  gen_onoff_get(model, ctx, buf);
}

static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {

}

static void prov_complete(u16_t net_idx, u16_t addr) {
  primary_addr = addr;
  primary_net_idx = net_idx;
}

static void prov_reset(void) {
  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

static uint8_t dev_uuid[16] = MYNEWT_VAL(BLE_MESH_DEV_UUID);

/* Disable OOB security */

static const struct bt_mesh_prov prov = {
  .uuid = dev_uuid,
  .output_size = 0,
  .output_actions = 0,
  .output_number = 0,
  .complete = prov_complete,
  .reset = prov_reset
};

void blemesh_on_reset(int reason) {

}

void blemesh_on_sync(void) {
  int err;
  ble_addr_t addr;

  // console_printf("Bluetooth initialized\n");

  /* Use NRPA */
  err = ble_hs_id_gen_rnd(1, &addr);
  assert(err == 0);
  err = ble_hs_id_set_rnd(addr.val);
  assert(err == 0);

  err = bt_mesh_init(addr.type, &prov, &comp);
  if (err) {
    // console_printf("Initializing mesh failed (err %d)\n", err);
    return;
  }

  if (IS_ENABLED(CONFIG_SETTINGS)) {
    settings_load();
  }

  if (bt_mesh_is_provisioned()) {
    // console_printf("Mesh network restored from flash\n");
  }

  bt_mesh_prov_enable(BT_MESH_PROV_GATT | BT_MESH_PROV_ADV);

  // console_printf("Mesh initialized\n");
}

void mesh_publish_state(uint8_t channel, uint8_t new_state) {
  struct bt_mesh_model *mod_cli = mod_cli_ts_btn[channel];
  struct bt_mesh_model_pub *pub_cli = mod_cli->pub;

  if (pub_cli->addr == BT_MESH_ADDR_UNASSIGNED) {
    return;
  }

  bt_mesh_model_msg_init(pub_cli->msg, BT_MESH_MODEL_OP_GEN_ONOFF_SET);
  net_buf_simple_add_u8(pub_cli->msg, new_state);

  int err = bt_mesh_model_publish(mod_cli);
  if (err) {

  }
}
