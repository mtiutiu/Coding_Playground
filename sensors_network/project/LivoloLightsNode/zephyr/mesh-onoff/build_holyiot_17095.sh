#!/usr/bin/env bash

export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=${HOME}/Util/zephyr-sdk-0.10.3
export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

if [[ "${1}null" == "null" ]]; then
  echo "Please provide prj conf file!"
  exit 1
fi

west build -p auto -b holyiot_17095 -- -DBOARD_DIR=./boards/arm/holyiot_17095 -DCONF_FILE="$1"
