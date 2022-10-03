#ifndef MESH_LOGIC_H
#define MESH_LOGIC_H

#include <stdint.h>


void bt_ready(int err);
void mesh_publish_state(uint8_t channel, uint8_t new_state);

#endif
