#!/usr/bin/env python3

import logging
import mtypes

class MySensor():
  def __init__(self, node_id, node_alias, mqtt_instance=None, mqtt_in_topic=None, mqtt_out_topic=None, qos=0, retain=False):
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(levelname)s] => %(message)s"
    )
    self.node_id = node_id
    self.node_alias = node_alias
    self.mqtt = mqtt_instance
    self.mqtt_qos = qos
    self.mqtt_retain = retain
    self.mqtt_in_topic = mqtt_in_topic
    self.mqtt_out_topic = mqtt_out_topic

  def register_mqtt(self, mqtt_instance, mqtt_in_topic, mqtt_out_topic, qos=0, retain=False):
    self.mqtt = mqtt_instance
    self.mqtt_qos = qos
    self.mqtt_retain = retain
    self.mqtt_in_topic = mqtt_in_topic
    self.mqtt_out_topic = mqtt_out_topic

  def _mys_mycontroller_in(self, msg):
    mqtt_message = msg.payload.decode('ascii')
    mqtt_topic_data = msg.topic.split('/')
    node_id = int(mqtt_topic_data[1])
    child_id = mqtt_topic_data[2]
    cmd_type = int(mqtt_topic_data[3])
    ack = int(mqtt_topic_data[4])
    sub_type = int(mqtt_topic_data[5])
    return (child_id, cmd_type, sub_type, mqtt_message)

  def _mys_mycontroller_out(self, data):
    try:
      topic = "%s/%s/%s/%s/%s/%s" % (
        self.mqtt_out_topic,
        self.node_id,
        data['child_sensor_id'],
        data ['msg_type'],
        data ['ack'],
        data['sub_type']
      )
      logging.debug("Publishing: %s on topic: %s" % (data['payload'], topic))
      if self.mqtt is not None:
        self.mqtt.publish(topic, data['payload'], self.mqtt_qos, self.mqtt_retain)
    except Exception as ex:
      logging.debug(ex)

  def send_presentation(self, child_sensor_id, child_sub_type, child_sensor_alias='Unknown', ack=0):
    data = {}
    data['child_sensor_id'] = child_sensor_id
    data['msg_type'] = mtypes.M_PRESENTATION
    data['ack'] = ack
    data['sub_type'] = child_sub_type # e.g. mtypes.S_BINARY
    data['payload'] = child_sensor_alias
    self._mys_mycontroller_out(data)

  def send(self, child_sensor_id, variable_type, payload, ack=0):
    data = {}
    data['child_sensor_id'] = child_sensor_id
    data['msg_type'] = mtypes.M_SET
    data['ack'] = ack
    data['sub_type'] = variable_type # e.g. mtypes.V_STATUS
    data['payload'] = payload
    self._mys_mycontroller_out(data)

  def read(self, msg):
    return self._mys_mycontroller_in(msg)
