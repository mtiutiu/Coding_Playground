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

app = Flask(__name__)
app.iniconfig = FlaskIni()
with app.app_context():
  app.iniconfig.read('/etc/default/flask_ble.conf')
  app.config['MQTT_BROKER_URL'] = app.iniconfig.get('mqtt', 'broker')
  app.config['MQTT_BROKER_PORT'] = app.iniconfig.getint('mqtt', 'port', fallback=1883)
  app.config['MQTT_USERNAME'] = app.iniconfig.get('mqtt', 'user', fallback='')
  app.config['MQTT_PASSWORD'] = app.iniconfig.get('mqtt', 'password', fallback='')
  app.config['MQTT_REFRESH_TIME'] = app.iniconfig.getfloat('mqtt', 'refresh_time', fallback=1.0)  # refresh time in seconds
  app.config['FLASK_HOST'] = app.iniconfig.get('flask', 'host', fallback='localhost')
  app.config['FLASK_PORT'] = app.iniconfig.getint('flask', 'port', fallback=5000)
  app.config['MYS_BLE_STATS_TOPIC'] = app.iniconfig.get('mqtt', 'stats_topic_prefix')

app.config['SIJAX_STATIC_PATH'] = os.path.join('.', os.path.dirname(__file__), 'static/js/sijax/')
app.config['SIJAX_JSON_URI'] = '/static/js/sijax/json2.js'
flask_sijax.Sijax(app)

mqtt = Mqtt()
is_mqtt_subscribed = False

ble_devices = []

def mqtt_check(mqtt):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1) # give some break to CPU
    if not mqtt.connected:
      logging.debug("Not connected to mqtt broker: %s ..." %(app.config['MQTT_BROKER_URL']))
    else:
      # mqtt ble devices topics
      if not is_mqtt_subscribed:
        mqtt.subscribe("%s/#" % app.config['MYS_BLE_STATS_TOPIC'])

def mqtt_init(app, mqtt):
  while getattr(threading.currentThread(), "do_run", True):
    time.sleep(1) # give some break to CPU
    try:
      mqtt.init_app(app)
      break
    except Exception:
      logging.debug("Could not connect to mqtt broker: %s, retrying ..." %(app.config['MQTT_BROKER_URL']))
      continue
    # mqtt ble devices topics
    if not is_mqtt_subscribed:
      mqtt.subscribe("%s/#" % app.config['MYS_BLE_STATS_TOPIC'])

@mqtt.on_subscribe()
def handle_subscribe(client, userdata, mid, granted_qos):
  logging.debug('Subscription id {} granted with qos {}.'.format(mid, granted_qos))
  global is_mqtt_subscribed
  is_mqtt_subscribed = True

@mqtt.on_unsubscribe()
def handle_unsubscribe(client, userdata, mid):
  logging.debug('Unsubscribed from topic (id: {})'.format(mid))
  global is_mqtt_subscribed
  is_mqtt_subscribed = False

@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
  if 'state' in message.topic:
    mac_address = message.topic.split('/')[-2]
    state = message.payload.decode('ascii')
    logging.debug("Got BLE device with mac address: %s and state: %s" % (mac_address, state))
    # check if device already added to list and return
    for ble_device in ble_devices:
      if ble_device['mac_address'] == mac_address:
        # if new state is different from previous then do an update
        if state != ble_device['connected']:
          ble_device['connected'] = state
        return
    # if device not known then add it
    ble_devices.append({'mac_address': mac_address, 'connected': state})

@flask_sijax.route(app, '/')
def index_page():
  def ble_devices_list_update(obj_response):
    obj_response.html("#ble_dev_list", render_template('ble_dev_list.html', ble_devices=ble_devices))

  def mqtt_broker_list_update(obj_response):
    mqtt_brokers = [
      { 'address':app.config['MQTT_BROKER_URL'],
        'port':app.config['MQTT_BROKER_PORT'],
        'connected':mqtt.connected
      }
    ]
    obj_response.html("#mqtt_broker_list", render_template('mqtt_broker_list.html', mqtt_brokers=mqtt_brokers))

  if g.sijax.is_sijax_request:
    # Sijax request detected - let Sijax handle it
    g.sijax.register_callback('ble_devices_list_update', ble_devices_list_update)
    g.sijax.register_callback('mqtt_broker_list_update', mqtt_broker_list_update)
    return g.sijax.process_request()
  return render_template('index.html', ble_devices=ble_devices)

def exit_cleanly(message):
  logging.debug(message)
  mqtt_init_t.do_run = False
  mqtt_check_t.do_run = False
  if mqtt.connected:
    mqtt.client.disconnect()
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

  global mqtt_init_t
  mqtt_init_t = threading.Thread(target=mqtt_init, args=(app,mqtt,))
  mqtt_init_t.start()
  global mqtt_check_t
  mqtt_check_t = threading.Thread(target=mqtt_check, args=(mqtt,))
  mqtt_check_t.start()

if __name__ == "__main__":
  setup()
  app.run(host=app.config['FLASK_HOST'], port=app.config['FLASK_PORT'])
