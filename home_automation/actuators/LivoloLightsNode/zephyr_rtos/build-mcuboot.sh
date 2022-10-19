#!/usr/bin/env bash

set -eu

source util.sh


function usage() {
    echo "Usage: build-app.sh [--help|-h] [--board <board_name>] [--upload]."
    echo "Example: build-mcuboot.sh --board tt_nrf52 --upload"
    exit 1
}

board=''
upload=0

while [[ $# -gt 0 ]]; do
    case $1 in
        --upload) upload=1 ;;
        --board) shift; board="$1" ;;
        --help|-h) usage ;;
        -*) echo "Unknown flag '$1'" 1>&2; usage 1>&2 ;;
        *) break ;;
    esac
    shift
done

if [[ ${board}null == "null" ]]; then
    echo -e "[ERROR] Please specify a board name to compile this project for !!!\n"
    usage
fi

# Check OS prerequisites for Zephyr RTOS
check_os_prerequisites

# Download and set up Zephyr SDK
prepare_zephyr_sdk

# Download and set up Zephyr RTOS
prepare_zephyr_rtos

build_mcuboot "$board" "$(pwd)"
