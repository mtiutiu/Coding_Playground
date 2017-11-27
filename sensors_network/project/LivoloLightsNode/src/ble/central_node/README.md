### Project requirements

#### Prerequisites

1. Debian bases distros:

  sudo apt-get install build-essential python3 python3-dev python3-pip python3-setuptools python3-wheel python3-dbus python3-gi

2. Arch Linux:

  sudo pacman -S gcc python python-dev python-pip python-setuptools python-wheel python-dbus python-gobject

#### Bluez

 Install bluez stack from sources as described here: https://github.com/getsenic/gatt-python#installing-bluez-from-sources

#### Install python3 required packages

  sudo pip3 install -r requirements.txt (requirements.txt from this project location)

#### Starting services

1. Livolo BLE main service(from main project directory):
`sudo ./livolo_ble.py --config ./configs/mys_ble.conf`
2. Web panel for configuration:
`./webconfig_panel/webconfig_panel.py --config ../configs/mys_ble.conf`

### Configuring application

After webpanel started succesfully you can browse to http://<server_ip>:5000 and in the settings tab you need to:

**MQTT Section**

 - Configure MQTT broker details: **ip**, **user/pass** (if none are needed then leave those fields empty), **in/out** subscribe/publish mqtt topics(must be the same **prefix** as defined in **MyController** where you defined the MySensors MQTT gateway)
 
 **MySensors Section**

  a. Unique node ID for each ble device that you want to connect to separated by commas
  
  b. Child aliases(name) for each sensor that the MySensors node has separated by commas AND by semicolon for each group of child aliases that corresponds to each node ID
  
  c. Node id alias/name for each ID defined at point a. separated by commas
 
 **BLE Section**
  - Add each BLE device(Livolo switch) MAC address separated by commas
  
 **Important**
  
  The web panel application doesn't perform validation on the above fields so you need to set them correctly otherwise it may crash or unpredictible results may appear
