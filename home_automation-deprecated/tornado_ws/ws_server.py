#!/usr/bin/env python
 
import tornado.ioloop
import tornado.web
import tornado.websocket
import serial
import time
import threading
import signal
import os

class MainHandler(tornado.web.RequestHandler):
	def get(self):
		self.render(os.path.abspath(os.path.dirname(__file__)) + "/www_data/index.html")
		
		
class WSHandler(tornado.websocket.WebSocketHandler):
	connections = []
	
	def open(self):
		print "WebSocket opened"
		self.connections.append(self)

	def on_message(self, message):
		for conn in SerialPort.ports:
			conn.writer(message)

	def on_close(self):
		print "WebSocket closed"
		self.connections.remove(self)
		
class SerialPort():
	ports = []
	
	def __init__(self, serial_instance):
		self.mutex = threading.Lock()
		self.serial = serial_instance
		self.ports.append(self)
		self.hasToRun = True
		# set current date on startup
		self.set_datetime()
		self.t = threading.Timer(15.0, self.set_datetime)
	
	def start(self):
		self.thread_read = threading.Thread(target = self.reader)
		self.thread_read.start()
		self.t.start()
		
	def reader(self):
		while self.hasToRun:
			buffer = ''
			#buffer = ser.read(ser.inWaiting())
			buffer = ser.readline()
			if buffer:
				for conn in WSHandler.connections:
					conn.write_message(buffer)
			#time.sleep(0.5)
			
	def writer(self, data):
		self.mutex.acquire()
		self.serial.write(str(data) + "\r\n")
		self.mutex.release()

	def set_datetime(self):
		for port in self.ports:
			port.writer("date " + str(int(time.time() - time.altzone)))
		
def on_shutdown():
    print('Shutting down')
    tornado.ioloop.IOLoop.instance().stop()
    s.hasToRun = False
    ser.close()
		
application = tornado.web.Application([
	(r"/", MainHandler),
	(r'/(favicon.ico)', tornado.web.StaticFileHandler, {"path": ""}),
	(r"/images/(.*)",tornado.web.StaticFileHandler, {"path": os.path.abspath(os.path.dirname(__file__)) + "/www_data/images"},),
	(r"/lib/(.*)",tornado.web.StaticFileHandler, {"path": os.path.abspath(os.path.dirname(__file__)) + "/www_data/lib"},),
	(r"/css/(.*)",tornado.web.StaticFileHandler, {"path": os.path.abspath(os.path.dirname(__file__)) + "/www_data/css"},),
	(r"/ws",WSHandler),
	])

if __name__ == "__main__":
	ser = serial.Serial('/dev/ttyACM0', 115200)
	ser.timeout = 3
	s = SerialPort(ser)
	s.start()
	application.listen(8080)
	signal.signal(signal.SIGINT, lambda sig, frame: tornado.ioloop.IOLoop.instance().add_callback_from_signal(on_shutdown))
	tornado.ioloop.IOLoop.instance().start()

