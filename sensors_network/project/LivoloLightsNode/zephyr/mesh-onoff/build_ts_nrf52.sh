#!/usr/bin/env bash

export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=${HOME}/Util/zephyr-sdk-0.11.1
export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

west build -p auto -b ts_nrf52 -- -DBOARD_DIR=./boards/arm/ts_nrf52 -DCONF_FILE="`dirname $0`/node_prj.conf"
