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

#include <assert.h>
#include "os/mynewt.h"
#include "mesh/mesh.h"
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
#include "console/console.h"
#endif
#include "hal/hal_system.h"
#include "hal/hal_gpio.h"
#include "bsp/bsp.h"

/* BLE */
#include "nimble/ble.h"
#include "host/ble_hs.h"
#include "services/gap/ble_svc_gap.h"
#include "mesh/glue.h"

/* Company ID */
#define CID_NUMBER 0x05C3

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

static const struct bt_mesh_health_srv_cb health_srv_cb = {};
static struct bt_mesh_health_srv health_srv = {
    .cb = &health_srv_cb,
};

static struct bt_mesh_model_pub health_pub;
static struct bt_mesh_model_pub gen_onoff_pub;
static uint8_t gen_on_off_state;


static void gen_onoff_status(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx) {
    struct os_mbuf *msg = NET_BUF_SIMPLE(3);
    uint8_t *status;
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("#mesh-onoff STATUS\n");
#endif
    bt_mesh_model_msg_init(msg, BT_MESH_MODEL_OP_2(0x82, 0x04));
    status = net_buf_simple_add(msg, 1);
    *status = gen_on_off_state;

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

static void gen_onoff_set(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("#mesh-onoff SET\n");
#endif

    gen_on_off_state = buf->om_data[0];
    hal_gpio_write(LED_1, gen_on_off_state);

    gen_onoff_status(model, ctx);
}

static void gen_onoff_set_unack(struct bt_mesh_model *model, struct bt_mesh_msg_ctx *ctx, struct os_mbuf *buf) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("#mesh-onoff SET-UNACK\n");
#endif

    gen_on_off_state = buf->om_data[0];
    hal_gpio_write(LED_1, gen_on_off_state);
}

static const struct bt_mesh_model_op gen_onoff_op[] = {
    { BT_MESH_MODEL_OP_2(0x82, 0x01), 0, gen_onoff_get },
    { BT_MESH_MODEL_OP_2(0x82, 0x02), 2, gen_onoff_set },
    { BT_MESH_MODEL_OP_2(0x82, 0x03), 2, gen_onoff_set_unack },
    BT_MESH_MODEL_OP_END,
};

static struct bt_mesh_model root_models[] = {
    BT_MESH_MODEL_CFG_SRV(&cfg_srv),
    BT_MESH_MODEL_HEALTH_SRV(&health_srv, &health_pub),
    BT_MESH_MODEL(BT_MESH_MODEL_ID_GEN_ONOFF_SRV, gen_onoff_op, &gen_onoff_pub, NULL)
};

static struct bt_mesh_elem elements[] = {
    BT_MESH_ELEM(0, root_models, BT_MESH_MODEL_NONE),
};

static const struct bt_mesh_comp comp = {
    .cid = CID_NUMBER,
    .elem = elements,
    .elem_count = ARRAY_SIZE(elements),
};

static int output_number(bt_mesh_output_action_t action, uint32_t number) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("OOB Number: %lu\n", number);
#endif
    return 0;
}

static void prov_complete(u16_t net_idx, u16_t addr) {
#if (MYNEWT_VAL(BSP_UART_CONSOLE))
    console_printf("Local node provisioned, primary address 0x%04x\n", addr);
#endif
}

static const uint8_t dev_uuid[16] = MYNEWT_VAL(BLE_MESH_DEV_UUID);

static const struct bt_mesh_prov prov = {
    .uuid = dev_uuid,
    .output_size = 4,
    .output_actions = BT_MESH_DISPLAY_NUMBER | BT_MESH_BEEP | BT_MESH_VIBRATE | BT_MESH_BLINK,
    .output_number = output_number,
    .complete = prov_complete,
};

static void blemesh_on_reset(int reason) {
    BLE_HS_LOG(ERROR, "Resetting state; reason=%d\n", reason);
}

static void blemesh_on_sync(void) {
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

int main(int argc, char **argv) {

#ifdef ARCH_sim
    mcu_sim_parse_args(argc, argv);
#endif

    /* Initialize OS */
    sysinit();

    /* Initialize the NimBLE host configuration. */
    ble_hs_cfg.reset_cb = blemesh_on_reset;
    ble_hs_cfg.sync_cb = blemesh_on_sync;
    ble_hs_cfg.store_status_cb = ble_store_util_status_rr;

    hal_gpio_init_out(LED_1, 0);

    while (1) {
        os_eventq_run(os_eventq_dflt_get());
    }
    return 0;
}
