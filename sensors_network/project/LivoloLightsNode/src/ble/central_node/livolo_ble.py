#!/usr/bin/env python3

# Using this great python3 library: https://github.com/getsenic/gatt-python

import gatt
import time
import sys
import signal
import logging
import os
import subprocess
import threading
import configparser
from argparse import ArgumentParser
import paho.mqtt.client as mqtt
from mysensors_helper import MySensor
import mtypes

#BLE_LIVOLO_DEVICE_ADDRESS = 'c2:8a:74:27:11:7b'
#BLE_LIVOLO_DEVICE_ADDRESS = 'de:62:20:8f:8e:91'
LIVOLO_LIGHTS_SERVICE_UUID = 'ccc0'
LIVOLO_BLE_SWITCH_ONE_UUID = '0000bbb0-0000-1000-8000-00805f9b34fb'
LIVOLO_BLE_SWITCH_TWO_UUID = '0000bbb1-0000-1000-8000-00805f9b34fb'
# map characteristic uuid's to channel number
LIVOLO_CHANNEL_BY_UUID = {
  LIVOLO_BLE_SWITCH_ONE_UUID:'1',
  LIVOLO_BLE_SWITCH_TWO_UUID:'2'
}

LIVOLO_UUID_BY_CHANNEL = {
  1:LIVOLO_BLE_SWITCH_ONE_UUID,
  2:LIVOLO_BLE_SWITCH_TWO_UUID
}

# -------------------------------- UTILS ---------------------------------------
def millis():
  return int(round(time.time() * 1000))
# ------------------------------------------------------------------------------

# ------------------------------ MQTT ------------------------------------------
# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
  logging.debug("Connected to mqtt broker: %s with result code: %s ..." % (config.get('mqtt','broker'), rc))
  client.subscribe("%s/%s/#" % (config.get('mqtt','mysensors_in_topic_prefix'), config.get('mys','node_id')))
  # send mysensors node presentation

def on_disconnect(client, userdata, rc=0):
  logging.debug("Got disconnect from mqtt broker with result code: %s ..." % (rc))

# The callback for when a PUBLISH message is received from the server.
# Process MySensors messages and take decisions
def on_message(client, userdata, msg):
  child_id, cmd_type, sub_type, payload = mys_livolo_node.read(msg)
  if cmd_type == mtypes.M_SET:
    data = int(payload)
    logging.debug("Received M_SET command with value: %s on topic: %s" % (data, msg.topic))
    for characteristic in livolo_device.lights_service.characteristics:
      if characteristic.uuid == LIVOLO_UUID_BY_CHANNEL[child_id]:
        characteristic.write_value([data])
  elif cmd_type == mtypes.M_REQ:
    logging.debug("Received M_REQ command on topic: %s" % (msg.topic))
  elif cmd_type == mtypes.M_INTERNAL:
    if sub_type == mtypes.I_PRESENTATION:
      logging.debug("Received I_PRESENTATION internal command on topic: %s" % (msg.topic))
    elif sub_type == mtypes.I_DISCOVER_REQUEST:
      logging.debug("Received I_DISCOVER_REQUEST internal command on topic: %s" % (msg.topic))
    elif sub_type == mtypes.I_HEARTBEAT_REQUEST:
      logging.debug("Received I_HEARTBEAT_REQUEST internal command on topic: %s" % (msg.topic))
    elif sub_type == mtypes.I_REBOOT:
      logging.debug("Received I_REBOOT internal command on topic: %s" % (msg.topic))
    else:
      logging.debug("Received data: %s on topic: %s" % (payload, msg.topic))
  else:
    logging.debug("Received data: %s on topic: %s" % (payload, msg.topic))
# ------------------------------------------------------------------------------

# -------------------------------------- BLE -----------------------------------
class LivoloDeviceManager(gatt.DeviceManager):
  def __init__(self, adapter_name):
    super().__init__(adapter_name)
    self.livolo_device_discovered = False

  def device_discovered(self, device):
    if device.mac_address == config.get('ble','mac_address'):
      logging.debug("[%s] Discovered, alias = %s" % (device.mac_address, device.alias()))
      self.livolo_device_discovered = True
      logging.debug("Stopping BLE discovery ...")
      self.stop_discovery()

  def make_device(self, mac_address):
    return LivoloDevice(mac_address=mac_address, manager=self)

class LivoloDevice(gatt.Device):
  def register_mqtt_client(self, mqtt_client):
    self.mqtt_client = mqtt_client

  def connect_succeeded(self):
    super().connect_succeeded()
    logging.debug("[%s] Connected to: %s ..." % (self.mac_address, self.alias()))
    if self.mqtt_client is not None:
      # send mysensors node presentation
      mys_livolo_node.send_presentation(1, mtypes.S_BINARY, 'Light1')
      mys_livolo_node.send_presentation(2, mtypes.S_BINARY, 'Light2')
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (config.get('mqtt','stats_topic_prefix'), self.mac_address),
        1,
        1,
        True
      )

  def connect_failed(self, error):
    super().connect_failed(error)
    logging.debug("[%s] Connection failed: %s" % (self.mac_address, str(error)))
    if self.mqtt_client is not None:
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (config.get('mqtt','stats_topic_prefix'), self.mac_address),
        0,
        1,
        True
      )
    self.manager.stop()

  def disconnect_succeeded(self):
    super().disconnect_succeeded()
    logging.debug("[%s] Disconnected" % (self.mac_address))
    if self.mqtt_client is not None:
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (config.get('mqtt','stats_topic_prefix'), self.mac_address),
        0,
        1,
        True
      )
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
    channel = LIVOLO_CHANNEL_BY_UUID[characteristic.uuid]
    channel_state = int.from_bytes(value, byteorder='little')
    logging.debug("[%s] Light_%s state: %s" % (self.mac_address, channel, channel_state))
    if self.mqtt_client is not None:
      mys_livolo_node.send(channel, mtypes.V_STATUS, channel_state)

  def read_rssi(self):
    #return self._properties.Get('org.bluez.Device1', 'RSSI')
    pass

def exit_cleanly(message):
  logging.debug(message)
  if ble_discovery_t is not None:
    ble_discovery_t.do_run = False
  if ble_device_connection_t is not None:
    ble_device_connection_t.do_run = False
  try:
    if manager.livolo_device_discovered and livolo_device.is_connected():
      logging.debug("[%s] Disconnecting from Livolo device ..." % (config.get('ble','mac_address')))
      livolo_device.disconnect()
      if mqtt_client is not None:
        mqtt_client.publish(
          "%s/%s/state" % (config.get('mqtt','stats_topic_prefix'), config.get('ble','mac_address')),
          2,
          1,
          True
        )
        mqtt_client.disconnect()
  except Exception:
    pass
  finally:
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
    logging.debug("Bluetooth adapter is not powered, trying to power it on ...")
    manager.is_adapter_powered = True
    time.sleep(1)

def check_bluetooth_discovery(manager):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1)
    if not manager.livolo_device_discovered:
      logging.debug("[%s] Livolo device wasn't discovered, waiting ..." % (config.get('ble','mac_address')))
      manager.start_discovery()

def check_bluetooth_device_connection(manager, device):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1)
    if manager.livolo_device_discovered and not device.is_connected():
      logging.debug("[%s] Trying to connect ..." % (config.get('ble','mac_address')))
      device.connect()

def setup():
  logging.basicConfig(
    level=logging.DEBUG,
    format="[%(asctime)s][%(levelname)s] => %(message)s"
  )

  signal.signal(signal.SIGINT, sigint_handler)
  signal.signal(signal.SIGTERM, sigterm_handler)

  logging.debug("Instantiating mqtt client ...")
  global mqtt_client
  mqtt_client = mqtt.Client(clean_session=True, userdata=None, protocol=mqtt.MQTTv311)
  mqtt_client.on_connect = on_connect
  mqtt_client.on_disconnect = on_disconnect
  mqtt_client.on_message = on_message
  mqtt_client.will_set(
    "%s/%s/state" % (config.get('mqtt','stats_topic_prefix'), config.get('ble','mac_address')),
    2,
    1,
    True
  )
  logging.debug("Connecting to mqtt broker: %s ..." % (config.get('mqtt','broker')))
  is_mqtt_connected = False
  while not is_mqtt_connected:
    time.sleep(1)
    try:
      is_mqtt_connected = ( mqtt_client.connect(
        config.get('mqtt','broker'),
        config.getint('mqtt','port',fallback=1883),
        config.getint('mqtt','keepalive',fallback=60)
      ) == mqtt.MQTT_ERR_SUCCESS )
      break
    except Exception:
      logging.debug("Could not connect to mqtt broker: %s, retrying ..." %(config.get('mqtt','broker')))
  logging.debug("Starting mqtt main loop thread ...")
  mqtt_client.loop_start()

  global mys_livolo_node
  mys_livolo_node = MySensor(
    config.get('mys','node_id'),
    'Livolo'
  )
  mys_livolo_node.register_mqtt(
    mqtt_client,
    config.get('mqtt','mysensors_in_topic_prefix'),
    config.get('mqtt','mysensors_out_topic_prefix')
  )

  logging.debug("Instantiating Livolo manager ...")
  global manager
  manager = LivoloDeviceManager(adapter_name=config.get('ble','hci_device'))

  logging.debug("Instantiating Livolo device ...")
  global livolo_device
  livolo_device = manager.make_device(mac_address=config.get('ble','mac_address'))
  try:
    livolo_device.disconnect()
  except Exception:
    pass
  livolo_device.register_mqtt_client(mqtt_client)

  check_bluetooth_service()
  check_bluetooth_power()

  logging.debug("Starting BLE discovery ...")
  manager.start_discovery()

  global ble_discovery_t
  ble_discovery_t = threading.Thread(target=check_bluetooth_discovery, args=(manager,))
  ble_discovery_t.start()

  global ble_device_connection_t
  ble_device_connection_t = threading.Thread(target=check_bluetooth_device_connection, args=(manager,livolo_device,))
  ble_device_connection_t.start()

def main():
  logging.debug("Entering main loop ...")
  while True:
    time.sleep(1)
    try:
      check_bluetooth_service()
      check_bluetooth_power()
      manager.run()
    except Exception as ex:
      # main loop must continue on other exceptions
      logging.debug("Main loop - got exception: %s" %(ex.message))
      continue
    except KeyboardInterrupt:
      exit_cleanly("Ctrl-C issued, exiting ...")

if __name__ == '__main__':
  arg_parser = ArgumentParser(description="Livolo MySensors BLE Node")
  arg_parser.add_argument('config', help="Configuration file")
  global args
  args = arg_parser.parse_args()
  global config
  config = configparser.ConfigParser()
  config.read(args.config)
  setup()
  main()
