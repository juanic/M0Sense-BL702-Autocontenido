/**
 * @file main.c
 * @brief
 *
 * Copyright (c) 2021 Bouffalolab team
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 */
#include "bflb_platform.h"
#include "hal_uart.h"

void systick_isr()
{
    static uint32_t tick = 0;
    tick++;
    MSG("tick:%d\r\n", tick);
}

int main(void)
{
    bflb_platform_init(0);
    bflb_platform_set_alarm_time(1000000, systick_isr);

    BL_CASE_SUCCESS;
    while (1) {
        bflb_platform_delay_ms(100);
    }
}
