/*---------------------------------------------------------------------------------------------------------------------------------------------------
 * 
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
//#include "uart.h"
#include "irmp.h"
#include "usbdrv.h"

#ifndef F_CPU
#error F_CPU unkown
#endif

/*#ifndef BAUD_RATE
#define BAUD_RATE	9600
#endif*/

#define USB_KEYS_MAP_SIZE	83
#define BUFFER_SIZE		4

#define USB_IRHID_SET_STATE		7
#define USB_IRHID_CHECK_STATE	8
#define USB_IRHID_STORE_KEY		9
#define USB_IRHID_CHECK_ALIVE	10

#define IRHID_LEARNING		11
#define	IRHID_DEFAULT		12
#define	IRHID_IDLE			13
#define IRKEY_STORED		14
#define IRKEY_NOT_STORED	15
#define IRKEY_SAME_KEY		16
#define IRKEY_DUPLICATE_KEY	17
#define IRKEY_MAP_FULL		18

//static char serial_buff[30];
static uint8_t vendor_buff[4];				/* buffer for vendor specific implementations */
static uint8_t hid_buffer[BUFFER_SIZE];    /* buffer for HID reports */
static uint8_t idle_rate;           /* in 4 ms units */
static uint8_t irhid_status = IRHID_DEFAULT;
static uint16_t current_ir_keycode = 0;
static uint8_t new_ir_key_press = 0;

static EEMEM uint16_t usbkeys_ir_mappings[USB_KEYS_MAP_SIZE];

PROGMEM const char usbHidReportDescriptor[35] = { /* USB report descriptor */
  0x05, 0x01,                    // USAGE_PAGE (Generic Desktop) 
  0x09, 0x06,                    // USAGE (Keyboard) 
  0xa1, 0x01,                    // COLLECTION (Application) 
  0x05, 0x07,                    //   USAGE_PAGE (Keyboard) 
  0x19, 0xe0,                    //   USAGE_MINIMUM (Keyboard LeftControl) 
  0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI) 
  0x15, 0x00,                    //   LOGICAL_MINIMUM (0) 
  0x25, 0x01,                    //   LOGICAL_MAXIMUM (1) 
  0x75, 0x01,                    //   REPORT_SIZE (1) 
  0x95, 0x08,                    //   REPORT_COUNT (8) 
  0x81, 0x02,                    //   INPUT (Data,Var,Abs) 
  0x95, BUFFER_SIZE-1,           //   REPORT_COUNT (simultaneous keystrokes) 
  0x75, 0x08,                    //   REPORT_SIZE (8) 
  0x25, 0x65,                    //   LOGICAL_MAXIMUM (101) 
  0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated)) 
  0x29, 0x65,                    //   USAGE_MAXIMUM (Keyboard Application) 
  0x81, 0x00,                    //   INPUT (Data,Ary,Abs) 
  0xc0                           // END_COLLECTION 
};

uint8_t get_usb_key_code(uint16_t ir_key_code) {
	for(uint8_t i = 0; i < USB_KEYS_MAP_SIZE; i++) {
		if(eeprom_read_word(&usbkeys_ir_mappings[i]) == ir_key_code) {
			return i;
		}
	}
	
	return 0;
}

uint8_t ir_key_code_exists(uint16_t ir_key_code) {
	for(uint8_t i = 0; i < USB_KEYS_MAP_SIZE; i++) {
		if(eeprom_read_word(&usbkeys_ir_mappings[i]) == ir_key_code) {
			return 1;
		}
	}
	
	return 0;
}

void send_key_stroke(uint8_t key_code, uint8_t modifiers) {
    while (!usbInterruptIsReady()) {
      // Note: We wait until we can send keystroke
      //       so we know the previous keystroke was
      //       sent.
    }
      
    memset(hid_buffer, 0, sizeof(hid_buffer));

    hid_buffer[0] = modifiers;
    hid_buffer[1] = key_code;
        
    usbSetInterrupt(hid_buffer, sizeof(hid_buffer));

    while (!usbInterruptIsReady()) {
      // Note: We wait until we can send keystroke
      //       so we know the previous keystroke was
      //       sent.
    }
      
    // This stops endlessly repeating keystrokes:
    memset(hid_buffer, 0, sizeof(hid_buffer));      
    usbSetInterrupt(hid_buffer, sizeof(hid_buffer));
}

uint8_t usbFunctionSetup(uint8_t data[8]) {
	usbRequest_t *rq = (void *)data;
    usbMsgPtr = hid_buffer;
    
    if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS) {    /* class request type */
        switch(rq->bRequest) {
			case USBRQ_HID_GET_REPORT:
				return 0;
			case USBRQ_HID_GET_IDLE:
				return 0;
			case USBRQ_HID_SET_IDLE:
				idle_rate = rq->wValue.bytes[1];
		}
	} else {
        /* vendor specific requests implementations */
        switch(rq->bRequest) {
			case USB_IRHID_SET_STATE:
				irhid_status = rq->wValue.bytes[0];
				return 0;
			case USB_IRHID_CHECK_STATE:
				memset(vendor_buff, 0, sizeof(vendor_buff));
				vendor_buff[0] = irhid_status;
				usbMsgPtr = vendor_buff;
				return sizeof(vendor_buff);
			case USB_IRHID_CHECK_ALIVE:
				memset(vendor_buff, 0, sizeof(vendor_buff));
				strcpy_P((char*)vendor_buff, PSTR("IRH"));
				usbMsgPtr = vendor_buff;
				return sizeof(vendor_buff);
			case USB_IRHID_STORE_KEY:
				memset(vendor_buff, 0, sizeof(vendor_buff));
				vendor_buff[0] = rq->wValue.bytes[0];
				vendor_buff[1] = rq->wValue.bytes[1];
				vendor_buff[2] = rq->wIndex.bytes[0];
				vendor_buff[3] = rq->wIndex.bytes[1];
				if((irhid_status == IRHID_LEARNING) && new_ir_key_press) {
					if(vendor_buff[0] < USB_KEYS_MAP_SIZE) {
						if(eeprom_read_word(&usbkeys_ir_mappings[vendor_buff[0]]) == current_ir_keycode) {
							vendor_buff[2] = IRKEY_NOT_STORED;
							vendor_buff[3] = IRKEY_SAME_KEY;
						} else if(ir_key_code_exists(current_ir_keycode)) {
							vendor_buff[2] = IRKEY_NOT_STORED;
							vendor_buff[3] = IRKEY_DUPLICATE_KEY;
						} else {
							eeprom_update_word(&usbkeys_ir_mappings[vendor_buff[0]], current_ir_keycode);
							vendor_buff[0] = (uint8_t)(current_ir_keycode & 0x00FF);
							vendor_buff[1] = (uint8_t)(current_ir_keycode >> 8);
							vendor_buff[2] = IRKEY_STORED;
						}
					} else {
						vendor_buff[2] = IRKEY_NOT_STORED;
						vendor_buff[3] = IRKEY_MAP_FULL;
					}
					new_ir_key_press = 0;
				} else {
					vendor_buff[3] = IRHID_IDLE;
				}
				
				usbMsgPtr = vendor_buff;
				return sizeof(vendor_buff);
		}
    }
	return 0;
}

void timer1_init (void) {
#if defined (__AVR_ATtiny45__) || defined (__AVR_ATtiny85__)                // ATtiny45 / ATtiny85:

#if F_CPU >= 16000000L
    OCR1C   =  (F_CPU / F_INTERRUPTS / 8) - 1;                              // compare value: 1/15000 of CPU frequency, presc = 8
    TCCR1   = (1 << CTC1) | (1 << CS12);                                    // switch CTC Mode on, set prescaler to 8
#else
    OCR1C   =  (F_CPU / F_INTERRUPTS / 4) - 1;                              // compare value: 1/15000 of CPU frequency, presc = 4
    TCCR1   = (1 << CTC1) | (1 << CS11) | (1 << CS10);                      // switch CTC Mode on, set prescaler to 4
#endif

#else                                                                       // ATmegaXX:
    OCR1A   =  (F_CPU / F_INTERRUPTS) - 1;                                  // compare value: 1/15000 of CPU frequency
    TCCR1B  = (1 << WGM12) | (1 << CS10);                                   // switch CTC Mode on, set prescaler to 1
#endif

#ifdef TIMSK1
    TIMSK1  = 1 << OCIE1A;                                                  // OCIE1A: Interrupt by timer compare
#else
    TIMSK   = 1 << OCIE1A;                                                  // OCIE1A: Interrupt by timer compare
#endif
}

/*---------------------------------------------------------------------------------------------------------------------------------------------------
 * Timer 1 output compare A interrupt service routine, called every 1/15000 sec
 *---------------------------------------------------------------------------------------------------------------------------------------------------
 */
#ifdef TIM1_COMPA_vect                                                      // ATtiny84
ISR(TIM1_COMPA_vect, ISR_NOBLOCK)
#else
ISR(TIMER1_COMPA_vect, ISR_NOBLOCK)
#endif 
{
  (void) irmp_ISR();                                                        // call irmp ISR
  // call other timer interrupt routines...
}

int main (void) {
    IRMP_DATA irmp_data;
	
	cli();
	
	usbInit();
    irmp_init();                                                            // initialize irmp
    timer1_init();
    //uart_init(UART_BAUD_SELECT(BAUD_RATE, F_CPU));                        // initialize timer 1
    
    usbDeviceDisconnect();
    for(uint8_t i=0;i<20;i++){  /* 300 ms disconnect */
        _delay_ms(15);
    }
    usbDeviceConnect();
    
    wdt_enable(WDTO_1S);
    
    sei ();                                                                 // enable interrupts

    for (;;) {
       if (irmp_get_data (&irmp_data)) {
            // ir signal decoded, do something here...
            // irmp_data.protocol is the protocol, see irmp.h
            // irmp_data.address is the address/manufacturer code of ir sender
            // irmp_data.command is the command code
            // irmp_protocol_names[irmp_data.protocol] is the protocol name (if enabled, see irmpconfig.h)
            current_ir_keycode = irmp_data.command;
            new_ir_key_press = 1;
            
			if(irhid_status != IRHID_LEARNING) {
				send_key_stroke(get_usb_key_code(current_ir_keycode), 0);
			}
        }
		
        usbPoll();
        wdt_reset();
    }
}
