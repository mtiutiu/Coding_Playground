#ifndef USB_MAIN_H
#define USB_MAIN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// this is libusb, see http://libusb.sourceforge.net/ 
#include <usb.h>

#define VENDOR_ID		0x4242
#define	VENDOR_NAME		"eltech.org"
#define PRODUCT_ID		0xE131
#define	PRODUCT_NAME	"IR HID Keyboard"

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

static char usb_err_buff[255];
static char usb_msg_buff[255];

// used to get descriptor strings for device identification 
int usbGetDescriptorString(usb_dev_handle *dev, int index, 
							int langid, char *buf, int buflen);
                                  
usb_dev_handle * usbOpenDevice(int vendor, const char *vendorName, 
                               int product, const char *productName,
                               char* error_buff);
                                      
int usbdev_send_rcv(int vendor, const char *vendorName, 
                    int product, const char *productName,
                    int ctrl_msg, char* data_buff,
                    char* error_buff);
                    
void scan_irhid_device(char* scan_result);              
#endif
