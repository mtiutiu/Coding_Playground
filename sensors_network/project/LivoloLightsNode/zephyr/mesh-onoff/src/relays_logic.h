#ifndef RELAYS_LOGIC_H
#define RELAYS_LOGIC_H

#define LOW   0
#define HIGH  1

#define RELAY1_SET_PIN 0
#define RELAY1_RESET_PIN 6
#define RELAY2_SET_PIN 5
#define RELAY2_RESET_PIN 1

#define LIGHT_CHANNELS        1
#define LIGHT_CHANNEL_1_INDEX 0

void ch1_relay_toggle(void);
void set_ch1_relay_state(uint8_t new_state);
uint8_t get_ch1_relay_state(void);

#endif
