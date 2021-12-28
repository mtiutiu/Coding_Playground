# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)
set(BOARD_ROOT ${CMAKE_CURRENT_LIST_DIR})

set(BOARD tt_nrf52)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(mesh_light_switch)

target_sources(app PRIVATE
  ../src/main.c
	../src/mesh_logic.c
  ../src/ts_buttons_logic.c
  ../src/relays_logic.c
  ../src/leds_logic.c
)

target_include_directories(app PRIVATE include)
