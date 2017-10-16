#!/usr/bin/env python3

# Using this great python3 library: https://github.com/getsenic/gatt-python

import gatt
import time
import sys
import signal
import logging

#BLE_LIVOLO_DEVICE_ADDRESS = 'c2:8a:74:27:11:7b'
#BLE_LIVOLO_DEVICE_ADDRESS = 'de:62:20:8f:8e:91'
LIVOLO_LIGHTS_SERVICE_UUID = 'ccc0'
LIVOLO_BLE_SWITCH_ONE_UUID = 'bbb0'
LIVOLO_BLE_SWITCH_TWO_UUID = 'bbb1'

class LivoloDevice(gatt.Device):
  def connect_succeeded(self):
    super().connect_succeeded()
    logging.debug("[%s] Connected to: %s" % (self.mac_address, self.alias()))

  def connect_failed(self, error):
    super().connect_failed(error)
    logging.debug("[%s] Connection failed: %s" % (self.mac_address, str(error)))
    self.manager.stop()

  def disconnect_succeeded(self):
    super().disconnect_succeeded()
    logging.debug("[%s] Disconnected" % (self.mac_address))
    self.manager.stop()

  def characteristic_enable_notification_succeeded(self):
    logging.debug("[%s] Characteristic notifications subscription succeded" % (self.mac_address))

  def characteristic_enable_notification_failed(self, error):
    logging.debug("[%s] Characteristic notifications subscription failed with error: %s" % (self.mac_address, str(error)))

  def services_resolved(self):
    super().services_resolved()

    # logger.debug("[%s] Resolved services" % (self.mac_address))
    # for service in self.services:
    #   logger.debug("[%s]  Service [%s]" % (self.mac_address, service.uuid))
    #   for characteristic in service.characteristics:
    #     logger.debug("[%s]    Characteristic [%s]" % (self.mac_address, characteristic.uuid))

    livolo_device_lights_service = next(
      s for s in self.services
      if LIVOLO_LIGHTS_SERVICE_UUID in s.uuid)

    for c in livolo_device_lights_service.characteristics:
      c.read_value()
      c.enable_notifications()

  def characteristic_value_updated(self, characteristic, value):
    if LIVOLO_BLE_SWITCH_ONE_UUID in characteristic.uuid:
      logging.debug("[%s] Light1 state: %s" % (self.mac_address, int.from_bytes(value, byteorder='little')))

    if LIVOLO_BLE_SWITCH_TWO_UUID in characteristic.uuid:
      logging.debug("[%s] Light2 state: %s" % (self.mac_address, int.from_bytes(value, byteorder='little')))

def exit_cleanly(message):
  logging.debug(message)

  if livolo_device.is_connected():
    logging.debug("[%s] Disconnecting" % (sys.argv[1]))
    livolo_device.disconnect()
  sys.exit(0)

def sigint_handler(signal, frame):
  exit_cleanly("SIGINT issued, exiting ...")

def setup():
  logging.basicConfig(
    level=logging.DEBUG,
    format="[%(asctime)s][%(levelname)s] => %(message)s"
  )

  signal.signal(signal.SIGINT, sigint_handler)

  global manager
  manager = gatt.DeviceManager(adapter_name='hci0')

  global livolo_device
  livolo_device = LivoloDevice(mac_address=sys.argv[1], manager=manager)

def main():
  while True:
    try:
      if not livolo_device.is_connected():
        logging.debug("[%s] Trying to connect ..." % (sys.argv[1]))
        livolo_device.connect()
        time.sleep(1)
      else:
        manager.run()
    except KeyboardInterrupt:
      exit_cleanly("Ctrl-C issued, exiting ...")

if __name__ == '__main__':
  if len(sys.argv) < 2:
    print("Usage: %s <ble_address>" % (sys.argv[0]))
    sys.exit(1)
  setup()
  main()
