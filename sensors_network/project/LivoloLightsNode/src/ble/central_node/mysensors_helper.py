import logging
import mtypes
import time
import paho.mqtt.client as mqtt
import threading

class MySensor():
  def __init__(self, node_id, node_alias, node_childs_subtype=[], node_childs_alias=[],
    mqtt_broker='localhost', mqtt_broker_port=1883, mqtt_broker_user='', mqtt_broker_passwd='',
    mqtt_in_topic=None, mqtt_out_topic=None, qos=0, retain=False, keepalive=60):
    logging.basicConfig(
      level=logging.DEBUG,
      format="[%(asctime)s][%(levelname)s] => %(message)s"
    )
    self.node_id = node_id
    self.node_alias = node_alias
    self.node_childs_subtype = node_childs_subtype
    self.node_childs_alias = node_childs_alias
    self.child_count = len(node_childs_subtype)
    self.is_mqtt_connected = False
    self.mqtt_qos = qos
    self.mqtt_retain = retain
    self.keepalive = keepalive
    self.mqtt_broker = mqtt_broker
    self.mqtt_broker_port = mqtt_broker_port
    self.mqtt_broker_user = mqtt_broker_user
    self.mqtt_broker_passwd = mqtt_broker_passwd
    self.mqtt_in_topic = mqtt_in_topic
    self.mqtt_out_topic = mqtt_out_topic
    self.NODE_SENSOR_ID = 255     # special child id used for internal messages
    self.BROADCAST_NODE_ID = 255  # special node id used for internal messages

  def begin(self):
    logging.debug("Instantiating mqtt client ...")
    self.mqtt = mqtt.Client()
    self.mqtt.username_pw_set(
      username=self.mqtt_broker_user,
      password=self.mqtt_broker_passwd
    )
    self.mqtt.on_connect = self.on_connect
    self.mqtt.on_disconnect = self.on_disconnect
    self.mqtt.on_message = self.on_message

    logging.debug("Starting MQTT connect thread ...")
    self.mqtt_connect_t = threading.Thread(target=self.connect_to_mqtt_broker)
    self.mqtt_connect_t.setDaemon(True)
    self.mqtt_connect_t.start()

  def stop(self):
    if self.mqtt_connect_t is not None:
      logging.debug("Disconnecting and stopping MQTT threads ...")
      self.mqtt_connect_t.do_run = False
      self.mqtt.disconnect()
      self.mqtt.loop_stop()

  def connect_to_mqtt_broker(self):
    logging.debug(
      "Connecting to mqtt broker: %s ..." % (self.mqtt_broker)
    )
    self.is_mqtt_connected = False
    while getattr(threading.currentThread(), "do_run", True) and not self.is_mqtt_connected:
      time.sleep(1)
      try:
        self.is_mqtt_connected = (self.mqtt.connect(
          self.mqtt_broker,
          self.mqtt_broker_port,
          self.keepalive
        ) == mqtt.MQTT_ERR_SUCCESS)
        break
      except Exception:
        logging.debug(
          "Could not connect to mqtt broker: %s, retrying ..." % (self.mqtt_broker)
        )
    if self.is_mqtt_connected:
      logging.debug("Starting mqtt main loop thread ...")
      self.mqtt.loop_start()

  def register_mys_cb(self, cb):
    self.msg_cb = cb

  # The callback for when the client receives a CONNACK response from the server.
  def on_connect(self, client, userdata, flags, rc):
    self.is_mqtt_connected = True
    logging.debug(
      "Connected to mqtt broker: %s with result code: %s ..." %
        (self.mqtt_broker, rc)
    )
    client.subscribe(
      "%s/%s/#" %
      (self.mqtt_in_topic, self.node_id)
    )
    client.subscribe(
      "%s/%s/#" %
      (self.mqtt_in_topic, self.BROADCAST_NODE_ID)
    )
    # send mysensors node presentation
    self.send_presentation(present_node_name=True)

  def on_disconnect(self, client, userdata, rc=0):
    self.is_mqtt_connected = False
    logging.debug(
      "Got disconnect from mqtt broker with result code: %s ..." % (rc)
    )

  # The callback for when a PUBLISH message is received from the server.
  # Process MySensors messages and take decisions
  def on_message(self, client, userdata, msg):
    node_id, child_id, cmd_type, ack, sub_type, payload = self._mys_mycontroller_in(msg)

    # process internal messages here
    if cmd_type == mtypes.M_INTERNAL:
      if sub_type == mtypes.I_PRESENTATION:
        logging.debug(
          "Received I_PRESENTATION internal command on topic: %s" % (msg.topic)
        )
        self.send_presentation(present_node_name=True)
      elif sub_type == mtypes.I_DISCOVER_REQUEST:
        logging.debug(
          "Received I_DISCOVER_REQUEST internal command on topic: %s" % (msg.topic)
        )
        self.send_discovery_response()
      elif sub_type == mtypes.I_HEARTBEAT_REQUEST:
        logging.debug(
          "Received I_HEARTBEAT_REQUEST internal command on topic: %s" % (msg.topic)
        )
        self.send_heartbeat()
      elif sub_type == mtypes.I_REBOOT:
        logging.debug(
          "Received I_REBOOT internal command on topic: %s" % (msg.topic)
        )
      else:
        logging.debug(
          "Received unknown data: %s on topic: %s" % (msg.payload, msg.topic)
        )

    # call user callback to pass received MySensors data
    if self.msg_cb is not None:
      data = {
        'node_id': node_id,
        'child_id': child_id,
        'cmd_type': cmd_type,
        'ack': ack,
        'sub_type': sub_type,
        'payload': payload
      }
      self.msg_cb(data)

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
    return (node_id, child_id, cmd_type, ack, sub_type, mqtt_message)

  def _mys_mycontroller_out(self, data):
    try:
      if self.mqtt is not None and self.is_mqtt_connected:
        topic = "%s/%s/%s/%s/%s/%s" % (
          self.mqtt_out_topic,
          self.node_id,
          data['child_sensor_id'],
          data ['msg_type'],
          data ['ack'],
          data['sub_type']
        )
        logging.debug("Publishing: %s on topic: %s" % (data['payload'], topic))
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

  def send_presentation(self, present_node_name=False, present_node_version=False, ack=0):
    # present this node as a MySensors node first
    self._send_presentation(self.NODE_SENSOR_ID, mtypes.S_ARDUINO_NODE, '', ack)
    if present_node_name:
      self.send_sketch_name()
    if present_node_version:
      self.send_sketch_version()
    for index,child_alias in enumerate(self.node_childs_alias, start=1):
      self._send_presentation(index, self.node_childs_subtype[index-1], child_alias, ack)

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

  def send_battery_level(self, value, ack=0):
    data = {}
    data['child_sensor_id'] = self.NODE_SENSOR_ID
    data['msg_type'] = mtypes.M_INTERNAL
    data['ack'] = ack
    data['sub_type'] = mtypes.I_BATTERY_LEVEL
    data['payload'] = value
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
