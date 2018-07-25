/* ========================================
*
* Copyright YOUR COMPANY, THE YEAR
* All Rights Reserved
* UNPUBLISHED, LICENSED SOFTWARE.
*
* CONFIDENTIAL AND PROPRIETARY INFORMATION
* WHICH IS THE PROPERTY OF your company.
*
* ========================================
*/
#include <project.h>

#define LIVOLO_CHANNELS 2
#define RELAY_COILS 	2

#define FALSE 0
#define TRUE  1

#define LOW   0
#define HIGH  1

#define OFF   0
#define ON    1

#define WDT_TIMER0_BASE_INTERVAL_MS       10
#define WDT_TIMER0_30MS_DELAY             (30 / WDT_TIMER0_BASE_INTERVAL_MS)
#define WDT_TIMER0_50MS_DELAY             (50 / WDT_TIMER0_BASE_INTERVAL_MS)
#define WDT_TIMER0_100MS_DELAY            (100 / WDT_TIMER0_BASE_INTERVAL_MS)
#define WDT_TIMER0_1000MS_DELAY           (1000 / WDT_TIMER0_BASE_INTERVAL_MS)

const uint8 ALLOWED_CENTRAL_ADDR[] = {
  0x5c,
  0xf3,
  0x70,
  0x8d,
  0x1f,
  0xbc
};


typedef void (*Light_State_Write)(uint8);
typedef uint8 (*Light_State_Read)(void);
typedef void (*Relay_State_Write)(uint8);

uint8 light_state[] = {
  OFF,
  OFF
};

Light_State_Write slw[] = {
  Light1_State_Led_Write,
  Light2_State_Led_Write
};

//Light_State_Read slr[] = {
//  Light1_State_Led_Read,
//  Light2_State_Led_Read
//};

uint16 LIGHT_CHAR_HANDLES[] = {
  CYBLE_LIGHTS_CHANNEL1_CHAR_HANDLE,
  CYBLE_LIGHTS_CHANNEL2_CHAR_HANDLE
};

Relay_State_Write rsrcw[][RELAY_COILS] = {
  { Relay1_Reset_Coil_Write, Relay1_Set_Coil_Write},
  { Relay2_Reset_Coil_Write, Relay2_Set_Coil_Write}
};

#define MAX_ACTION_SLOTS  5
typedef void (*cb_ptr)(uint8);

typedef struct {
  cb_ptr callback;
  uint8 callback_args;
  uint32 delay_ticks;
  uint32 ticks_counter;
  uint8 enabled;
} Action_T;

static Action_T delayed_action[MAX_ACTION_SLOTS];

void Wdt_Isr_Handler(void) {
  for(uint8 slot = 0; slot < MAX_ACTION_SLOTS; slot++) {
    if(delayed_action[slot].enabled && ++delayed_action[slot].ticks_counter >= delayed_action[slot].delay_ticks) {
      delayed_action[slot].callback(delayed_action[slot].callback_args);
      delayed_action[slot].ticks_counter = 0;
      delayed_action[slot].enabled = FALSE;
    }
  }
}

void Pulse_Relay(uint8 channel) {
  rsrcw[channel][light_state[channel]](HIGH);
  delayed_action[channel].delay_ticks = WDT_TIMER0_50MS_DELAY;
  delayed_action[channel].callback = rsrcw[channel][light_state[channel]];
  delayed_action[channel].callback_args = LOW;
  delayed_action[channel].enabled = TRUE;
}

void Toggle_Relay_State(uint8 channel) {
  light_state[channel] = !light_state[channel];
  slw[channel](!light_state[channel]);
  Pulse_Relay(channel);
}

void Set_Relay_State(uint8 channel, uint8 state, uint8 force_state) {
  // don't pulse the relay if the new state is the same as the old state or not forced
  if(!force_state && (state == light_state[channel])) {
    return;
  }
  
  light_state[channel] = state;
  slw[channel](!light_state[channel]);
  Pulse_Relay(channel);
}

void Update_Lights_Ble_Handle(uint16 handle, uint8 value) {
  CYBLE_GATT_HANDLE_VALUE_PAIR_T light_state_handle;
  light_state_handle.attrHandle = handle;
  light_state_handle.value.val = &value;
  light_state_handle.value.len = 1;
  light_state_handle.value.actualLen = 1;
  
  CyBle_GattsWriteAttributeValue(&light_state_handle, 0, &cyBle_connHandle, CYBLE_GATT_DB_LOCALLY_INITIATED);
}

void Update_Lights_Ble_Handles() {
  for(uint8 i = 0; i < LIVOLO_CHANNELS; i++) {
    Update_Lights_Ble_Handle(LIGHT_CHAR_HANDLES[i], light_state[i]);
  }
}

uint8_t Find_Match(const uint8 token, const uint8 source[], uint8 size) {
  for(uint8 i = 0; i < size; i++) {
      if(token == source[i]) {
        return TRUE;
      }
    }
  return FALSE;
}

uint8 Is_Central_Address_Valid(const uint8 central_addr[]) {
  for(uint8 i = 0; i < sizeof(ALLOWED_CENTRAL_ADDR); i++) {
    if(!Find_Match(ALLOWED_CENTRAL_ADDR[i], central_addr, sizeof(ALLOWED_CENTRAL_ADDR))) {
      return FALSE;
    }
  }
  return TRUE;
}

void Ble_Stack_Handler(uint32 event, void* eventParam){
  CYBLE_GATTS_WRITE_REQ_PARAM_T *wrReqParam;
  CYBLE_GAP_BD_ADDR_T central_addr;
  
  switch(event) {
    case CYBLE_EVT_STACK_ON:
    case CYBLE_EVT_GAP_DEVICE_DISCONNECTED:
      /* Start Advertisement and enter Discoverable mode*/
      CyBle_GappStartAdvertisement(CYBLE_ADVERTISING_FAST);
      break;
    case CYBLE_EVT_GAPP_ADVERTISEMENT_START_STOP:
      if(CyBle_GetState() == CYBLE_STATE_DISCONNECTED){
        /* Start Advertisement and enter Discoverable mode*/
        CyBle_GappStartAdvertisement(CYBLE_ADVERTISING_FAST);
      }
		  break;
    case CYBLE_EVT_GAP_DEVICE_CONNECTED:
      CyBle_GapGetPeerBdAddr(cyBle_connHandle.bdHandle, &central_addr);
      if (!Is_Central_Address_Valid(central_addr.bdAddr)) {
        CyBle_GapDisconnect(cyBle_connHandle.bdHandle);
        break;
      }
      Update_Lights_Ble_Handles();
      break;
    case CYBLE_EVT_GATTS_WRITE_REQ:
      wrReqParam = (CYBLE_GATTS_WRITE_REQ_PARAM_T*) eventParam;
      // handle light 1 characteristic
      if (wrReqParam->handleValPair.attrHandle == CYBLE_LIGHTS_CHANNEL1_CHAR_HANDLE) {
        uint8 new_state = *wrReqParam->handleValPair.value.val;
        Set_Relay_State(CYBLE_LIGHTS_CHANNEL1_CHAR_INDEX, new_state, FALSE);
        
        // update attribute value in the gatt database
        Update_Lights_Ble_Handle(CYBLE_LIGHTS_CHANNEL1_CHAR_HANDLE, light_state[CYBLE_LIGHTS_CHANNEL1_CHAR_INDEX]);
      }
      //handle light 2 characteristic
      if (wrReqParam->handleValPair.attrHandle == CYBLE_LIGHTS_CHANNEL2_CHAR_HANDLE) {
        uint8 new_state = *wrReqParam->handleValPair.value.val;
        Set_Relay_State(CYBLE_LIGHTS_CHANNEL2_CHAR_INDEX, new_state, FALSE);
        
        // update attribute value in the gatt database
        Update_Lights_Ble_Handle(CYBLE_LIGHTS_CHANNEL2_CHAR_HANDLE, light_state[CYBLE_LIGHTS_CHANNEL2_CHAR_INDEX]);
      }
      CyBle_GattsWriteRsp(cyBle_connHandle);  // send response - very important otherwise the client will disconnect
      break;
    default: break;
  }
}

void Ble_Send_Touch_Btn_State_Notification(uint8 state, uint16 handle) {
  if(CyBle_GetState() != CYBLE_STATE_CONNECTED) {
    return;
  }
  
  CYBLE_GATTS_HANDLE_VALUE_NTF_T touch_sensor_notif_handle;
  touch_sensor_notif_handle.attrHandle = handle;
  touch_sensor_notif_handle.value.val = (uint8*) &state;
  touch_sensor_notif_handle.value.len = 1;
  
  Update_Lights_Ble_Handle(handle, state);
  CyBle_GattsNotification(cyBle_connHandle, &touch_sensor_notif_handle);
}

void Check_Touch_Btn(uint8 btn_index){
  static uint32 pressed_counter[CapSense_TOTAL_SENSOR_COUNT];
  
  // debouncing is needed here
  if(CapSense_CheckIsWidgetActive(btn_index)) {
    if(++pressed_counter[btn_index] == 1) {
      Toggle_Relay_State(btn_index);
      Ble_Send_Touch_Btn_State_Notification(light_state[btn_index], LIGHT_CHAR_HANDLES[btn_index]);
    }
  } else {
    pressed_counter[btn_index] = 0;
    // synchronize with BLE module before deepsleep
    if (CyBle_GetBleSsState() == CYBLE_BLESS_STATE_DEEPSLEEP) {
      CapSense_Sleep();
      CySysPmDeepSleep();
      CapSense_Wakeup();
    }
  }
}

void Check_Touch_Activity(void) {
  if(!CapSense_IsBusy()) {
    for(uint8 btn_index = 0; btn_index < CapSense_TOTAL_SENSOR_COUNT; btn_index++) {
      Check_Touch_Btn(btn_index);
    }
    
    CapSense_UpdateEnabledBaselines();
    CapSense_ScanEnabledWidgets();
    
    // go to sleep while sensors are scanned in background
    CySysPmSleep();
  }
}

int main (void) {
  CyGlobalIntEnable;
  
  // wdt 0 is configured to fire at a ~10ms interval in the Clocks section
  CySysWdtSetInterruptCallback(CY_SYS_WDT_COUNTER0, Wdt_Isr_Handler);
  
  // start relays in a known state beforehand
  for(uint8 i = 0; i < LIVOLO_CHANNELS; i++) {
    uint8 need_to_reset_relay =  CySysGetResetReason(CY_SYS_RESET_WDT) != CY_SYS_RESET_WDT;
    Set_Relay_State(i, OFF, need_to_reset_relay);
  }
  
  // ble start
  CyBle_Start(Ble_Stack_Handler);
  
  // capsense start/init
  CapSense_Start();
  CapSense_InitializeAllBaselines();
  CapSense_ScanEnabledWidgets();
  
  for(;;) {
    CySysWdtResetCounters(CY_SYS_WDT_COUNTER1_RESET);
    CyDelayUs(150); //clearing watchdog counter requires several LFCLK cycles to take effect
    
    Check_Touch_Activity();
    
    CyBle_ProcessEvents();
    // synchronize with capsense module before deepsleep
    if((CyBle_EnterLPM(CYBLE_BLESS_DEEPSLEEP) == CYBLE_BLESS_DEEPSLEEP) && !CapSense_IsBusy()) {
      CapSense_Sleep();
      CySysPmDeepSleep();
      CapSense_Wakeup();
    }
  }
}

/* [] END OF FILE */
