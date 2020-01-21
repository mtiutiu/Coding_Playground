#!/usr/bin/env bash

export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=${HOME}/Util/zephyr-sdk-0.10.3
export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

west build -p auto -b holyiot_17095 -- -DBOARD_DIR=./boards/arm/holyiot_17095 -DCONF_FILE="`dirname $0`/node_prj.conf"
