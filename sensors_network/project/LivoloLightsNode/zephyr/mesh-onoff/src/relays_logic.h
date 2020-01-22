#ifndef RELAYS_LOGIC_H
#define RELAYS_LOGIC_H


#define RELAY_TRIGGER_PULSE_DURATION_MS  20


void relay_toggle(uint8_t channel);
void set_relay_state(uint8_t channel, uint8_t new_state);
uint8_t get_relay_state(uint8_t channel);
void init_relays_gpio(void);

#endif
