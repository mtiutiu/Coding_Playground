# Boilerplate code, which pulls in the Zephyr build system.
cmake_minimum_required(VERSION 3.13.1)

if(BOARD STREQUAL holyiot_yj16019)
  set(CONF_FILE holyiot_yj16019_prj.conf;ble_mesh_prj.conf)
endif()

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(mesh-onoff)

target_sources(app PRIVATE
  ../src/main.c
  ../src/mesh_logic.c
  ../src/ts_buttons_logic.c
  ../src/relays_logic.c
  ../src/leds_logic.c
)
