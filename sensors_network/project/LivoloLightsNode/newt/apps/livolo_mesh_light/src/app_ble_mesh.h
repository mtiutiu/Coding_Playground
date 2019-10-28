#ifndef APP_BLE_MESH_H
#define APP_BLE_MESH_H

#define BT_MESH_MODEL_OP_GEN_ONOFF_GET        BT_MESH_MODEL_OP_2(0x82, 0x01)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET        BT_MESH_MODEL_OP_2(0x82, 0x02)
#define BT_MESH_MODEL_OP_GEN_ONOFF_SET_UNACK  BT_MESH_MODEL_OP_2(0x82, 0x03)
#define BT_MESH_MODEL_OP_GEN_ONOFF_STATUS     BT_MESH_MODEL_OP_2(0x82, 0x04)

void blemesh_on_reset(int reason);
void blemesh_on_sync(void);


#endif