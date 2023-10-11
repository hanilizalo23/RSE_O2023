/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2021 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_debug_console.h"
#include "fsl_flexcan.h"
#include "clock_config.h"
#include "board.h"
#include "fsl_pit.h"

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define EXAMPLE_CAN            CAN0
#define EXAMPLE_CAN_CLK_SOURCE (kFLEXCAN_ClkSrc1)
#define EXAMPLE_CAN_CLK_FREQ   CLOCK_GetFreq(kCLOCK_BusClk)
/* Set USE_IMPROVED_TIMING_CONFIG macro to use api to calculates the improved CAN / CAN FD timing values. */
#define USE_IMPROVED_TIMING_CONFIG (1U)
#define EXAMPLE_FLEXCAN_IRQn       CAN0_ORed_Message_buffer_IRQn
#define EXAMPLE_FLEXCAN_IRQHandler CAN0_ORed_Message_buffer_IRQHandler
#define RX_MESSAGE_BUFFER_NUM      (9)
#define TX_MESSAGE_BUFFER_NUM      (8)
#define DLC                        (8)

/* Fix MISRA_C-2012 Rule 17.7. */
#define LOG_INFO (void)PRINTF

/* The period of the example software timer, specified in milliseconds, and
converted to ticks using the portTICK_PERIOD_MS constant. */
#define mainSOFTWARE_TIMER_PERIOD_MS (7000 / portTICK_PERIOD_MS)
/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile bool rxComplete = false;
#if (defined(USE_CANFD) && USE_CANFD)
flexcan_fd_frame_t txFrame, rxFrame;
#else
flexcan_frame_t txFrame, rxFrame;
#endif

/*******************************************************************************
 * Code
 ******************************************************************************/
uint8_t g_counter = 0;

flexcan_config_t flexcanConfig;
flexcan_rx_mb_config_t mbConfig;
uint32_t flag = 1U;

TimerHandle_t xSoftwareTimer = NULL;
TaskHandle_t xHardwareInitTask;

void EXAMPLE_FLEXCAN_IRQHandler(void)
{
#if (defined(FSL_FEATURE_FLEXCAN_HAS_EXTENDED_FLAG_REGISTER)) && (FSL_FEATURE_FLEXCAN_HAS_EXTENDED_FLAG_REGISTER > 0)
    uint64_t flag = 1U;
#else
    uint32_t flag = 1U;
#endif
    /* If new data arrived. */
    if (0U != FLEXCAN_GetMbStatusFlags(EXAMPLE_CAN, flag << RX_MESSAGE_BUFFER_NUM))
    {
        FLEXCAN_ClearMbStatusFlags(EXAMPLE_CAN, flag << RX_MESSAGE_BUFFER_NUM);
#if (defined(USE_CANFD) && USE_CANFD)
        (void)FLEXCAN_ReadFDRxMb(EXAMPLE_CAN, RX_MESSAGE_BUFFER_NUM, &rxFrame);
#else
        (void)FLEXCAN_ReadRxMb(EXAMPLE_CAN, RX_MESSAGE_BUFFER_NUM, &rxFrame);
#endif
        rxComplete = true;
    }
    SDK_ISR_EXIT_BARRIER;
}

void HardwareInit(void *pvParameters)
{
    /* Initialize board hardware. */
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();

    LOG_INFO("\r\n==FlexCAN loopback functional example -- Start.==\r\n\r\n");

    FLEXCAN_GetDefaultConfig(&flexcanConfig);

    flexcanConfig.clkSrc = EXAMPLE_CAN_CLK_SOURCE;

    flexcanConfig.enableLoopBack = false;

    flexcan_timing_config_t timing_config;
    memset(&timing_config, 0, sizeof(flexcan_timing_config_t));

    if (FLEXCAN_CalculateImprovedTimingValues(EXAMPLE_CAN, flexcanConfig.baudRate, EXAMPLE_CAN_CLK_FREQ,
                                              &timing_config))
    {
        /* Update the improved timing configuration*/
        memcpy(&(flexcanConfig.timingConfig), &timing_config, sizeof(flexcan_timing_config_t));
    }
    else
    {
        LOG_INFO("No found Improved Timing Configuration. Just used default configuration\r\n\r\n");
    }

    FLEXCAN_Init(EXAMPLE_CAN, &flexcanConfig, EXAMPLE_CAN_CLK_FREQ);

    /* Setup Rx Message Buffer. */
    mbConfig.format = kFLEXCAN_FrameFormatStandard;
    mbConfig.type   = kFLEXCAN_FrameTypeData;
    mbConfig.id     = FLEXCAN_ID_STD(0x123);

    FLEXCAN_SetRxMbConfig(EXAMPLE_CAN, RX_MESSAGE_BUFFER_NUM, &mbConfig, true);

    /* Setup Tx Message Buffer. */
    FLEXCAN_SetTxMbConfig(EXAMPLE_CAN, TX_MESSAGE_BUFFER_NUM, true);

    /* Enable Rx Message Buffer interrupt. */
    FLEXCAN_EnableMbInterrupts(EXAMPLE_CAN, flag << RX_MESSAGE_BUFFER_NUM);
    (void)EnableIRQ(EXAMPLE_FLEXCAN_IRQn);

	vTaskSuspend(xHardwareInitTask);

}

void CAN_task()
{
    /* Prepare Tx Frame for sending. */
    txFrame.format = (uint8_t)kFLEXCAN_FrameFormatStandard;
    txFrame.type   = (uint8_t)kFLEXCAN_FrameTypeData;
    txFrame.id     = FLEXCAN_ID_STD(0x123);
    txFrame.length = (uint8_t)DLC;

    txFrame.dataWord0 = CAN_WORD0_DATA_BYTE_0(0x11) | CAN_WORD0_DATA_BYTE_1(0x11) | CAN_WORD0_DATA_BYTE_2(0x11) |
                        CAN_WORD0_DATA_BYTE_3(0x11);
    txFrame.dataWord1 = CAN_WORD1_DATA_BYTE_4(0x11) | CAN_WORD1_DATA_BYTE_5(0x11) | CAN_WORD1_DATA_BYTE_6(0x11) |
                        CAN_WORD1_DATA_BYTE_7(0x11);

    while (!rxComplete)
    {
    }

    LOG_INFO("\r\nReceived message from MB%d\r\n", RX_MESSAGE_BUFFER_NUM);

    LOG_INFO("rx word0 = 0x%x\r\n", rxFrame.dataWord0);
    LOG_INFO("rx word1 = 0x%x\r\n", rxFrame.dataWord1);

    while (true)
    {
    }
}

static void vTimerCallback(TimerHandle_t xTimer)
{

		    txFrame.dataWord0 = CAN_WORD0_DATA_BYTE_0(0x00) | CAN_WORD0_DATA_BYTE_1(0x72) | CAN_WORD0_DATA_BYTE_2(0x78) |
		                        CAN_WORD0_DATA_BYTE_3(0x24);
		    txFrame.dataWord1 = CAN_WORD1_DATA_BYTE_4(0x00) | CAN_WORD1_DATA_BYTE_5(0x72) | CAN_WORD1_DATA_BYTE_6(0x66) |
		                        CAN_WORD1_DATA_BYTE_7(0x73);
		    LOG_INFO("Send message from HOST\r\n");
		    LOG_INFO("tx expediente 1 = 0x%x\r\n", txFrame.dataWord0);
		    LOG_INFO("tx expediente 2 = 0x%x\r\n", txFrame.dataWord1);

		    (void)FLEXCAN_TransferSendBlocking(EXAMPLE_CAN, TX_MESSAGE_BUFFER_NUM, &txFrame);

}

int main(void)
{
    /* Create the queue send task in exactly the same way.  Again, this is
    described in the comments at the top of the file. */
    if (xTaskCreate(HardwareInit, "Init", configMINIMAL_STACK_SIZE + 166, NULL, 2, &xHardwareInitTask) != pdPASS)
    {
        PRINTF("Task creation failed!.\r\n");
        while (1)
            ;
    }

    if (xTaskCreate(CAN_task, "CAN_task", configMINIMAL_STACK_SIZE + 166, NULL, 1, NULL) != pdPASS)
    {
        PRINTF("Task creation failed!.\r\n");
        while (1)
            ;
    }

    /* Create the software timer as described in the comments at the top of
    this file. */
    xSoftwareTimer = xTimerCreate(/* A text name, purely to help
                                       debugging. */
                                         "SendMessageTimer",
                                         /* The timer period in ms. */
                                         mainSOFTWARE_TIMER_PERIOD_MS,
                                         /* This is a periodic timer, so
                                         xAutoReload is set to pdTRUE. */
                                         pdTRUE,
                                         /* The ID is not used, so can be set
                                         to anything. */
                                         (void *)0,
                                         /* The callback function that switches
                                         the LED off. */
										 vTimerCallback);

    /* Start the created timer.  A block time of zero is used as the timer
    command queue cannot possibly be full here (this is the first timer to
    be created, and it is not yet running). */
    xTimerStart(xSoftwareTimer, 0);

    /* Start the tasks and timer running. */
    vTaskStartScheduler();

    /* If all is well, the scheduler will now be running, and the following line
    will never be reached.  If the following line does execute, then there was
    insufficient FreeRTOS heap memory available for the idle and/or timer tasks
    to be created.  See the memory management section on the FreeRTOS web site
    for more details.  */
    for (;;)
        ;
}
