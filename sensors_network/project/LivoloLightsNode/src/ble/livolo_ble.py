#!/usr/bin/env python3

import gatt
import time
import sys

BLE_LIVOLO_DEVICE_ADDRESS = 'c2:8a:74:27:11:7b'
LIVOLO_LIGHTS_SERVICE_UUID = 'ccc0'
LIVOLO_BLE_SWITCH_ONE_UUID = 'bbb0'
LIVOLO_BLE_SWITCH_TWO_UUID = 'bbb1'

class LivoloDevice(gatt.Device):
  def connect_succeeded(self):
    super().connect_succeeded()
    print("[%s] Connected to -> %s" % (self.mac_address, self.alias()))

  def connect_failed(self, error):
    super().connect_failed(error)
    print("[%s] Connection failed: %s" % (self.mac_address, str(error)))
    time.sleep(1)
    print("[%s] Trying to reconnect ..." % (self.mac_address))
    self.connect()

  def disconnect_succeeded(self):
    super().disconnect_succeeded()
    print("[%s] Disconnected" % (self.mac_address))
    time.sleep(1)
    print("[%s] Trying to reconnect ..." % (self.mac_address))
    self.connect()

  def characteristic_enable_notification_succeeded(self):
    print("[%s] Characteristic notifications subscription succeded" % (self.mac_address))

  def characteristic_enable_notification_failed(self, error):
    print("[%s] Characteristic notifications subscription failed with error: %s" % (self.mac_address, str(error)))

  def services_resolved(self):
    super().services_resolved()

    # print("[%s] Resolved services" % (self.mac_address))
    # for service in self.services:
    #   print("[%s]  Service [%s]" % (self.mac_address, service.uuid))
    #   for characteristic in service.characteristics:
    #     print("[%s]    Characteristic [%s]" % (self.mac_address, characteristic.uuid))

    livolo_device_lights_service = next(
      s for s in self.services
      if LIVOLO_LIGHTS_SERVICE_UUID in s.uuid)

    for c in livolo_device_lights_service.characteristics:
      c.read_value()
      c.enable_notifications()

  def characteristic_value_updated(self, characteristic, value):
    if LIVOLO_BLE_SWITCH_ONE_UUID in characteristic.uuid:
      print("Light1 state: %s" % int.from_bytes(value, byteorder='little'))

    if LIVOLO_BLE_SWITCH_TWO_UUID in characteristic.uuid:
      print("Light2 state: %s" % int.from_bytes(value, byteorder='little'))

def setup():
  global manager
  manager = gatt.DeviceManager(adapter_name='hci0')

  global livolo_device
  livolo_device = LivoloDevice(mac_address=sys.argv[1], manager=manager)
  livolo_device.connect()

def main():
  try:
    manager.run()
  except KeyboardInterrupt:
    print("Ctrl-C, exiting ...")
    if livolo_device.is_connected():
      livolo_device.disconnect()

if __name__ == '__main__':
  if len(sys.argv) < 2:
    print("Usage: %s <ble_address>" % (sys.argv[0]))
    sys.exit(1)

  setup()
  main()
