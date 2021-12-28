#!/usr/bin/env bash

set -eu

ZEPHYR_RELEASE="zephyr-v2.7.1"
ZEPHYR_PROJ_DIR="zephyrproject-${ZEPHYR_RELEASE##*-}"

function usage() {
    echo "Usage: build-app.sh [--help|-h] [--board <board_name>] [--version <x.y.z>] [--upload]."
    echo "Example: build-app.sh --board tt_nrf52 --version 0.0.1"
    exit 1
}

board=''
version=''
upload=0

while [[ $# -gt 0 ]]; do
    case $1 in
        --upload) upload=1 ;;
        --version) shift; version="$1" ;;
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

# Check requirements
west &> /dev/null || {
    echo "[INFO] West tool is missing, installing it ..."
    pip3 install --user -U west
}

if [[ ! -d "$ZEPHYR_PROJ_DIR" ]]; then
    echo "[INFO] Zephyr repo was not found in current workspace, fetching it ..."
    west init --mr "$ZEPHYR_RELEASE" "${ZEPHYR_PROJ_DIR}"
    (cd "$ZEPHYR_PROJ_DIR" && west update)
    pip3 install --user -r "${ZEPHYR_PROJ_DIR}/zephyr/scripts/requirements.txt"
fi

source "${ZEPHYR_PROJ_DIR}/zephyr/zephyr-env.sh"

west zephyr-export

west build -p auto -b "$board"

if [[ "${version}null" != "null" ]]; then
    west sign -t imgtool -- --key "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/root-rsa-2048.pem" --version "$version"
else
    west sign -t imgtool -- --key "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/root-rsa-2048.pem"
fi

if [[ "$upload" == "1" ]]; then
    west flash -r jlink --hex-file ./build/zephyr/zephyr.signed.hex
fi
