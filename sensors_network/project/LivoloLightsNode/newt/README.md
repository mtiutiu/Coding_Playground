
# Bluetooth Mesh lighting solution

## Overview

This is the bluetooth mesh custom firmware made for the boards available [here](https://github.com/mtiutiu/Hardware_Playground/tree/master/IOT/node/livolo_EU_switch/VL-C700X-1_Ver_C2/NRF52832).

## Building

1. Prerequisites

- Download the Apache Newt tool, as documented in the [Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
- Obtain and install `GCC ARM Embedded` for your OS as described [here](https://mynewt.apache.org/latest/get_started/native_install/cross_tools.html#installing-the-arm-cross-toolchain)
- Depending on your hardware you need JLink or OpenOCD installed also as described [here](https://mynewt.apache.org/latest/get_started/native_install/cross_tools.html#installing-the-debuggers)
- Every following step is done inside the [newt](https://github.com/mtiutiu/Coding_Playground/tree/master/sensors_network/project/LivoloLightsNode/newt) directory from this repo

2. From the [project directory](https://github.com/mtiutiu/Coding_Playground/tree/master/sensors_network/project/LivoloLightsNode/newt) issue the following command to download the project dependencies

```
  $ newt upgrade
```
```
Note:
 If getting this `Error: Error updating "mcuboot": error: The following untracked working tree files would be overwritten by checkout...` then you can safely delete the `repos/mcuboot/ext` directory and run `newt upgrade again`
```

3. Build the bootloader target and flash it to your specific bsp (available targets can be seen [here](https://github.com/mtiutiu/Coding_Playground/tree/master/sensors_network/project/LivoloLightsNode/newt/targets))
Let's build this for the HolyIOT NRF52 based board:

```
  $ newt build holyiot_17095_boot
  $ newt load holyiot_17095_boot
```

4. Build and flash the main application for the same BSP by taking the one channel example:

```
  $ newt build light_mesh_holyiot_17095_1ch
  $ newt create-image light_mesh_holyiot_17095_1ch 0.1
  $ newt load light_mesh_holyiot_17095_1ch
```

5. Start the provisioning process as documented on my [blog](https://mtiutiu.design.blog/2020/05/06/intelligent-light-switches-part-2)


See also:
[Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
