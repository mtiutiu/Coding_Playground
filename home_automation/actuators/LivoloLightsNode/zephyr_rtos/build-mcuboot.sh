#!/usr/bin/env bash

set -eu

ZEPHYR_VERSION="2.7.1"
ZEPHYR_SDK_VERSION="0.13.2"

ZEPHYR_RELEASE="zephyr-v${ZEPHYR_VERSION}"
ZEPHYR_SDK_RELEASE="zephyr-sdk-${ZEPHYR_SDK_VERSION}"

ZEPHYR_PROJ_DIR="zephyrproject-v${ZEPHYR_VERSION}"
ZEPHYR_SDK_DIR="$HOME/.local/${ZEPHYR_SDK_RELEASE}"

function usage() {
    echo "Usage: build-app.sh [--help|-h] [--board <board_name>] [--upload]."
    echo "Example: build-app.sh --board tt_nrf52 --upload"
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

# Check requirements
cmake &> /dev/null || {
    wget https://apt.kitware.com/kitware-archive.sh

    sudo bash kitware-archive.sh && rm -f kitware-archive.sh
    sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
        ccache dfu-util device-tree-compiler wget \
        python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
        make gcc gcc-multilib g++-multilib libsdl2-dev
}

west &> /dev/null || {
    echo "[INFO] West tool is missing, installing it ..."
    pip3 install --user -U west
}

if [[ ! -d "$ZEPHYR_SDK_DIR" ]]; then
echo "[INFO] Zephyr SDK was not found, installing it to $ZEPHYR_SDK_DIR ..."
    wget "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/zephyr-sdk-${ZEPHYR_SDK_VERSION}-linux-$(uname -m)-setup.run" -O \
        "zephyr-sdk-${ZEPHYR_SDK_VERSION}-linux-x86_64-setup.run"
    chmod u+x "zephyr-sdk-${ZEPHYR_SDK_VERSION}-linux-x86_64-setup.run"
    ./zephyr-sdk-${ZEPHYR_SDK_VERSION}-linux-x86_64-setup.run -- -d "$ZEPHYR_SDK_DIR" && \
    rm -f "zephyr-sdk-${ZEPHYR_SDK_VERSION}-linux-x86_64-setup.run"
fi

if [[ ! -d "$ZEPHYR_PROJ_DIR" ]]; then
    echo "[INFO] Zephyr repo was not found in current workspace, fetching it ..."
    west init --mr "$ZEPHYR_RELEASE" "${ZEPHYR_PROJ_DIR}"
    (cd "$ZEPHYR_PROJ_DIR" && west update)
    pip3 install --user -r "${ZEPHYR_PROJ_DIR}/zephyr/scripts/requirements.txt"
fi

source "${ZEPHYR_PROJ_DIR}/zephyr/zephyr-env.sh"

west zephyr-export

west build -p auto -b "$board" "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/boot/zephyr" -d build-mcuboot -- -DBOARD_ROOT="$(pwd)"

if [[ "$upload" == "1" ]]; then
    west flash -r jlink -d build-mcuboot
fi
