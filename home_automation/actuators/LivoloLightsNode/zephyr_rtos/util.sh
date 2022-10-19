ZEPHYR_VERSION="3.1.0"
ZEPHYR_SDK_VERSION="0.14.2"

ZEPHYR_RELEASE="zephyr-v${ZEPHYR_VERSION}"
ZEPHYR_SDK_RELEASE="zephyr-sdk-${ZEPHYR_SDK_VERSION}"
ZEPHYR_ASSETS_BASE_DIR="${HOME}/.local"
ZEPHYR_PROJ_DIR="${ZEPHYR_ASSETS_BASE_DIR}/zephyrproject-v${ZEPHYR_VERSION}"
ZEPHYR_SDK_DIR="${ZEPHYR_ASSETS_BASE_DIR}/$ZEPHYR_SDK_RELEASE"

function check_os() {
  OS_VARIANT="unknown"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_VARIANT="linux"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_VARIANT="macos"
  else
    echo "OS - $OSTYPE is not supported !"
    exit 1
  fi
}

function check_os_prerequisites() {
  check_os

  echo "[INFO] Fetching operating system dependencies ..."

  # for now only Debian based distros
  if [[ "$OS_VARIANT" == "linux" ]]; then
    sudo apt install -y --no-install-recommends \
        git cmake ninja-build gperf wget \
        ccache dfu-util device-tree-compiler \
        python3 python3-pip python3-setuptools \
        python3-dev python3-tk python3-wheel xz-utils \
        file make gcc gcc-multilib g++-multilib libsdl2-dev

    wget https://apt.kitware.com/kitware-archive.sh

    sudo bash kitware-archive.sh && rm -f kitware-archive.sh

    sudo apt install -y --no-install-recommends cmake
  fi

  if [[ "$OS_VARIANT" == "macos" ]]; then
    brew install \
        cmake ninja gperf python3 \
        ccache qemu dtc wget libmagic
  fi

  python3 -m west &> /dev/null || {
    echo "[INFO] West tool is missing, installing it ..."
    pip3 install --user -U west
  }
}

function fetch_zephyr_sdk() {
  # TODO - better dir handling
  local WORKING_DIR="${1%/*}"
  local OS_VARIANT="none"
  local ARCH="$(uname -m)"

  check_os

  local ZEPHYR_SDK_GH_URL="https://github.com/zephyrproject-rtos/sdk-ng/releases/download"
  local ZEPHYR_SDK_ARCHIVE="${ZEPHYR_SDK_GH_URL}/v${ZEPHYR_SDK_VERSION}/${ZEPHYR_SDK_RELEASE}_${OS_VARIANT}-${ARCH}.tar.gz"

  echo "[INFO] Fetching Zephyr SDK version $ZEPHYR_SDK_VERSION ..."

  (
    cd "$WORKING_DIR"
    echo "[INFO] Zephyr SDK was not found, installing it to $WORKING_DIR ..."
    wget  "$ZEPHYR_SDK_ARCHIVE" -O "${ZEPHYR_SDK_RELEASE}_${OS_VARIANT}-${ARCH}.tar.gz"
    tar xvf "${ZEPHYR_SDK_RELEASE}_${OS_VARIANT}-${ARCH}.tar.gz"
    (cd "${ZEPHYR_SDK_RELEASE}" && ./setup.sh -h -c) && rm -f "${ZEPHYR_SDK_RELEASE}_${OS_VARIANT}-${ARCH}.tar.gz"
  )
}

function fetch_zephyr_rtos() {
  local WORKING_DIR="$1"

  echo "[INFO] Fetching Zephyr RTOS source tree for release version $ZEPHYR_RELEASE ..."
  python3 -m west init --mr "$ZEPHYR_RELEASE" "${WORKING_DIR}"
  (cd "$WORKING_DIR" && python3 -m west update)
}

function prepare_zephyr_sdk() {
  if [[ ! -d "$ZEPHYR_ASSETS_BASE_DIR" ]]; then
    mkdir -p "$ZEPHYR_ASSETS_BASE_DIR"
  fi

  if [[ ! -d "$ZEPHYR_SDK_DIR" ]]; then
    fetch_zephyr_sdk "$ZEPHYR_SDK_DIR"
  fi
}

function prepare_zephyr_rtos() {
  if [[ ! -d "$ZEPHYR_ASSETS_BASE_DIR" ]]; then
    mkdir -p "$ZEPHYR_ASSETS_BASE_DIR"
  fi

  if [[ ! -d "$ZEPHYR_PROJ_DIR" ]]; then
    fetch_zephyr_rtos "$ZEPHYR_PROJ_DIR"
  fi
}

function prepare_zephyr_env() {
  if [[ ! -d "$ZEPHYR_ASSETS_BASE_DIR" ]]; then
    mkdir -p "$ZEPHYR_ASSETS_BASE_DIR"
  fi

  python3 -m venv "${ZEPHYR_ASSETS_BASE_DIR}/.zephyr_venv"
  source "${ZEPHYR_ASSETS_BASE_DIR}/.zephyr_venv/bin/activate"

  pip3 install -r "${ZEPHYR_PROJ_DIR}/zephyr/scripts/requirements.txt"

  source "${ZEPHYR_PROJ_DIR}/zephyr/zephyr-env.sh"

  python3 -m west zephyr-export
}

function build_mcuboot() {
  local BOARD="$1"
  local BOARDS_DIR="$2"

  prepare_zephyr_env

  python3 -m west build \
    -p auto \
    -b "$BOARD" \
    "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/boot/zephyr" \
    -d build-mcuboot -- -DBOARD_ROOT="$BOARDS_DIR"

  if [[ "$upload" == "1" ]]; then
    python3 -m west flash \
      -r jlink \
      -d build-mcuboot
  fi
}

function build_app() {
  local BOARD="$1"
  local VERSION="$2"
  local UPLOAD="$3"

  prepare_zephyr_env

  python3 -m west build -p auto -b "$BOARD"

  if [[ "${VERSION}null" != "null" ]]; then
      python3 -m west sign \
        -t imgtool -- \
        --key "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/root-rsa-2048.pem" \
        --version "$VERSION"
  else
      python3 -m west sign \
        -t imgtool -- \
        --key "${ZEPHYR_PROJ_DIR}/bootloader/mcuboot/root-rsa-2048.pem"
  fi

  if [[ "$UPLOAD" == "1" ]]; then
      python3 -m west flash \
        -r jlink \
        --hex-file ./build/zephyr/zephyr.signed.hex
  fi
}
