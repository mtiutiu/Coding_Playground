#ifndef APP_BLE_MESH_H
#define APP_BLE_MESH_H

#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)

typedef struct gen_onoff_mesh_srv_model_cb {
  void (*get_handler)(uint8_t *data);
  void (*set_handler)(uint8_t data);
} gen_onoff_mesh_srv_model_cb;

void app_ble_mesh_register_gen_onoff_cb(gen_onoff_mesh_srv_model_cb *cbs);
void blemesh_on_reset(int reason);
void blemesh_on_sync(void);

#endif
