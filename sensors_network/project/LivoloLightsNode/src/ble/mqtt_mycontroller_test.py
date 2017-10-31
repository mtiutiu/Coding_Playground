#!/usr/bin/env python3

import mtypes
import paho.mqtt.client as mqtt
import time

def m2g(msg):
  tp = msg.topic.split('/')
  node_id=tp[2]
  child_id=tp[3]
  msg_type_s=tp[4]
  ack_s=tp[5]
  sub_type_s=tp[6]
  msg_type = mtypes.message_types[msg_type_s]
  if msg_type == mtypes.M_INTERNAL:
    sub_type = mtypes.internal_sub_types[sub_type_s]
  elif msg_type == mtypes.M_SET:
    sub_type = mtypes.set_sub_types[sub_type_s]
  elif msg_type == mtypes.M_PRESENTATION:
    sub_type = mtypes.presentation_sub_types[sub_type_s]
  else:
    print('WARNING unknown message sub type %s' % sub_type_s)

  return '%d;%d;%d;%d;%d;%s' % (int(node_id), int(child_id), msg_type, int(ack_s), sub_type, msg.payload)

def g2m(line, topic_prefix):
  try:
    node_id, child_sensor_id, msg_type_s, ack_s, sub_type_s, payload = line.split(';', 5)
    # message_type = int(msg_type_s)
    # sub_type = int(sub_type_s)
    # topic = topic + '/' + node_id
    # topic = topic + '/' + child_sensor_id
    # topic = topic + '/' + mtypes.message_types[message_type]
    #topic = topic + '/' + ack_s
    # if message_type == mtypes.M_PRESENTATION:
    #   topic = topic + '/' + mtypes.presentation_sub_types[sub_type]
    # elif message_type == mtypes.M_SET:
    #   topic = topic + '/' + mtypes.set_sub_types[sub_type]
    topic = "%s/%s/%s/%s/%s/%s" % (topic_prefix, node_id, child_sensor_id, msg_type_s, ack_s, sub_type_s)
    qos=0
    retain=False
    print("Publishing: %s on topic: %s" % (payload, topic))
    mqtt_client.publish(topic, payload, qos, retain)
  except ValueError:
    print("ValueError")


# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
  print("Connected with result code: %s " % (rc))
  mqtt_client.subscribe("mys-in/#")
  g2m("10;1;0;0;3;light1", "mys-out")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
  print("Received data: %s on topic: %s" % (msg.payload.decode('ascii'), msg.topic))

mqtt_client = mqtt.Client(client_id="livolo_ble", clean_session=True, userdata=None, protocol=mqtt.MQTTv311)
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message

mqtt_client.connect("localhost", 1883, 60)

# Blocking call that processes network traffic, dispatches callbacks and
# handles reconnecting.
# Other loop*() functions are available that give a threaded interface and a
# manual interface.
try:
  mqtt_client.loop_forever()
except KeyboardInterrupt:
  print("Ctrl-C, disconnecting ...")
  mqtt_client.disconnect()
