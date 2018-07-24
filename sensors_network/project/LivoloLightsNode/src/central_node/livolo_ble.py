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
  def __init__(self, config, manager, mac_address, mys_livolo_node):
    self.config = config
    self.mac_address = mac_address
    self.manager = manager
    self.mys_livolo_node = mys_livolo_node
    # intialize a fixed length list holding light channels state
    # we could read this from the characteristic but it triggers update events
    self.lights_state = [0] * self.mys_livolo_node.child_count
    super().__init__(self.mac_address, self.manager)

  def connect_succeeded(self):
    super().connect_succeeded()
    logging.debug("[%s] Connected to: %s ..." % (self.mac_address, self.alias()))
    # send mysensors node presentation
    self.mys_livolo_node.send_presentation(present_node_name=True)

  def connect_failed(self, error):
    super().connect_failed(error)
    logging.debug("[%s] Connection failed: %s" % (self.mac_address, str(error)))

  def disconnect_succeeded(self):
    super().disconnect_succeeded()
    logging.debug("[%s] Disconnected" % (self.mac_address))

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
    threading.Thread.__init__(self)

    self.mys_livolo_node = MySensor(
      self.mysensor_node_id,
      self.mysensor_node_alias,
      [mtypes.S_BINARY for child in self.mysensor_child_aliases],
      self.mysensor_child_aliases,
      self.config.get('mqtt', 'broker', fallback='localhost'),
      self.config.getint('mqtt', 'port', fallback=1883),
      self.config.get('mqtt', 'user', fallback=''),
      self.config.get('mqtt', 'password', fallback=''),
      self.config.get('mqtt', 'mysensors_in_topic_prefix'),
      self.config.get('mqtt', 'mysensors_out_topic_prefix'),
      self.config.getint('mqtt', 'mysensors_mqtt_qos', fallback=0),
      self.config.getboolean('mqtt', 'mysensors_mqtt_retain_msg'),
      self.config.getint('mqtt', 'keepalive', fallback=60)
    )
    self.mys_livolo_node.register_mys_cb(self.on_message)
    self.mys_livolo_node.begin()

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
      self.mys_livolo_node
    )

    # if somehow the ble device is still connected try to disconnect it first
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

    logging.debug("Starting MySensors battery level reporting thread ...")
    self.mysensors_batt_lvl_reporting_t = threading.Thread(target=self.mysensors_battery_lvl_reporting)
    self.mysensors_batt_lvl_reporting_t.setDaemon(True)
    self.mysensors_batt_lvl_reporting_t.start()

  def on_message(self, msg):
    # if no BLE device is connected then there's no point to continue
    if not self.livolo_device.is_connected():
      logging.debug(
        "[%s] Livolo device not connected, won't process MySensors messages ..." % (self.mac_address)
      )
      return

    if msg['cmd_type'] == mtypes.M_SET:
      new_state = int(msg['payload'])
      logging.debug(
        "Received M_SET command with value: %s" % (new_state)
      )
      for characteristic in self.livolo_device.lights_service.characteristics:
        if characteristic.uuid == LIVOLO_UUID_BY_CHANNEL[msg['child_id']]:
          characteristic.write_value([new_state])

    # if msg['cmd_type'] == mtypes.M_REQ:
    #   logging.debug(
    #     "Received M_REQ command"
    #   )

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
    while getattr(threading.currentThread(), "do_run", True):
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
    while getattr(threading.currentThread(), "do_run", True):
      try:
        if self.livolo_device.is_connected():
          for channel, channel_state in enumerate(self.livolo_device.lights_state):
            logging.debug(
              "[MySensors][%s] Reporting light channel: %s state: %s ..." % (self.mysensor_node_id, channel+1, channel_state)
            )
            self.mys_livolo_node.send(channel+1, mtypes.V_STATUS, channel_state)
      except Exception as ex:
        logging.debug(ex)
      time.sleep(180) # 3 minutes reporting interval

  def mysensors_battery_lvl_reporting(self):
    while getattr(threading.currentThread(), "do_run", True):
      try:
        if self.livolo_device.is_connected():
          logging.debug(
            "[MySensors][%s] Reporting battery level: %s ..." % (self.mysensor_node_id, 100)
          )
          self.mys_livolo_node.send_battery_level(100)
      except Exception as ex:
        logging.debug(ex)
      time.sleep(300) # 5 minutes reporting interval

  def run(self):
    logging.debug("Entering main loop ...")
    while getattr(threading.currentThread(), "do_run", True):
      time.sleep(1)
      try:
        self.manager.run()
      except Exception as ex:
        # main loop must continue on other exceptions
        logging.debug("Main loop - got exception: %s" % (ex.message))
        continue

  def stop(self):
    # stop all threads that were created with this app first
    if self.mys_livolo_node is not None:
      self.mys_livolo_node.stop()
    if self.ble_dev_conn_check_t is not None:
      self.ble_dev_conn_check_t.do_run = False
    if self.mysensors_lights_state_reporting_t is not None:
      self.mysensors_lights_state_reporting_t.do_run = False
    if self.mysensors_batt_lvl_reporting_t is not None:
      self.mysensors_batt_lvl_reporting_t.do_run = False
    self.do_run = False
    try:
      self.manager.stop_discovery()
      self.manager.stop()
      if self.livolo_device.is_connected():
        logging.debug(
          "[%s] Disconnecting from Livolo device ..." % (self.mac_address)
        )
        self.livolo_device.disconnect()
    except Exception:
      pass
# -------------------------------------END MAIN APP CLASS ----------------------

def setup():
  if 'syslog' in args.log:
    # log to syslog
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(module)s][%(levelname)s] => %(message)s",
      handlers=[logging.FileHandler('/var/log/livolo_ble.log')]
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
