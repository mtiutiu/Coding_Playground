#include <stdint.h>
#include <zephyr/bluetooth/bluetooth.h>
#include <zephyr/bluetooth/mesh.h>

#include "mesh_logic.h"
#include "relays_logic.h"
#include "node_conf.h"


#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)


static int gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static int gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static int gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);
static int gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf);


static struct bt_mesh_health_srv health_srv = {};

BT_MESH_HEALTH_PUB_DEFINE(health_pub, 0);

BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_srv_ch1, NULL, 2 + 1);
BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_cli_ch1, NULL, 2 + 1);

#if LIGHT_CHANNELS == 2
BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_srv_ch2, NULL, 2 + 1);
BT_MESH_MODEL_PUB_DEFINE(gen_onoff_pub_cli_ch2, NULL, 2 + 1);
#endif


static const struct bt_mesh_model_op gen_onoff_srv_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_GET, 0, gen_onoff_get },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET, 1, gen_onoff_set },
  { BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK, 1, gen_onoff_set_unack },
  BT_MESH_MODEL_OP_END
};


static const struct bt_mesh_model_op gen_onoff_cli_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_STATUS, BT_MESH_LEN_EXACT(1), gen_onoff_status },
  BT_MESH_MODEL_OP_END
};


static uint8_t light_channel_idx[] = {
  0,
#if LIGHT_CHANNELS == 2
  1
#endif
};

static struct bt_mesh_model root_models[] = {
  BT_MESH_MODEL_CFG_SRV,
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


static struct bt_mesh_model *mod_cli_ts_btn[] = {
  &secondary_models_ch1[1],
#if LIGHT_CHANNELS == 2
  &secondary_models_ch2[1],
#endif
};


static struct bt_mesh_elem elements[] = {
  BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE),
  BT_MESH_ELEM(0, secondary_models_ch1, BT_MESH_MODEL_NONE),
#if LIGHT_CHANNELS == 2
  BT_MESH_ELEM(0, secondary_models_ch2, BT_MESH_MODEL_NONE),
#endif
};

static const struct bt_mesh_comp comp = {
  .cid = BT_COMP_ID_LF,
  .elem = elements,
  .elem_count = ARRAY_SIZE(elements)
};

static uint16_t primary_addr;
static uint16_t primary_net_idx;


static int gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  NET_BUF_SIMPLE_DEFINE(msg, 2 + 1 + 4);

  uint8_t *channel = (uint8_t*)model->user_data;

  bt_mesh_model_msg_init(&msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  net_buf_simple_add_u8(&msg, get_relay_state(*channel));

  bt_mesh_model_send(model, ctx, &msg, NULL, NULL);

  return 0;
}

static int gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  struct net_buf_simple *msg = model->pub->msg;
  uint8_t *channel = (uint8_t *)model->user_data;
  uint8_t desired_state = net_buf_simple_pull_u8(buf);
  uint8_t current_state = get_relay_state(*channel);

  if (desired_state != current_state) {
    set_relay_state(*channel, desired_state);
  }

  if (model->pub->addr != BT_MESH_ADDR_UNASSIGNED) {
    bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
    net_buf_simple_add_u8(msg, get_relay_state(*channel));
    bt_mesh_model_publish(model);
  }

  return 0;
}

static int gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  gen_onoff_set_unack(model, ctx, buf);
  gen_onoff_get(model, ctx, buf);

  return 0;
}

static int gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct net_buf_simple *buf) {
  return 0;
}

static void prov_complete(uint16_t net_idx, uint16_t addr) {
  primary_addr = addr;
  primary_net_idx = net_idx;
}

static void prov_reset(void) {
  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

static uint8_t dev_uuid[16] = {0xdd, 0xdd};


static const struct bt_mesh_prov prov = {
  .uuid = dev_uuid,
  .output_size = 0,
  .output_actions = 0,
  .output_number = 0,
  .complete = prov_complete,
  .reset = prov_reset
};


void bt_ready(int err) {
  struct bt_le_oob oob;

  if (err) {
    // Bluetooth init failed
    return;
  }

  err = bt_mesh_init(&prov, &comp);
  if (err) {
    // Initializing mesh failed
    return;
  }

  if (IS_ENABLED(CONFIG_SETTINGS)) {
    settings_load();
  }

  /* Use identity address as device UUID */
  if (bt_le_oob_get_local(BT_ID_DEFAULT, &oob)) {
    // Identity Address unavailable
  } else {
    memcpy(dev_uuid, oob.addr.a.val, 6);
  }

  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

void mesh_publish_state(uint8_t channel, uint8_t new_state) {
  struct bt_mesh_model *mod_cli = mod_cli_ts_btn[channel];
  struct bt_mesh_model_pub *pub_cli = mod_cli->pub;

  if (pub_cli->addr == BT_MESH_ADDR_UNASSIGNED) {
    return;
  }

  bt_mesh_model_msg_init(pub_cli->msg, BT_MESH_MODEL_OP_GEN_ONOFF_SET);
  net_buf_simple_add_u8(pub_cli->msg, new_state);

  bt_mesh_model_publish(mod_cli);
}
