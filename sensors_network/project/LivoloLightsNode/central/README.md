## Project requirements

#### Prerequisites

1. Debian bases distros:

  sudo apt-get install build-essential python3 python3-dev python3-pip python3-setuptools python3-wheel python3-dbus python3-gi

2. Arch Linux:

  sudo pacman -S gcc python python-dev python-pip python-setuptools python-wheel python-dbus python-gobject

#### Bluez

 1. Install bluez stack from sources as described here: https://github.com/getsenic/gatt-python#installing-bluez-from-sources
 2. After installation make sure that the bluetooth service is enabled for automatic start on system reboot using this(for systemd): `sudo systemctl enable bluetooth`

#### Install python3 required packages

 1. sudo pip3 install -r requirements.txt (requirements.txt from this project location)
 2. apply the python gi patch from the project location **gatt_gi_patch** subfolder:
  
  `sudo cp ./gatt_gi_patch/gatt_linux.py /usr/local/lib/python3.5/dist-packages/gatt/gatt_linux.py`

## Starting application services

 There's a systemd script in the configs/systemd path from this project that you can adjust accordingly to your environment so that services will be started automatically at boot.

 Each application uses the `mys_ble.conf` configuration file from which it reads and updates required values - some are not exported to the web interface because it's internal stuff that users shouldn't change or mess with.

 Everytime you hit the save settings button from the web interface the mys_ble.conf file gets updated with the new values **AND** the services will restart automatically as they **listen** for this file changes.
 
**Manually starting services for testing (from main project directory):**
1. Livolo BLE main service:
`sudo ./livolo_ble.py --config ./configs/mys_ble.conf`
2. Web panel for configuration:
`./webconfig_panel/webconfig_panel.py --config ../configs/mys_ble.conf`

## Configuring application

 After webpanel started succesfully you can browse to http://<server_ip>:5000 and in the settings tab you need to:

**MQTT Section**

 - Configure MQTT broker details: **ip**, **user/pass** (if none are needed then leave those fields empty), **in/out** subscribe/publish mqtt topics(must be the same **prefix** as defined in **MyController** where you defined the MySensors MQTT gateway)
 
 **MySensors Section**

 - Unique node ID for each ble device that you want to connect to separated by commas(e.g.: 100,101)
 - Child aliases(name) for each sensor that the MySensors node has separated by commas AND by semicolon for each group of child aliases that corresponds to each node ID(e.g. Light1,Light2;Light1,Light2)
 - Node id alias/name for each ID defined at point a. separated by commas(e.g. LivingLights,BathroomLights)
 
 **Practical example:**
 
 Say you have 2 Livolo Switches one for Living room and one for bathroom and each has 2 channels(2 lights attached). Then you need to configure it like so:
 
 **Nodes id: 100,101**
 
 **Childs alias: LivingLight1,LivingLight2;BathroomLight1,BathroomLight2**
 
 **Nodes alias: LivingLights,BathroomLights**
 
 **BLE Section**
  - Add each BLE device(Livolo switch) MAC address separated by commas(e.g. c2:8a:74:27:11:7b,de:62:20:8f:8e:91)
 
 
 **Important**
 
  For each BLE node there's a 1 to 1 mapping with the MySensors section - in other words if you have 2 Livolo BLE switches you need to define 2 MySensors nodes using 2 nodes ID's, 2 groups of aliases and so on. The MAC address is unique for each BLE device and it can be fetched using a BLE scanner application.
  
  **The web panel application doesn't perform validation on the above fields so you need to set them correctly otherwise it may crash or unpredictible results may appear**


## How the livolo_ble application works:

* Sets up a logger
* Reads/parses the configuration file provided through CLI option: --config
* For each BLE device it creates a thread which takes care of:
  * BLE connection and auto reconnect in case of failure
  * MQTT client initialization and connection with auto reconnect in case of failure
  * MySensors internal messages are processed
  * MySensors user messages are processed
  * MySensors threads to publish lights state and battery state(this is not really required as this is not a battery powered device) at regular intervals(3 minutes and 5 minutes)
  * Configuration file changes are monitored in the main thread and application is automatically restarted in case it detects changes - for now it's monitoring the whole file and not by logical sections inside it - this means that whenever the config file changes both services are restarted: livolo_ble and webpanel 
  * On service termination all the threads are finished in a clean way and the BLE/MQTT connections too
