#ifndef MESH_LOGIC_H
#define MESH_LOGIC_H

#include <stdint.h>

void init_pub(void);
void blemesh_on_reset(int reason);
void blemesh_on_sync(void);
void mesh_publish_state(uint8_t channel, uint8_t new_state);

#endif
