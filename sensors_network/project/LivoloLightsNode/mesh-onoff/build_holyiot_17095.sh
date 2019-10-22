#!/usr/bin/env bash

export ZEPHYR_BASE=${HOME}/Work/zephyrproject/zephyr

west build --pristine -b holyiot_17095 -- -DBOARD_DIR=./boards/arm/holyiot_17095
