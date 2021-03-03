/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#ifndef H_BSP_H
#define H_BSP_H

#include <inttypes.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Define special stackos sections */
#define sec_data_core   __attribute__((section(".data.core")))
#define sec_bss_core    __attribute__((section(".bss.core")))
#define sec_bss_nz_core __attribute__((section(".bss.core.nz")))

/* More convenient section placement macros. */
#define bssnz_t         sec_bss_nz_core

extern uint8_t _ram_start;
#define RAM_SIZE        0x10000

#ifdef __cplusplus
}
#endif

#define LIGHT_CHANNELS 2
#define LIGHT_CHANNEL_1_INDEX 0
#define LIGHT_CHANNEL_2_INDEX 1

//#define V_SENSE_FEATURE
#define S1_LED_PIN 20
#define S2_LED_PIN 11
#define TS1_PIN 19
#define TS2_PIN 17
#ifdef VSENSE_FEATURE
#define VSENSE_PIN 22
#endif
#define RELAY1_SET_PIN 13
#define RELAY1_RESET_PIN 12
#define RELAY2_SET_PIN 15
#define RELAY2_RESET_PIN 14

#endif  /* H_BSP_H */
