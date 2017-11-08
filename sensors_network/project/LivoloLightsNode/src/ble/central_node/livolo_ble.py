#!/usr/bin/env python3

# Using this great python3 library: https://github.com/getsenic/gatt-python

import gatt
import time
import sys
import signal
import logging
import os
import subprocess
import configparser
from argparse import ArgumentParser
import paho.mqtt.client as mqtt
from mysensors_helper import MySensor
import mtypes
from gi.repository import GLib
import threading

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

# -------------------------------------- BLE -----------------------------------
class LivoloDeviceManager(gatt.DeviceManager):
  def __init__(self, config, mac_address_to_match):
    self.livolo_device_discovered = False
    self.mac_address_to_match = mac_address_to_match
    self.config = config
    super().__init__(self.config.get('ble','hci_device'))

  def device_discovered(self, device):
    if device.mac_address == self.mac_address_to_match:
      logging.debug("[%s] Discovered, alias = %s" % (device.mac_address, device.alias()))
      self.livolo_device_discovered = True
      logging.debug("Stopping BLE discovery ...")
      self.stop_discovery()

class LivoloDevice(gatt.Device):
  def __init__(self, config, manager, mac_address, mys_livolo_node):
    self.config = config
    self.mac_address = mac_address
    self.manager = manager
    self.mys_livolo_node = mys_livolo_node
    self.config = config
    super().__init__(self.mac_address, self.manager)
    
  def register_mqtt_client(self, mqtt_client):
    self.mqtt_client = mqtt_client

  def connect_succeeded(self):
    super().connect_succeeded()
    logging.debug("[%s] Connected to: %s ..." % (self.mac_address, self.alias()))
    if self.mqtt_client is not None:
      # send mysensors node presentation
      self.mys_livolo_node.send_presentation(1, mtypes.S_BINARY, 'Light1')
      self.mys_livolo_node.send_presentation(2, mtypes.S_BINARY, 'Light2')
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (self.config.get('mqtt','stats_topic_prefix'), self.mac_address),
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
        "%s/%s/state" % (self.config.get('mqtt','stats_topic_prefix'), self.mac_address),
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
        "%s/%s/state" % (self.config.get('mqtt','stats_topic_prefix'), self.mac_address),
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
      self.mys_livolo_node.send(channel, mtypes.V_STATUS, channel_state)

  def read_rssi(self):
    #return self._properties.Get('org.bluez.Device1', 'RSSI')
    pass

class LivoloCentralBLE(threading.Thread):
  def __init__(self, config, mac_address, mysensor_node_id):
    threading.Thread.__init__(self)
    self.must_run = True
    self.config = config
    self.mac_address = mac_address
    self.mysensor_node_id = mysensor_node_id
    
    logging.debug("Instantiating mqtt client ...")
    self.mqtt_client = mqtt.Client(clean_session=True, userdata=None, protocol=mqtt.MQTTv311)
    self.mqtt_client.on_connect = self.on_connect
    self.mqtt_client.on_disconnect = self.on_disconnect
    self.mqtt_client.on_message = self.on_message
    self.mqtt_client.will_set(
      "%s/%s/state" % (self.config.get('mqtt','stats_topic_prefix'), self.mac_address),
      2,
      1,
      True
    )
    logging.debug("Connecting to mqtt broker: %s ..." % (self.config.get('mqtt','broker')))
    self.is_mqtt_connected = False
    while not self.is_mqtt_connected:
      time.sleep(1)
      try:
        self.is_mqtt_connected = ( self.mqtt_client.connect(
          self.config.get('mqtt','broker'),
          self.config.getint('mqtt','port',fallback=1883),
          self.config.getint('mqtt','keepalive',fallback=60)
        ) == mqtt.MQTT_ERR_SUCCESS )
        break
      except Exception:
        logging.debug("Could not connect to mqtt broker: %s, retrying ..." %(self.config.get('mqtt','broker')))
    logging.debug("Starting mqtt main loop thread ...")
    self.mqtt_client.loop_start()

    self.mys_livolo_node = MySensor(
      self.mysensor_node_id,
      'Livolo'
    )
    self.mys_livolo_node.register_mqtt(
      self.mqtt_client,
      self.config.get('mqtt','mysensors_in_topic_prefix'),
      self.config.get('mqtt','mysensors_out_topic_prefix')
    )

    logging.debug("Instantiating Livolo manager ...")
    self.manager = LivoloDeviceManager(self.config, self.mac_address)

    logging.debug("Instantiating Livolo device ...")
    self.livolo_device = LivoloDevice(self.config, self.manager, self.mac_address, self.mys_livolo_node)
    try:
      self.livolo_device.disconnect()
    except Exception:
      pass
    self.livolo_device.register_mqtt_client(self.mqtt_client)

    self.check_bluetooth_service()
    self.check_bluetooth_power()

    logging.debug("Starting BLE discovery ...")
    self.manager.start_discovery()
    
  # ------------------------------ MQTT ------------------------------------------
  # The callback for when the client receives a CONNACK response from the server.
  def on_connect(self, client, userdata, flags, rc):
    logging.debug("Connected to mqtt broker: %s with result code: %s ..." % (self.config.get('mqtt','broker'), rc))
    client.subscribe("%s/%s/#" % (self.config.get('mqtt','mysensors_in_topic_prefix'), self.mysensor_node_id))
    # send mysensors node presentation

  def on_disconnect(self, client, userdata, rc=0):
    logging.debug("Got disconnect from mqtt broker with result code: %s ..." % (rc))

  # The callback for when a PUBLISH message is received from the server.
  # Process MySensors messages and take decisions
  def on_message(self, client, userdata, msg):
    child_id, cmd_type, sub_type, payload = self.mys_livolo_node.read(msg)
    if cmd_type == mtypes.M_SET:
      data = int(payload)
      logging.debug("Received M_SET command with value: %s on topic: %s" % (data, msg.topic))
      for characteristic in self.livolo_device.lights_service.characteristics:
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
  
  def is_service_running(self, name):
    with open(os.devnull, 'wb') as hide_output:
      exit_code = subprocess.Popen(['systemctl', 'status', name], stdout=hide_output, stderr=hide_output).wait()
      return exit_code == 0

  def check_bluetooth_service(self):
    while not self.is_service_running('bluetooth'):
      logging.debug("Bluetooth service is not running/ready, waiting ...")
      time.sleep(1)

  def check_bluetooth_power(self):
    while not self.manager.is_adapter_powered:
      logging.debug("Bluetooth adapter is not powered, trying to power it on ...")
      self.manager.is_adapter_powered = True
      time.sleep(1)
  
  def run(self):
    logging.debug("Entering main loop ...")
    while self.must_run:
      time.sleep(1)
      try:
        self.check_bluetooth_service()
        self.check_bluetooth_power()
        if not self.manager.livolo_device_discovered:
          logging.debug("[%s] Livolo device wasn't discovered, waiting ..." % (self.mac_address))
          time.sleep(1)
        if not self.livolo_device.is_connected():
          logging.debug("[%s] Trying to connect ..." % (self.mac_address))
          self.livolo_device.connect()
        else:
          self.manager.run()
      except Exception as ex:
        # main loop must continue on other exceptions
        logging.debug("Main loop - got exception: %s" %(ex.message))
        continue
        
  def stop(self):
    self.must_run = False
    try:
      if self.manager.livolo_device_discovered and self.livolo_device.is_connected():
        logging.debug("[%s] Disconnecting from Livolo device ..." % (self.mac_address))
        self.livolo_device.disconnect()
        if selfmqtt_client is not None:
          self.mqtt_client.publish(
            "%s/%s/state" % (self.config.get('mqtt','stats_topic_prefix'), self.mac_address),
            2,
            1,
            True
          )
          self.mqtt_client.disconnect()
    except Exception:
      pass
    
def exit_cleanly(message):
  logging.debug(message)
  livoloCentralBLE1.stop()
  livoloCentralBLE2.stop()
  sys.exit(0)

def sigint_handler(signal, frame):
  exit_cleanly("SIGINT issued, exiting ...")

def sigterm_handler(signal, frame):
  exit_cleanly("SIGTERM issued, exiting ...")

def setup():
  logging.basicConfig(
    level=logging.DEBUG,
    format="[%(asctime)s][%(levelname)s] => %(message)s"
  )

  signal.signal(signal.SIGINT, sigint_handler)
  signal.signal(signal.SIGTERM, sigterm_handler)

  # very important - TO STOP the fucking dbus main loop
  if hasattr(GLib, 'unix_signal_add'):
    unix_signal_add = GLib.unix_signal_add
  else:
    unix_signal_add = GLib.unix_signal_add_full

  unix_signal_add(GLib.PRIORITY_HIGH, signal.SIGINT, sigint_handler, None, None)
  unix_signal_add(GLib.PRIORITY_HIGH, signal.SIGTERM, sigterm_handler, None, None)
  #unix_signal_add(GLib.PRIORITY_HIGH, signal.SIGINT, sigint_handler, mainloop)
  #unix_signal_add(GLib.PRIORITY_HIGH, signal.SIGTERM, sigterm_handler, mainloop)

  global config
  config = configparser.ConfigParser()
  config.read(args.config)
  
  global livoloCentralBLE1
  livoloCentralBLE1 = LivoloCentralBLE(config, 'c2:8a:74:27:11:7b', 100)
  livoloCentralBLE1.setDaemon(True)
  livoloCentralBLE1.start()
  
  global livoloCentralBLE2
  livoloCentralBLE2 = LivoloCentralBLE(config, 'de:62:20:8f:8e:91', 101)
  livoloCentralBLE2.setDaemon(True)
  livoloCentralBLE2.start()

def main():
  livoloCentralBLE1.join()
  livoloCentralBLE2.join()

if __name__ == '__main__':
  arg_parser = ArgumentParser(description="Livolo MySensors BLE Node")
  arg_parser.add_argument('config', help="Configuration file")
  global args
  args = arg_parser.parse_args()
  setup()
  main()
