ZEPHYR_VERSION="3.1.0"
ZEPHYR_SDK_VERSION="0.14.2"

ZEPHYR_RELEASE="zephyr-v${ZEPHYR_VERSION}"
ZEPHYR_SDK_RELEASE="zephyr-sdk-${ZEPHYR_SDK_VERSION}"


function fetch_zephyr_sdk() {
  # TODO - better dir handling
  local WORKING_DIR="${1%/*}"

  (
    cd "$WORKING_DIR"
    echo "[INFO] Zephyr SDK was not found, installing it to $WORKING_DIR ..."
    wget "https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${ZEPHYR_SDK_VERSION}/${ZEPHYR_SDK_RELEASE}_linux-$(uname -m).tar.gz" -O \
        "${ZEPHYR_SDK_RELEASE}-linux-$(uname -m).tar.gz"
    tar xvf "${ZEPHYR_SDK_RELEASE}-linux-$(uname -m).tar.gz"
    (cd "${ZEPHYR_SDK_RELEASE}" && ./setup.sh -h -c) && rm -f "${ZEPHYR_SDK_RELEASE}-linux-$(uname -m).tar.gz"
  )
}

function fetch_zephyr_rtos() {
  local WORKING_DIR="$1"

  echo "[INFO] Zephyr repo was not found in current workspace, fetching it ..."
  west init --mr "$ZEPHYR_RELEASE" "${WORKING_DIR}"
  (cd "$WORKING_DIR" && west update)
  pip3 install --user -r "${WORKING_DIR}/zephyr/scripts/requirements.txt"
}

function check_zephyr_prerequisites() {
  cmake &> /dev/null || {
    echo "[INFO] Cmake is missing, installing it ..."

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
}
