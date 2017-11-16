#!/usr/bin/env python3

from flask import Flask,g
from flask import render_template
from flask_mqtt import Mqtt
from flask_ini import FlaskIni
import flask_sijax
import paho.mqtt.client as mqtt
import threading
import time
import signal
import logging
import sys
import os
import psutil
import platform
from uptime import uptime
from argparse import ArgumentParser
import subprocess
import hashlib

app = Flask(__name__)
app.iniconfig = FlaskIni()

mqtt = Mqtt()
is_mqtt_subscribed = False

ble_devices = []

def uptime_format(up):
  parts = []

  days, up = up // 86400, up % 86400
  if days:
    parts.append('%d d' % (days))

  hours, up = up // 3600, up % 3600
  if hours:
    parts.append('%d h' % (hours))

  minutes, up = up // 60, up % 60
  if minutes:
    parts.append('%d min' % (minutes))

  if up or not parts:
    parts.append('%d sec' % up)

  return ', '.join(parts)

def get_ble_devices_list():
  return ble_devices

def get_mqtt_broker_list():
  return [
    {
      'address': app.config['MQTT_BROKER_URL'],
      'port': app.config['MQTT_BROKER_PORT'],
      'connected': mqtt.connected
    }
  ]

def system_stats_check():
  system_stats = {}
  system_stats['cpu_usage_percent'] = round(psutil.cpu_percent())
  system_stats['memory_usage_percent'] = round(psutil.virtual_memory().percent)
  try:
    with open('/etc/armbianmonitor/datasources/soctemp', 'r') as temp:
      system_stats['cpu_temp'] = round(int(temp.read())/1000, 2)
  except Exception:
    system_stats['cpu_temp'] = 0.0
  system_stats['machine_arch'] = platform.machine()
  system_stats['system'] = platform.system()
  system_stats['release'] = platform.release()
  system_stats['uptime'] = uptime_format(uptime())

  return system_stats

def read_config_file_settings(cfg_file):
  with app.app_context():
    app.iniconfig.read(cfg_file)
    settings = {
      'mqtt_broker_url': app.iniconfig.get('mqtt', 'broker', fallback='localhost'),
      'mqtt_broker_user': app.iniconfig.get('mqtt', 'user', fallback=''),
      'mqtt_broker_password': app.iniconfig.get('mqtt', 'password', fallback=''),
      'mqtt_broker_port': app.iniconfig.getint('mqtt', 'port', fallback=1883),
      'mqtt_broker_keepalive': app.iniconfig.getint('mqtt', 'keepalive', fallback=60),
      'flask_host': app.iniconfig.get('flask', 'host', fallback='localhost'),
      'flask_port': app.iniconfig.getint('flask', 'port', fallback=5000),
      'mysensors_mqtt_in_topic_prefix': app.iniconfig.get('mqtt', 'mysensors_in_topic_prefix', fallback='mys-in'),
      'mysensors_mqtt_out_topic_prefix': app.iniconfig.get('mqtt', 'mysensors_out_topic_prefix', fallback='mys-out'),
      'ble_stats_topic_prefix': app.iniconfig.get('mqtt', 'ble_stats_topic_prefix', fallback='mys/stats/devices/ble'),
      'nodes_id': app.iniconfig.get('mysensors', 'nodes_id', fallback='Unknown'),
      'node_childs_alias': app.iniconfig.get('mysensors', 'node_childs_alias', fallback='Unknown'),
      'nodes_alias': app.iniconfig.get('mysensors', 'nodes_alias', fallback='Unknown'),
      'mac_addresses': app.iniconfig.get('ble', 'mac_addresses', fallback='Unknown')
    }
  return settings

def service_operation(name, operation):
  with open(os.devnull, 'wb') as hide_output:
    return subprocess.Popen(
      ['sudo', 'systemctl', operation, name],
      stdout=hide_output,
      stderr=hide_output
    ).wait() == 0

def mqtt_check(mqtt):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1) # give some break to CPU
    if not mqtt.connected:
      logging.debug("Not connected to mqtt broker: %s ..." % (app.config['MQTT_BROKER_URL']))
    else:
      # mqtt ble devices topics
      if not is_mqtt_subscribed:
        logging.debug("Subscribing to MQTT topic(s): %s/#" % (app.config['MYS_BLE_STATS_TOPIC']))
        mqtt.subscribe("%s/#" % app.config['MYS_BLE_STATS_TOPIC'])

def mqtt_init(app, mqtt):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1) # give some break to CPU
    try:
      with app.app_context():
        mqtt.init_app(app)
      break
    except Exception:
      logging.debug("Could not connect to mqtt broker: %s, retrying ..." % (app.config['MQTT_BROKER_URL']))
      continue
    # mqtt ble devices topics
    if not is_mqtt_subscribed:
      logging.debug("Subscribing to MQTT topic(s): %s/#" % (app.config['MYS_BLE_STATS_TOPIC']))
      mqtt.subscribe("%s/#" % app.config['MYS_BLE_STATS_TOPIC'])

@mqtt.on_subscribe()
def handle_subscribe(client, userdata, mid, granted_qos):
  logging.debug("MQTT subscribing succedeed with qos %s ..." % (granted_qos))
  global is_mqtt_subscribed
  is_mqtt_subscribed = True

@mqtt.on_unsubscribe()
def handle_unsubscribe(client, userdata, mid):
  logging.debug("Unsubscribed from topic id: %s" % (mid))
  global is_mqtt_subscribed
  is_mqtt_subscribed = False

@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
  if app.iniconfig.get('mqtt', 'ble_stats_topic_prefix') in message.topic:
    mac_address = message.topic.split('/')[-2]
    data = message.payload.decode('ascii')
    if 'state' in message.topic:
      logging.debug("Got BLE device with mac address: %s and state: %s" % (mac_address, data))
    # check if device already added to list and return
    for ble_device in ble_devices:
      if ble_device['mac_address'] == mac_address:
        # if new data is different from previous then do an update
        if 'state' in message.topic:
          if data != ble_device['state']:
            ble_device['state'] = data
        if 'alias' in message.topic:
          if data != ble_device['alias']:
            ble_device['alias'] = data
        return
    # if device not known then add it
    ble_devices.append({'mac_address': mac_address, 'state': data, 'alias': data})

@flask_sijax.route(app, '/')
def index_page():
  def get_system_stats(obj_response):
    obj_response.html("#system_stats", render_template('system_stats.html', system_stats=system_stats_check()))

  def services_status(obj_response):
    services_status = {
      'ble_devices': get_ble_devices_list(),
      'mqtt_brokers': get_mqtt_broker_list()
    }
    obj_response.html("#services_status_content", render_template('services_status.html', services_status=services_status))

  def livolo_ble_central_service_restart(obj_response):
    obj_response.html("#livolo_ble_central_service_status",
      '<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>' if service_operation('livolo_ble', 'restart') else '<i class="fa fa-arrow-circle-down" aria-hidden="true"></i>')

  def livolo_ble_central_service_status(obj_response):
    obj_response.html("#livolo_ble_central_service_status",
      '<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>' if service_operation('livolo_ble', 'status') else '<i class="fa fa-arrow-circle-down" aria-hidden="true"></i>')

  def settings_page_update(obj_response):
    obj_response.html("#settings_page_content", render_template('settings.html', settings=read_config_file_settings(args.config)))

  def settings_page_save(obj_response, data):
    with app.app_context():
      app.iniconfig.set('mqtt', 'broker', data['mqtt_broker'])
      app.iniconfig.set('mqtt', 'user', data['mqtt_broker_user'])
      app.iniconfig.set('mqtt', 'password', data['mqtt_broker_password'])
      app.iniconfig.set('mqtt', 'port', data['mqtt_broker_port'])
      app.iniconfig.set('mqtt', 'mysensors_in_topic_prefix', data['mysensors_mqtt_in_topic_prefix'])
      app.iniconfig.set('mqtt', 'mysensors_out_topic_prefix', data['mysensors_mqtt_out_topic_prefix'])
      app.iniconfig.set('mysensors', 'nodes_id', data['nodes_id'])
      app.iniconfig.set('mysensors', 'node_childs_alias', data['node_childs_alias'])
      app.iniconfig.set('mysensors', 'nodes_alias', data['nodes_alias'])
      app.iniconfig.set('ble', 'mac_addresses', data['mac_addresses'])

      with open(args.config, 'w') as config_file:
        app.iniconfig.write(config_file)
        config_file.flush()
        # synchronize file config change checker thread with write operations on it
        # very important - unwanted things can happen otherwise
        with ini_file_write:
          ini_file_write.notifyAll()
    obj_response.alert('Settings saved!')

  if g.sijax.is_sijax_request:
    # Sijax request detected - let Sijax handle it
    g.sijax.register_callback('get_system_stats', get_system_stats)
    g.sijax.register_callback('services_status', services_status)
    g.sijax.register_callback('livolo_ble_central_service_restart', livolo_ble_central_service_restart)
    g.sijax.register_callback('livolo_ble_central_service_status', livolo_ble_central_service_status)
    g.sijax.register_callback('settings_page_update', settings_page_update)
    g.sijax.register_callback('settings_page_save', settings_page_save)
    return g.sijax.process_request()
  return render_template('index.html')

def stop_app_cleanly():
  if mqtt_init_t is not None:
    mqtt_init_t.do_run = False
  if mqtt_check_t is not None:
    mqtt_check_t.do_run = False
  if app_cfg_check_t is not None:
    app_cfg_check_t.do_run = False
  if mqtt is not None and mqtt.connected:
    mqtt.client.disconnect()

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

def app_cfg_check():
  cfg_file_hash = check_file_md5sum(args.config)
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(0.1)
    if check_file_md5sum(args.config) != cfg_file_hash:
      logging.debug(
        "Configuration file: %s changed, restarting application: %s ..." % (args.config, __file__)
      )
      # synchronize file config change checker thread with write operations on it
      # very important - unwanted things can happen otherwise
      with ini_file_write:
        ini_file_write.wait(1) # use a timeout also to not block here
        # stop main application cleanly
        stop_app_cleanly()
        os.execv(__file__, sys.argv)

def load_flask_app_configs(settings):
  with app.app_context():
    app.config['MQTT_BROKER_URL'] = settings['mqtt_broker_url']
    app.config['MQTT_BROKER_PORT'] = settings['mqtt_broker_port']
    app.config['MQTT_USERNAME'] = settings['mqtt_broker_user']
    app.config['MQTT_PASSWORD'] = settings['mqtt_broker_password']
    app.config['MQTT_KEEPALIVE'] = settings['mqtt_broker_keepalive']
    app.config['FLASK_HOST'] = settings['flask_host']
    app.config['FLASK_PORT'] = settings['flask_port']
    app.config['MYS_BLE_STATS_TOPIC'] = settings['ble_stats_topic_prefix']
    app.config['SIJAX_STATIC_PATH'] = os.path.join('.', os.path.dirname(__file__), 'static/js/sijax/')
    app.config['SIJAX_JSON_URI'] = '/static/js/sijax/json2.js'

def setup():
  if not args.testing:
    # log to syslog
    logging.basicConfig(
      level=logging.DEBUG,
      format="[ble_webconfig_panel] %(message)s",
      handlers=[logging.handlers.SysLogHandler(address='/dev/log')]
    )
  else:
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(module)s][%(levelname)s] => %(message)s"
    )

  signal.signal(signal.SIGINT, sigint_handler)
  signal.signal(signal.SIGTERM, sigterm_handler)

  load_flask_app_configs(read_config_file_settings(args.config))
  flask_sijax.Sijax(app)

  global mqtt_init_t
  mqtt_init_t = threading.Thread(target=mqtt_init, args=(app,mqtt,))
  mqtt_init_t.setDaemon(True)
  mqtt_init_t.start()

  global mqtt_check_t
  mqtt_check_t = threading.Thread(target=mqtt_check, args=(mqtt,))
  mqtt_check_t.setDaemon(True)
  mqtt_check_t.start()

  global app_cfg_check_t
  app_cfg_check_t = threading.Thread(target=app_cfg_check)
  app_cfg_check_t.setDaemon(True)
  app_cfg_check_t.start()

  # synchronize file config change checker thread with write operations on it
  # very important - unwanted things can happen otherwise
  global ini_file_write
  ini_file_write = threading.Condition()

if __name__ == "__main__":
  arg_parser = ArgumentParser(description="BLE Webconfig Panel")
  arg_parser.add_argument(
    '--config',
    help="Configuration file",
    required=True
  )
  arg_parser.add_argument(
    '--testing',
    help="Testing mode",
    dest='testing',
    action='store_true',
    required=False
  )
  global args
  args = arg_parser.parse_args()
  setup()
  app.run(host=app.config['FLASK_HOST'], port=app.config['FLASK_PORT'])
