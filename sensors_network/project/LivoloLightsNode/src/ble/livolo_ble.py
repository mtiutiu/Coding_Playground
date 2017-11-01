#!/usr/bin/env python3

# Using this great python3 library: https://github.com/getsenic/gatt-python

import gatt
import time
import sys
import signal
import logging
import os
import subprocess
import paho.mqtt.client as mqtt
from mysensors_helper import g2m

#BLE_LIVOLO_DEVICE_ADDRESS = 'c2:8a:74:27:11:7b'
#BLE_LIVOLO_DEVICE_ADDRESS = 'de:62:20:8f:8e:91'
LIVOLO_LIGHTS_SERVICE_UUID = 'ccc0'
LIVOLO_BLE_SWITCH_ONE_UUID = 'bbb0'
LIVOLO_BLE_SWITCH_TWO_UUID = 'bbb1'

# ------------------------------ MQTT ------------------------------------------
# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
  logging.debug("Connected to mqtt broker: %s with result code: %s " % (sys.argv[2], rc))
  client.subscribe("mys-in/#")
  g2m(client, "10;1;0;0;3;Light1", "mys-out")
  g2m(client, "10;2;0;0;3;Light2", "mys-out")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
  data = msg.payload.decode('ascii')
  channel = int(msg.topic.split('/')[2])
  logging.debug("Received data: %s on topic: %s" % (data, msg.topic))
  livolo_device.lights_service.characteristics[channel-1].write_value([int(data)])
# ------------------------------------------------------------------------------

# -------------------------------------- BLE -----------------------------------
class LivoloDeviceManager(gatt.DeviceManager):
  def __init__(self, adapter_name):
    super().__init__(adapter_name)
    self.livolo_device_discovered = False

  def is_device_discovered(self):
    return self.livolo_device_discovered

  def device_discovered(self, device):
    if sys.argv[1] in device.mac_address:
      logging.debug("[%s] Discovered, alias = %s" % (device.mac_address, device.alias()))
      self.livolo_device_discovered = True
      self.stop_discovery()

  def make_device(self, mac_address):
    return LivoloDevice(mac_address=mac_address, manager=self)

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
    logging.debug("[%s] Services resolved" % (self.mac_address))
    super().services_resolved()

    # logger.debug("[%s] Resolved services" % (self.mac_address))
    # for service in self.services:
    #   logger.debug("[%s]  Service [%s]" % (self.mac_address, service.uuid))
    #   for characteristic in service.characteristics:
    #     logger.debug("[%s]    Characteristic [%s]" % (self.mac_address, characteristic.uuid))

    self.lights_service = next(
      s for s in self.services
      if LIVOLO_LIGHTS_SERVICE_UUID in s.uuid)

    for c in self.lights_service.characteristics:
      c.read_value()
      c.enable_notifications()

  def characteristic_value_updated(self, characteristic, value):
    if LIVOLO_BLE_SWITCH_ONE_UUID in characteristic.uuid:
      logging.debug("[%s] Light1 state: %s" % (self.mac_address, int.from_bytes(value, byteorder='little')))
      g2m(mqtt_client, "10;1;1;0;2;%s" % (int.from_bytes(value, byteorder='little')), "mys-out")

    if LIVOLO_BLE_SWITCH_TWO_UUID in characteristic.uuid:
      logging.debug("[%s] Light2 state: %s" % (self.mac_address, int.from_bytes(value, byteorder='little')))
      g2m(mqtt_client, "10;2;1;0;2;%s" % (int.from_bytes(value, byteorder='little')), "mys-out")

def exit_cleanly(message):
  logging.debug(message)

  if livolo_device.is_connected():
    logging.debug("[%s] Disconnecting" % (sys.argv[1]))
    livolo_device.disconnect()

  mqtt_client.disconnect()
  sys.exit(0)

def sigint_handler(signal, frame):
  exit_cleanly("SIGINT issued, exiting ...")

def sigterm_handler(signal, frame):
  exit_cleanly("SIGTERM issued, exiting ...")

def is_service_running(name):
  with open(os.devnull, 'wb') as hide_output:
    exit_code = subprocess.Popen(['service', name, 'status'], stdout=hide_output, stderr=hide_output).wait()
    return exit_code == 0

def check_bluetooth_service():
  while not is_service_running('bluetooth'):
    logging.debug("Bluetooth service is not running/ready, waiting ...")
    time.sleep(1)

def check_bluetooth_power():
  while not manager.is_adapter_powered:
    logging.debug("Bluetooth adapter is not powered, waiting ...")
    time.sleep(1)

def setup():
  logging.basicConfig(
    level=logging.DEBUG,
    format="[%(asctime)s][%(levelname)s] => %(message)s"
  )

  signal.signal(signal.SIGINT, sigint_handler)
  signal.signal(signal.SIGTERM, sigterm_handler)

  logging.debug("Instantiating Livolo manager ...")
  global manager
  manager = LivoloDeviceManager(adapter_name='hci0')

  logging.debug("Instantiating Livolo device ...")
  global livolo_device
  livolo_device = manager.make_device(mac_address=sys.argv[1])

  check_bluetooth_service()
  check_bluetooth_power()

  manager.start_discovery()

  logging.debug("Instantiating mqtt client ...")
  global mqtt_client
  mqtt_client = mqtt.Client(client_id="livolo_ble", clean_session=True, userdata=None, protocol=mqtt.MQTTv311)
  mqtt_client.on_connect = on_connect
  mqtt_client.on_message = on_message
  logging.debug("Connecting to mqtt broker: %s ..." %(sys.argv[2]))
  mqtt_client.connect(sys.argv[2], 1883, 60)
  logging.debug("Starting mqtt main loop thread ...")
  mqtt_client.loop_start()

def main():
  logging.debug("Entering main loop ...")
  while True:
    try:
      check_bluetooth_service()
      check_bluetooth_power()
      if not manager.is_device_discovered():
        logging.debug("Livolo device wasn't discovered, waiting ...")
        time.sleep(1)
      if not livolo_device.is_connected():
        logging.debug("[%s] Trying to connect ..." % (sys.argv[1]))
        livolo_device.connect()
        time.sleep(1)
      else:
        manager.run()
    except KeyboardInterrupt:
      exit_cleanly("Ctrl-C issued, exiting ...")

if __name__ == '__main__':
  if len(sys.argv) < 3:
    print("Usage: %s <ble_address> <mqtt_broker_address>" % (sys.argv[0]))
    sys.exit(1)
  setup()
  main()
