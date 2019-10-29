#ifndef APP_BLE_MESH_H
#define APP_BLE_MESH_H

#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)


typedef struct user_cb {
  void (*get_handler)(uint8_t *data);
  void (*set_handler)(uint8_t data);
} user_cb;

void app_ble_mesh_register_user_onoff_cb(user_cb *cbs);
void blemesh_on_reset(int reason);
void blemesh_on_sync(void);

#endif
