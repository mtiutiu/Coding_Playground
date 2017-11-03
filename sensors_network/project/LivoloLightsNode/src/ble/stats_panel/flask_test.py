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
mqtt.subscribe('devices/ble/#')

ble = {}
ble['device_mac_address'] = 'none'
ble['device_state'] = 'none'

@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
  if 'state' in message.topic:
    device_mac_address = message.topic.split('/')[-2]
    print("Got BLE device with mac address: %s and state: %s" % (device_mac_address, message.payload.decode('ascii')))
    #with app.app_context():
    #  g.ble_device_mac_address = device_mac_address
    #  g.ble_device_state = message.payload.decode('ascii')
    ble['device_mac_address'] = device_mac_address
    ble['device_state'] = message.payload.decode('ascii')

@app.route('/')
def index_page():
  return render_template('index.html', ble=ble)

if __name__ == "__main__":
  app.run(host='0.0.0.0')
