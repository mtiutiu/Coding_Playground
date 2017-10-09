#!/usr/bin/env python

# git clone https://github.com/IanHarvey/bluepy.git
# git checkout 7d28646
# cd bluepy/bluepy
# make; make install

import binascii
import struct
import time
import sys
#import threading
#import logging
from bluepy.bluepy.btle import UUID, Peripheral, BTLEException

BLE_LIVOLO_DEVICE_ADDRESS = 'C2:8A:74:27:11:7B'
LIVOLO_BLE_SWITCH_ONE_UUID = UUID(0xBBB0)
LIVOLO_BLE_SWITCH_TWO_UUID = UUID(0xBBB1)

def ble_translate_exception(ex):
  if ex.code == BTLEException.DISCONNECTED:
    print("Caught exception: DISCONNECTED")
  elif ex.code == BTLEException.COMM_ERROR:
    print("Caught exception: COMM_ERROR")
  elif ex.code == BTLEException.INTERNAL_ERROR:
    print("Caught exception: INTERNAL_ERROR")
  elif ex.code == BTLEException.GATT_ERROR:
    print("Caught exception: GATT_ERROR")
  else:
    print("Caught exception: MGMT_ERROR")

def ble_connect(address):
  try:
    p.connect(address, "random")
  except BTLEException as ex:
    ble_translate_exception(ex)
    return False
  return True


def ble_connect_with_retry(device_addr):
  print("Trying to connect to: %s" % device_addr)
  while True:
    if not ble_connect(device_addr):
      print("Failed to connect to: %s, retrying ..." % device_addr)
    else:
      print("Connected to: %s" % device_addr)
      return


def ble_get_characterstic_by_uuid(uuid_to_query):
  return p.getCharacteristics(uuid=uuid_to_query)[0]

def ble_fetch_ch_data(characteristic):
  if (characteristic.supportsRead()):
    val = binascii.b2a_hex(characteristic.read())
    val = binascii.unhexlify(val)
    val = struct.unpack(len(val)*"B", val)[0]
    return str(val)

def ble_livolo_attach():
  ble_connect_with_retry(BLE_LIVOLO_DEVICE_ADDRESS)
  return (ble_get_characterstic_by_uuid(LIVOLO_BLE_SWITCH_ONE_UUID),
          ble_get_characterstic_by_uuid(LIVOLO_BLE_SWITCH_TWO_UUID))

def setup():
  global p
  p = Peripheral()

def main():
  livolo_ch1_char, livolo_ch2_char = ble_livolo_attach()

  while True:
    try:
      channel1_state = ble_fetch_ch_data(livolo_ch1_char)
      channel2_state = ble_fetch_ch_data(livolo_ch2_char)
      print("Lights state => CH1: %s CH2: %s" % (channel1_state, channel2_state))
    except KeyboardInterrupt:
      if p is not None:
        print("Catched Ctrl+C, disconnecting ...")
        p.disconnect()
      sys.exit(0)
    except BTLEException as ex:
      ble_translate_exception(ex)
      livolo_ch1_char, livolo_ch2_char = ble_livolo_attach()

    time.sleep(1)

if __name__ == "__main__":
  setup()
  main()
