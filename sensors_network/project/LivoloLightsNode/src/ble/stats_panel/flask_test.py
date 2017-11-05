#!/usr/bin/env python3

from flask import Flask
from flask import render_template
from flask_mqtt import Mqtt

app = Flask(__name__)
app.config['MQTT_BROKER_URL'] = 'localhost'
app.config['MQTT_BROKER_PORT'] = 1883
app.config['MQTT_USERNAME'] = ''
app.config['MQTT_PASSWORD'] = ''
app.config['MQTT_REFRESH_TIME'] = 1.0  # refresh time in seconds
mqtt = Mqtt(app)

# mqtt ble devices topics
mqtt.subscribe('mys/devices/ble/#')

ble_devices = []

@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
  if 'state' in message.topic:
    device_states = {'0':'Offline', '1':'Online'}
    mac_address = message.topic.split('/')[-2]
    state = message.payload.decode('ascii')
    print("Got BLE device with mac address: %s and state: %s" % (mac_address, state))
    for ble_device in ble_devices:
      if ble_device['mac_address'] == mac_address:
        ble_device['state'] = device_states[state]
        return
    ble_devices.append({'mac_address': mac_address, 'state': device_states[state]})
		  

@app.route('/')
def index_page():
  return render_template('index.html', ble_devices=ble_devices)

@app.route('/ble')
def ble_page():
  return render_template('index.html', ble_devices=ble_devices)

if __name__ == "__main__":
  app.run(debug=True, host='0.0.0.0')
