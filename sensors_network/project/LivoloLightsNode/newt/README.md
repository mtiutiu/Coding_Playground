<!--
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
-->

# Apache Nimble Mesh Generic OnOff test app

## Overview

Testing BLE Mesh generic onoff server/client

## Building

1. Prerequisites

- Download the Apache Newt tool, as documented in the [Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
- Obtain and install `GCC ARM Embedded` for your OS (and make the `bin` directory available in the `PATH` env variable)
- Depending on your hardware you need JLink or OpenOCD installed also (and available in `PATH`)
- Every following step is done inside the [newt](https://github.com/mtiutiu/Coding_Playground/tree/master/sensors_network/project/LivoloLightsNode/newt) directory from this repo

2. Download the project dependencies

```
  $ newt upgrade
```
```
Note:
 If getting this `Error: Error updating "mcuboot": error: The following untracked working tree files would be overwritten by checkout...` you can safely delete the `repos/mcuboot/ext` directory and run `newt upgrade again`
```

3. Create a new target for the bootloader then build and flash it to your specific bsp ([available bsp's](https://github.com/apache/mynewt-core/tree/master/hw/bsp))

```
  $ newt target create mesh_test_boot
  $ newt target set mesh_test_boot app=@mcuboot/boot/mynewt bsp=@apache-mynewt-core/hw/bsp/nordic_pca10040 build_profile=optimized
  $ newt build mesh_test_boot
  $ newt load mesh_test_boot
```

4. Create a new target for the main application then build and flash it

```
  $ newt target create mesh_test_app
  $ newt target set mesh_test_app app=apps/blemesh_light_test bsp=@apache-mynewt-core/hw/bsp/nordic_pca10040 build_profile=optimized
  $ newt build mesh_test_app
  $ newt create-image mesh_test_app 0.0.1
  $ newt load mesh_test_app
```

Notes:
 In case of compile errors the blemesh_light_test [main.c](https://github.com/mtiutiu/Coding_Playground/blob/master/sensors_network/project/LivoloLightsNode/newt/apps/blemesh_light_test/src/main.c) file uses bsp specific macros (only two actually) that may need to be changed (or redefined) for your specific bsp:
 - LED_1
 - BUTTON_1

 The app will log messages using the bsp UART console if available. The logging level can be adjusted in `syscfg.yaml` by setting the `LOG_LEVEL` value (`1` means the most verbose).
Other ble mesh debug settings can be enabled if desired (set to `1` to enable):
```
BLE_MESH_DEBUG: 0
BLE_MESH_DEBUG_NET: 0
BLE_MESH_DEBUG_TRANS: 0
BLE_MESH_DEBUG_BEACON: 0
BLE_MESH_DEBUG_CRYPTO: 0
BLE_MESH_DEBUG_PROV: 0
BLE_MESH_DEBUG_ACCESS: 0
BLE_MESH_DEBUG_MODEL: 0
BLE_MESH_DEBUG_ADV: 0
BLE_MESH_DEBUG_LOW_POWER: 0
BLE_MESH_DEBUG_FRIEND: 0
BLE_MESH_DEBUG_PROXY: 0
```


See also:
[Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
