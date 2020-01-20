#!/usr/bin/env bash

export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

if [[ "${1}null" == "null" ]]; then
  echo "Please provide prj conf file!"
  exit 1
fi

west build --pristine -b arduino_bt -- -DBOARD_DIR=./boards/arm/arduino_bt -DCONF_FILE="$1"
