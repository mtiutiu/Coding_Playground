#!/usr/bin/env python3

import logging
import mtypes
import time

class MySensor():
  def __init__(self, node_id, node_alias, node_childs_subtype=[], node_childs_alias=[], mqtt_instance=None, mqtt_in_topic=None, mqtt_out_topic=None, qos=0, retain=False):
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(levelname)s] => %(message)s"
    )
    self.node_id = node_id
    self.node_alias = node_alias
    self.node_childs_subtype = node_childs_subtype
    self.node_childs_alias = node_childs_alias
    self.mqtt = mqtt_instance
    self.mqtt_qos = qos
    self.mqtt_retain = retain
    self.mqtt_in_topic = mqtt_in_topic
    self.mqtt_out_topic = mqtt_out_topic
    self.NODE_SENSOR_ID = 255     # special child id used for internal messages
    self.BROADCAST_NODE_ID = 255  # special node id used for internal messages

  def register_mqtt(self, mqtt_instance, mqtt_in_topic, mqtt_out_topic, qos=0, retain=False):
    self.mqtt = mqtt_instance
    self.mqtt_qos = qos
    self.mqtt_retain = retain
    self.mqtt_in_topic = mqtt_in_topic
    self.mqtt_out_topic = mqtt_out_topic

  def _millis(self):
    return int(round(time.time() * 1000))

  def _mys_mycontroller_in(self, msg):
    mqtt_message = msg.payload.decode('ascii')
    mqtt_topic_data = msg.topic.split('/')
    node_id = int(mqtt_topic_data[1])
    child_id = int(mqtt_topic_data[2])
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

  def _send_presentation(self, child_sensor_id, child_sub_type, child_sensor_alias='Unknown', ack=0):
    data = {}
    data['child_sensor_id'] = child_sensor_id
    data['msg_type'] = mtypes.M_PRESENTATION
    data['ack'] = ack
    data['sub_type'] = child_sub_type # e.g. mtypes.S_BINARY
    data['payload'] = child_sensor_alias
    self._mys_mycontroller_out(data)

  def send_presentation(self, present_node_name=False, present_node_version=False):
    if present_node_name:
      self.send_sketch_name()
    if present_node_version:
      self.send_sketch_version()
    for index,child_alias in enumerate(self.node_childs_alias, start=1):
      self._send_presentation(index, self.node_childs_subtype[index-1], child_alias)

  def send_sketch_name(self, name=None, ack=0):
    data = {}
    data['child_sensor_id'] = self.NODE_SENSOR_ID
    data['msg_type'] = mtypes.M_INTERNAL
    data['ack'] = ack
    data['sub_type'] = mtypes.I_SKETCH_NAME
    data['payload'] = name if name is not None else self.node_alias
    self._mys_mycontroller_out(data)

  def send_sketch_version(self, version=None, ack=0):
    data = {}
    data['child_sensor_id'] = self.NODE_SENSOR_ID
    data['msg_type'] = mtypes.M_INTERNAL
    data['ack'] = ack
    data['sub_type'] = mtypes.I_SKETCH_VERSION
    data['payload'] = version if version is not None else 'Unknown'
    self._mys_mycontroller_out(data)

  def send_heartbeat(self, ack=0):
    data = {}
    data['child_sensor_id'] = self.NODE_SENSOR_ID
    data['msg_type'] = mtypes.M_INTERNAL
    data['ack'] = ack
    data['sub_type'] = mtypes.I_HEARTBEAT_RESPONSE
    data['payload'] = self._millis()
    self._mys_mycontroller_out(data)

  def send_discovery_response(self, parent_node_id=0, ack=0):
    data = {}
    data['child_sensor_id'] = self.NODE_SENSOR_ID
    data['msg_type'] = mtypes.M_INTERNAL
    data['ack'] = ack
    data['sub_type'] = mtypes.I_DISCOVER_RESPONSE
    data['payload'] = parent_node_id
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
