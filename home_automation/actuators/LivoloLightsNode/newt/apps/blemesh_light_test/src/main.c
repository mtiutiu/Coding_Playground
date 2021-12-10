/* main.c - Application main entry point */

/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*
 * Copyright (c) 2017 Intel Corporation
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "bsp/bsp.h"
#include "console/console.h"
#include "host/ble_hs.h"
#include "mesh/glue.h"
#include "mesh/mesh.h"
#include "os/mynewt.h"


#define CID_RUNTIME 0x05C3

/* Model Operation Codes */
#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)

static int gen_onoff_set(struct bt_mesh_model * model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static int gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static int gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);
static int gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf);


#define OFF 0
#define ON  1
#define APP_DEBUG

static uint8_t new_state = 0;

/*
 * Server Configuration Declaration
 */

static struct bt_mesh_cfg_srv cfg_srv = {
  .relay = BT_MESH_RELAY_DISABLED,
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

/*
 * Client Configuration Declaration
 */

static struct bt_mesh_cfg_cli cfg_cli = {};

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

static struct bt_mesh_model_pub gen_onoff_pub_srv;
static struct bt_mesh_model_pub gen_onoff_pub_cli;

static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_srv;
static struct os_mbuf *bt_mesh_pub_msg_gen_onoff_pub_cli;

void init_pub(void) {
  bt_mesh_pub_msg_gen_onoff_pub_srv = NET_BUF_SIMPLE(2 + 1);
  bt_mesh_pub_msg_gen_onoff_pub_cli = NET_BUF_SIMPLE(2 + 1);

  gen_onoff_pub_srv.msg = bt_mesh_pub_msg_gen_onoff_pub_srv;
  gen_onoff_pub_cli.msg = bt_mesh_pub_msg_gen_onoff_pub_cli;
}

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
  BT_MESH_MODEL_OP_END,
};

/*
 * OnOff Model Client Op Dispatch Table
 */

static const struct bt_mesh_model_op gen_onoff_cli_op[] = {
  { BT_MESH_MODEL_OP_GEN_ONOFF_STATUS, 1, gen_onoff_status },
  BT_MESH_MODEL_OP_END,
};

/*
 *
 * Element Model Declarations
 *
 * Element 0 Root Models
 */

static struct bt_mesh_model root_models[] = {
  BT_MESH_MODEL_CFG_SRV(&cfg_srv),
  BT_MESH_MODEL_CFG_CLI(&cfg_cli),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_srv_op, &gen_onoff_pub_srv, NULL),
  BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_CLI, gen_onoff_cli_op, &gen_onoff_pub_cli, NULL),
};


/*
 * Root Element Declaration
 */

static struct bt_mesh_elem elements[] = {
  BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE)
};

static const struct bt_mesh_comp comp = {
    .cid = CID_RUNTIME,
    .elem = elements,
    .elem_count = ARRAY_SIZE(elements),
};


/*
 * Generic OnOff Model Server Message Handlers
 *
 * Mesh Model Specification 3.1.1
 *
 */

static void gen_onoff_get(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  struct os_mbuf *msg = NET_BUF_SIMPLE(2 + 1 + 4);
#ifdef APP_DEBUG
  printf("[INFO] Mesh OnOff GET operation! Sending reply payload: %d\n", new_state /* TO DO */);
#endif
  bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  net_buf_simple_add_u8(msg, new_state /*TO DO*/);

  int err = bt_mesh_model_send(model, ctx, msg, NULL, NULL);
  if (err) {
#ifdef APP_DEBUG
    printf("[ERROR] Unable to send On Off Status response\n");
#endif
  }

  os_mbuf_free_chain(msg);
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  struct os_mbuf *msg = model->pub->msg;
  new_state = net_buf_simple_pull_u8(buf);
#ifdef APP_DEBUG
  printf("[INFO] Mesh OnOff SET operation! Received payload: %d from: 0x%04x and model idx: %d\n", new_state, ctx->addr, model->mod_idx);
#endif

  /*
   * If a server has a publish address, it is required to
   * publish status on a state change
   *
   * See Mesh Profile Specification 3.7.6.1.2
   *
   * Only publish if there is an assigned address
  */
  if (model->pub->addr == BT_MESH_ADDR_UNASSIGNED) {
    return;
  }

  bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_GEN_ONOFF_STATUS);
  net_buf_simple_add_u8(msg, new_state /*TO DO*/);

  int err = bt_mesh_model_publish(model);
  if (err) {
#ifdef APP_DEBUG
    printf("[ERROR] bt_mesh_model_publish err %d\n", err);
#endif
  }
}

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
  gen_onoff_set_unack(model, ctx, buf);
  gen_onoff_get(model, ctx, buf);
}

static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#ifdef APP_DEBUG
  uint8_t state = net_buf_simple_pull_u8(buf);
  printf("[INFO] Node 0x%04x OnOff status from 0x%04x with state 0x%02x\n", bt_mesh_model_elem(model)->addr, ctx->addr, state);
#endif
}

#if (MYNEWT_VAL(BLE_MESH_OOB_PROV_ENABLED))
static int output_number(bt_mesh_output_action_t action, u32_t number) {
#ifdef APP_DEBUG
  printf("OOB Number %ld\n", number);
#endif
  return 0;
}
#endif

static void prov_complete(u16_t net_idx, u16_t addr) {
#ifdef APP_DEBUG
  printf("[INFO] Provisioning complete for net_idx 0x%04x addr 0x%04x\n", net_idx, addr);
#endif
}

static void prov_reset(void) {
  bt_mesh_prov_enable(BT_MESH_PROV_ADV | BT_MESH_PROV_GATT);
}

static uint8_t dev_uuid[16] = MYNEWT_VAL(BLE_MESH_DEV_UUID);

static const struct bt_mesh_prov prov = {
    .uuid = dev_uuid,
#if (MYNEWT_VAL(BLE_MESH_OOB_PROV_ENABLED))
    .output_size = 4,
    .output_actions = (BT_MESH_DISPLAY_NUMBER),
    .output_number = output_number,
#else
    .output_size = 0,
    .output_actions = 0,
    .output_number = 0,
#endif
    .complete = prov_complete,
    .reset = prov_reset,
};

void bt_mesh_gen_onoff_client_publish(uint8_t data) {
  struct bt_mesh_model *mod_cli = &root_models[3];
  struct bt_mesh_model_pub *pub_cli = mod_cli->pub;

  if (pub_cli->addr == BT_MESH_ADDR_UNASSIGNED) {
    return;
  }

  bt_mesh_model_msg_init(pub_cli->msg, BT_MESH_MODEL_OP_GEN_ONOFF_SET);
  net_buf_simple_add_u8(pub_cli->msg, data);
  int err = bt_mesh_model_publish(mod_cli);
  if (err) {
#ifdef APP_DEBUG
    printf("[ERROR] bt_mesh_model_publish err %d\n", err);
#endif
  }
}

static void blemesh_on_reset(int reason) {
#ifdef APP_DEBUG
  printf("[INFO] Resetting state; reason=%d\n", reason);
#endif
}

static void blemesh_on_sync(void) {
  int err;
  ble_addr_t addr;
#ifdef APP_DEBUG
  printf("[INFO] Bluetooth initialized\n");
#endif
  /* Use NRPA */
  err = ble_hs_id_gen_rnd(1, &addr);
  assert(err == 0);
  err = ble_hs_id_set_rnd(addr.val);
  assert(err == 0);

  err = bt_mesh_init(addr.type, &prov, &comp);
  if (err) {
#ifdef APP_DEBUG
    printf("[INFO] Initializing mesh failed (err %d)\n", err);
#endif
    return;
  }

  if (IS_ENABLED(CONFIG_SETTINGS)) {
    settings_load();
  }

  if (bt_mesh_is_provisioned()) {
#ifdef APP_DEBUG
    printf("[INFO] Mesh network restored from flash\n");
#endif
  }

  bt_mesh_prov_enable(BT_MESH_PROV_GATT | BT_MESH_PROV_ADV);
#ifdef APP_DEBUG
  printf("[INFO] Mesh initialized\n");
#endif
}

int main(void) {
  /* Initialize OS */
  sysinit();
#ifdef APP_DEBUG
  printf("[INFO] System initializing...\n");
#endif

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
