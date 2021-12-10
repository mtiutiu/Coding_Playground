set(BOARD_ROOT ${CMAKE_CURRENT_LIST_DIR})

# Boilerplate code, which pulls in the Zephyr build system.
cmake_minimum_required(VERSION 3.20.0)
include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(mesh-lights)

# Add your source file to the "app" target. This must come after
# the boilerplate code, which defines the target.

target_sources(app PRIVATE
  ../src/main.c
	../src/mesh_logic.c
  ../src/ts_buttons_logic.c
  ../src/relays_logic.c
  ../src/leds_logic.c
)
