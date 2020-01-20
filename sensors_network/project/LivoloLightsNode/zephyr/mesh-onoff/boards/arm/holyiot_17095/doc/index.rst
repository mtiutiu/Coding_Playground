.. _holyiot_17095:

Holyiot 17095
################

Overview
********

The `Holyiot`_ 17095 hardware provides support for the Nordic
Semiconductor nRF52832 ARM Cortex-M4 CPU and the following devices:

* CLOCK
* FLASH
* :abbr:`GPIO (General Purpose Input Output)`
* :abbr:`MPU (Memory Protection Unit)`
* :abbr:`NVIC (Nested Vectored Interrupt Controller)`
* :abbr:`PWM (Pulse Width Modulation)`
* RADIO (Bluetooth Low Energy)
* :abbr:`RTC (nRF RTC System Clock)`
* :abbr:`WDT (Watchdog Timer)`

.. figure:: img/holyiot_17095_front.jpg
     :width: 375px
     :align: center
     :alt: Holyiot 17095

     Holyiot 17095 (Credit: Holyiot)


Hardware
********

The nRF52832 of the Holyiot 17095 is clocked by an external crystal
with a frequency of 32.768 kHz.

Supported Features
==================

The holyiot_17095 board configuration supports the following
hardware features:

+-----------+------------+----------------------+
| Interface | Controller | Driver/Component     |
+===========+============+======================+
| CLOCK     | on-chip    | clock_control        |
+-----------+------------+----------------------+
| FLASH     | on-chip    | flash                |
+-----------+------------+----------------------+
| GPIO      | on-chip    | gpio                 |
+-----------+------------+----------------------+
| MPU       | on-chip    | arch/arm             |
+-----------+------------+----------------------+
| NVIC      | on-chip    | arch/arm             |
+-----------+------------+----------------------+
| PWM       | on-chip    | pwm                  |
+-----------+------------+----------------------+
| RADIO     | on-chip    | Bluetooth            |
+-----------+------------+----------------------+
| RTC       | on-chip    | system clock         |
+-----------+------------+----------------------+
| WDT       | on-chip    | watchdog             |
+-----------+------------+----------------------+

Other hardware features are not supported by the Zephyr kernel.

Connections and IOs
===================


Programming and Debugging
*************************

Applications for the ``holyiot_17095`` board configuration can be
built and flashed in the usual way (see :ref:`build_an_application`
and :ref:`application_run` for more details); however, an external
DAP-Link is required since the board does not have any on-board
debug IC.

The following pins of the DAP-Link must be connected to the following
pads on the PCB (see image):

* VTref = VCC
* GND = GND
* SWDIO = SWDIO
* SWCLK = SCK

.. figure:: img/holyiot_17095_pcb.jpg
     :width: 390px
     :align: center
     :alt: Holyiot 17095 PCB

     Holyiot 17095 PCB (Credit: Holyiot)

Flashing
========

Use: pyocd flash --target nrf52 <path to hex file>

Erasing
=========

Use: pyocd erase --target nrf52 --mass-erase


References
**********

.. target-notes::

.. _Holyiot: http://www.holyiot.com
.. _Nordic Semiconductor Documentation library: https://www.nordicsemi.com/DocLib
