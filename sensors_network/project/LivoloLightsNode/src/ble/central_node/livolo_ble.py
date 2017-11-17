#!/usr/bin/env python3

# Using this great python3 library: https://github.com/getsenic/gatt-python

import gatt
import time
import sys
import signal
import logging
import logging.handlers
import os
import subprocess
import configparser
from argparse import ArgumentParser
import paho.mqtt.client as mqtt
from mysensors_helper import MySensor
import mtypes
from gi.repository import GLib
import threading
import hashlib

# BLE_LIVOLO_DEVICE_ADDRESS = 'c2:8a:74:27:11:7b'
# BLE_LIVOLO_DEVICE_ADDRESS = 'de:62:20:8f:8e:91'
LIVOLO_LIGHTS_SERVICE_UUID = 'ccc0'
LIVOLO_BLE_SWITCH_ONE_UUID = '0000bbb0-0000-1000-8000-00805f9b34fb'
LIVOLO_BLE_SWITCH_TWO_UUID = '0000bbb1-0000-1000-8000-00805f9b34fb'
# map characteristic uuid's to channel number
LIVOLO_CHANNEL_BY_UUID = {
  LIVOLO_BLE_SWITCH_ONE_UUID: 1,
  LIVOLO_BLE_SWITCH_TWO_UUID: 2
}

LIVOLO_UUID_BY_CHANNEL = {
  1: LIVOLO_BLE_SWITCH_ONE_UUID,
  2: LIVOLO_BLE_SWITCH_TWO_UUID
}

# -------------------------------- UTILS ---------------------------------------
def stop_app_cleanly():
  for mys_ble_device in mys_ble_devices:
    mys_ble_device.stop()

def exit_cleanly(message):
  logging.debug(message)
  stop_app_cleanly()
  sys.exit(0)

def sigint_handler(signal, frame):
  exit_cleanly("SIGINT issued, exiting ...")

def sigterm_handler(signal, frame):
  exit_cleanly("SIGTERM issued, exiting ...")

def check_file_md5sum(file):
  hash = 0
  m = hashlib.md5()
  with open(file, "rb") as f:
    while True:
      buf = f.read(4096)
      if not buf:
        break
      m.update(buf)
      hash = m.hexdigest()
  return hash

def restart_app():
  # stop main application cleanly
  stop_app_cleanly()
  os.execv(__file__, sys.argv)
# --------------------------- END UTILS ----------------------------------------

# --------------------------------- BLE GATT -----------------------------------
class LivoloDeviceManager(gatt.DeviceManager):
  def __init__(self, hci_device, mac_address_to_match):
    self.livolo_device_discovered = False
    self.mac_address_to_match = mac_address_to_match
    self.config = config
    super().__init__(hci_device)

  def device_discovered(self, device):
    if device.mac_address == self.mac_address_to_match:
      logging.debug(
        "[%s] Device discovered with alias = %s" % (device.mac_address, device.alias())
      )
      self.livolo_device_discovered = True
      self.stop_discovery()

  def start_discovery(self):
    logging.debug("Starting BLE discovery ...")
    self.livolo_device_discovered = False
    super().start_discovery()

  def stop_discovery(self):
    logging.debug("Stopping BLE discovery ...")
    super().stop_discovery()

class LivoloDevice(gatt.Device):
  def __init__(self, config, manager, mac_address, mys_livolo_node, mqtt_client=None):
    self.config = config
    self.mac_address = mac_address
    self.manager = manager
    self.mys_livolo_node = mys_livolo_node
    self.mqtt_client = mqtt_client
    # intialize a fixed length list holding light channels state
    # we could read this from the characteristic but it triggers update events
    self.lights_state = [0] * self.mys_livolo_node.child_count
    super().__init__(self.mac_address, self.manager)

  def connect_succeeded(self):
    super().connect_succeeded()
    logging.debug("[%s] Connected to: %s ..." % (self.mac_address, self.alias()))

    if self.mqtt_client is not None:
      # send mysensors node presentation
      self.mys_livolo_node.send_presentation(present_node_name=True)
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
        1,
        1,
        self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
      )
      self.mqtt_client.publish(
        "%s/%s/alias" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
        self.alias(),
        1,
        self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
      )

  def connect_failed(self, error):
    super().connect_failed(error)
    logging.debug("[%s] Connection failed: %s" % (self.mac_address, str(error)))
    if self.mqtt_client is not None:
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
        0,
        1,
        self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
      )

  def disconnect_succeeded(self):
    super().disconnect_succeeded()
    logging.debug("[%s] Disconnected" % (self.mac_address))
    if self.mqtt_client is not None:
      # publish device new state
      self.mqtt_client.publish(
        "%s/%s/state" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
        0,
        1,
        self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
      )

  def characteristic_enable_notification_succeeded(self):
    logging.debug(
      "[%s] Characteristic notifications subscription succeded" %
      (self.mac_address)
    )

  def characteristic_enable_notification_failed(self, error):
    logging.debug(
      "[%s] Characteristic notifications subscription failed with error: %s" %
      (self.mac_address, str(error))
    )

  def services_resolved(self):
    logging.debug("[%s] Services resolved" % (self.mac_address))
    super().services_resolved()

    self.lights_service = next(
      s for s in self.services
      if LIVOLO_LIGHTS_SERVICE_UUID in s.uuid)

    for c in self.lights_service.characteristics:
      c.read_value()
      c.enable_notifications()

  def characteristic_value_updated(self, characteristic, value):
    channel = LIVOLO_CHANNEL_BY_UUID[characteristic.uuid]
    channel_state = int.from_bytes(value, byteorder='little')
    self.lights_state[channel-1] = channel_state
    logging.debug(
      "[%s] Light_%s state: %s" % (self.mac_address, channel, channel_state)
    )
    if self.mqtt_client is not None:
      self.mys_livolo_node.send(channel, mtypes.V_STATUS, channel_state)

  def read_rssi(self):
    #return self._properties.Get('(ss)', 'org.bluez.Device1', 'RSSI')
    pass
# ------------------------------ END BLE GATT ----------------------------------

# ------------------------------- MAIN APP CLASS -------------------------------
class LivoloCentralBLE(threading.Thread):
  def __init__(self, config, mac_address, mysensor_node_id, mysensor_node_alias, mysensor_child_aliases=[]):
    self.config = config
    self.mac_address = mac_address
    self.mysensor_node_id = mysensor_node_id
    self.mysensor_node_alias = mysensor_node_alias
    self.mysensor_child_aliases = mysensor_child_aliases
    self.must_run = True
    self.ble_dev_conn_check_must_run = True
    self.mqtt_conn_check_must_run = True
    self.mysensors_lights_state_reporting_must_run = True
    threading.Thread.__init__(self)

    logging.debug("Instantiating mqtt client ...")
    self.mqtt_client = mqtt.Client()
    self.mqtt_client.username_pw_set(
      username=self.config.get('mqtt', 'user', fallback=''),
      password=self.config.get('mqtt', 'password', fallback='')
    )
    self.mqtt_client.on_connect = self.on_connect
    self.mqtt_client.on_disconnect = self.on_disconnect
    self.mqtt_client.on_message = self.on_message
    self.mqtt_client.will_set(
      "%s/%s/state" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
      2,
      1,
      self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
    )
    logging.debug("Starting MQTT connect thread ...")
    self.mqtt_connect_t = threading.Thread(target=self.connect_to_mqtt_broker)
    self.mqtt_connect_t.setDaemon(True)
    self.mqtt_connect_t.start()

    self.mys_livolo_node = MySensor(
      self.mysensor_node_id,
      self.mysensor_node_alias,
      [mtypes.S_BINARY for child in self.mysensor_child_aliases],
      self.mysensor_child_aliases
    )
    self.mys_livolo_node.register_mqtt(
      self.mqtt_client,
      self.config.get('mqtt', 'mysensors_in_topic_prefix'),
      self.config.get('mqtt', 'mysensors_out_topic_prefix'),
      retain=self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
    )

    logging.debug("Instantiating Livolo manager ...")
    self.manager = LivoloDeviceManager(
      self.config.get('ble', 'hci_device'),
      self.mac_address
    )

    logging.debug("Instantiating Livolo device ...")
    self.livolo_device = LivoloDevice(
      self.config,
      self.manager,
      self.mac_address,
      self.mys_livolo_node,
      self.mqtt_client
    )
    try:
      self.livolo_device.disconnect()
    except Exception:
      pass

    self.check_bluetooth_service()
    self.check_bluetooth_power()

    logging.debug("Starting BLE discovery ...")
    self.manager.start_discovery()

    logging.debug("Starting BLE connection checking thread ...")
    self.ble_dev_conn_check_t = threading.Thread(target=self.check_ble_device_connection)
    self.ble_dev_conn_check_t.setDaemon(True)
    self.ble_dev_conn_check_t.start()

    logging.debug("Starting MySensors lights state reporting thread ...")
    self.mysensors_lights_state_reporting_t = threading.Thread(target=self.mysensors_lights_state_reporting)
    self.mysensors_lights_state_reporting_t.setDaemon(True)
    self.mysensors_lights_state_reporting_t.start()

  # The callback for when the client receives a CONNACK response from the server.
  def on_connect(self, client, userdata, flags, rc):
    logging.debug(
      "Connected to mqtt broker: %s with result code: %s ..." %
        (self.config.get('mqtt', 'broker'), rc)
    )
    client.subscribe(
      "%s/%s/#" %
      (self.config.get('mqtt', 'mysensors_in_topic_prefix'), self.mysensor_node_id)
    )
    client.subscribe(
      "%s/%s/#" %
      (self.config.get('mqtt', 'mysensors_in_topic_prefix'), self.mys_livolo_node.BROADCAST_NODE_ID)
    )
    # send mysensors node presentation

  def on_disconnect(self, client, userdata, rc=0):
    logging.debug(
      "Got disconnect from mqtt broker with result code: %s ..." % (rc)
    )

  # The callback for when a PUBLISH message is received from the server.
  # Process MySensors messages and take decisions
  def on_message(self, client, userdata, msg):
    # if no BLE device is connected then there's no point to continue
    if not self.livolo_device.is_connected():
      logging.debug(
        "[%s] Livolo device not connected, not doing any mqtt in/out operations ..." % (self.mac_address)
      )
      return

    child_id, cmd_type, sub_type, payload = self.mys_livolo_node.read(msg)
    if cmd_type == mtypes.M_SET:
      data = int(payload)
      logging.debug(
        "Received M_SET command with value: %s on topic: %s" %
        (data, msg.topic)
      )
      for characteristic in self.livolo_device.lights_service.characteristics:
        if characteristic.uuid == LIVOLO_UUID_BY_CHANNEL[child_id]:
          characteristic.write_value([data])
    elif cmd_type == mtypes.M_REQ:
      logging.debug(
        "Received M_REQ command on topic: %s" % (msg.topic)
      )
    elif cmd_type == mtypes.M_INTERNAL:
      if sub_type == mtypes.I_PRESENTATION:
        logging.debug(
          "Received I_PRESENTATION internal command on topic: %s" % (msg.topic)
        )
        self.mys_livolo_node.send_presentation(present_node_name=True)
      elif sub_type == mtypes.I_DISCOVER_REQUEST:
        logging.debug(
          "Received I_DISCOVER_REQUEST internal command on topic: %s" % (msg.topic)
        )
        self.mys_livolo_node.send_discovery_response()
      elif sub_type == mtypes.I_HEARTBEAT_REQUEST:
        logging.debug(
          "Received I_HEARTBEAT_REQUEST internal command on topic: %s" % (msg.topic)
        )
        self.mys_livolo_node.send_heartbeat()
      elif sub_type == mtypes.I_REBOOT:
        logging.debug(
          "Received I_REBOOT internal command on topic: %s" % (msg.topic)
        )
        restart_app()
      else:
        logging.debug(
          "Received data: %s on topic: %s" % (payload, msg.topic)
        )
    else:
      logging.debug(
        "Received data: %s on topic: %s" % (payload, msg.topic)
      )

  def is_service_running(self, name):
    with open(os.devnull, 'wb') as hide_output:
      return subprocess.Popen(
        ['systemctl', 'status', name],
        stdout=hide_output,
        stderr=hide_output
      ).wait() == 0

  def check_bluetooth_service(self):
    while not self.is_service_running('bluetooth'):
      logging.debug("Bluetooth service is not running/ready, waiting ...")
      time.sleep(1)

  def check_bluetooth_power(self):
    while not self.manager.is_adapter_powered:
      logging.debug("Bluetooth adapter is not powered, trying to power it on ...")
      self.manager.is_adapter_powered = True
      time.sleep(1)

  def check_ble_device_connection(self):
    while self.ble_dev_conn_check_must_run:
      try:
        time.sleep(1)
        if not self.manager.livolo_device_discovered:
          logging.debug(
            "[%s] Livolo device wasn't discovered, initiating discovery ..." % (self.mac_address)
          )
          self.manager.start_discovery()
          continue
        if not self.livolo_device.is_connected():
          logging.debug(
            "[%s] Trying to connect ..." % (self.mac_address)
          )
          self.livolo_device.connect()
      except Exception as ex:
        logging.debug("[%s] BLE dev connection exception occured: " % (ex))
        continue

  def mysensors_lights_state_reporting(self):
    while self.mysensors_lights_state_reporting_must_run:
      if self.livolo_device.is_connected():
        for channel, channel_state in enumerate(self.livolo_device.lights_state):
          channel = channel + 1 # channels start from index 1
          logging.debug(
            "[MySensors][%s] Reporting light channel: %s state: %s ..." % (self.mysensor_node_id, channel, channel_state)
          )
          self.mys_livolo_node.send(channel, mtypes.V_STATUS, channel_state)
      time.sleep(180) # 3 minutes reporting interval

  def connect_to_mqtt_broker(self):
    logging.debug(
      "Connecting to mqtt broker: %s ..." % (self.config.get('mqtt', 'broker'))
    )
    self.is_mqtt_connected = False
    while self.mqtt_conn_check_must_run and not self.is_mqtt_connected:
      time.sleep(1)
      try:
        self.is_mqtt_connected = (self.mqtt_client.connect(
          self.config.get('mqtt', 'broker'),
          self.config.getint('mqtt', 'port', fallback=1883),
          self.config.getint('mqtt', 'keepalive' ,fallback=60)
        ) == mqtt.MQTT_ERR_SUCCESS)
        break
      except Exception:
        logging.debug(
          "Could not connect to mqtt broker: %s, retrying ..." %
          (self.config.get('mqtt', 'broker'))
        )
    if self.is_mqtt_connected:
      logging.debug("Starting mqtt main loop thread ...")
      self.mqtt_client.loop_start()

  def run(self):
    logging.debug("Entering main loop ...")
    while self.must_run:
      time.sleep(1)
      try:
        self.manager.run()
      except Exception as ex:
        # main loop must continue on other exceptions
        logging.debug("Main loop - got exception: %s" % (ex.message))
        continue

  def stop(self):
    self.mqtt_conn_check_must_run = False
    self.ble_dev_conn_check_must_run = False
    self.mysensors_lights_state_reporting_must_run = False
    self.must_run = False
    try:
      self.manager.stop_discovery()
      self.manager.stop()
      if self.livolo_device.is_connected():
        logging.debug(
          "[%s] Disconnecting from Livolo device ..." % (self.mac_address)
        )
        self.livolo_device.disconnect()
      if self.mqtt_client is not None:
        self.mqtt_client.publish(
          "%s/%s/state" % (self.config.get('mqtt', 'ble_stats_topic_prefix'), self.mac_address),
          2,
          1,
          self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg')
        )
        self.mqtt_client.disconnect()
    except Exception:
      pass
    finally:
      if self.mqtt_client is not None:
        self.mqtt_client.loop_stop()
# -------------------------------------END MAIN APP CLASS ----------------------

def setup():
  if 'syslog' in args.log:
    # log to syslog
    logging.basicConfig(
      level=logging.DEBUG,
      format="[livolo_ble] %(message)s",
      handlers=[logging.handlers.SysLogHandler(address='/dev/log')]
    )
  else:
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(module)s][%(levelname)s] => %(message)s"
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

  mac_addresses = config.get('ble', 'mac_addresses').split(',')
  nodes_id = config.get('mysensors', 'nodes_id').split(',')
  nodes_alias = config.get('mysensors', 'nodes_alias').split(',')
  node_childs_alias = config.get('mysensors', 'node_childs_alias').split(';')

  global mys_ble_devices
  mys_ble_devices = []

  for index, mac_address in enumerate(mac_addresses):
    mys_ble_devices.append(
      LivoloCentralBLE(
        config,
        mac_address,
        nodes_id[index],
        nodes_alias[index],
        [child_alias for child_alias in node_childs_alias[index].split(',')]
      )
    )
    mys_ble_devices[index].setDaemon(True)
    mys_ble_devices[index].start()

def main():
  cfg_file_hash = check_file_md5sum(args.config)
  while True:
    time.sleep(1)
    for ble_device in mys_ble_devices:
      ble_device.check_bluetooth_service()
      ble_device.check_bluetooth_power()
    if check_file_md5sum(args.config) != cfg_file_hash:
      logging.debug("Configuration file: %s changed, restarting application ..." % (args.config))
      restart_app()

if __name__ == '__main__':
  arg_parser = ArgumentParser(description="Livolo MySensors BLE Node")
  arg_parser.add_argument(
    '--config',
    help="Configuration file path",
    required=True
  )
  arg_parser.add_argument(
    '--log',
    help="Logging mode: syslog | stdout",
    default='stdout',
    required=False
  )
  global args
  args = arg_parser.parse_args()
  setup()
  main()
