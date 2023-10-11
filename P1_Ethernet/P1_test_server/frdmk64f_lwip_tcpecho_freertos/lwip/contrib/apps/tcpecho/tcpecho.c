/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */
#include "tcpecho.h"

#include "lwip/opt.h"

#if LWIP_NETCONN

#include "lwip/sys.h"
#include "lwip/api.h"
#include "fsl_pit.h"
#include "PIT.h"
#include "ADC.h"
#include "Bits.h"
#include "NVIC.h"
#include "GPIO.h"

#define SYSTEM_CLOCK CLOCK_GetFreq(kCLOCK_BusClk)

static uint16_t Data_test[40] = {0};
/*-----------------------------------------------------------------------------------*/
static void
tcpecho_thread(void *arg)
{
  struct netconn *conn, *newconn;
  err_t err;
  uint8_t pit_flag = FALSE, i = 0;
  uint16_t adc_value = 0;
  uint16_t Data[100] = {0};
  static counter = 0;
  struct netbuf *buf;
  void *data;
  u16_t len;
  LWIP_UNUSED_ARG(arg);



  /* Create a new connection identifier. */
  /* Bind connection to well known port number 7. */
#if LWIP_IPV6
  conn = netconn_new(NETCONN_TCP_IPV6);
  netconn_bind(conn, IP6_ADDR_ANY, 7);
#else /* LWIP_IPV6 */
  conn = netconn_new(NETCONN_TCP);
  netconn_bind(conn, IP_ADDR_ANY, 7);
#endif /* LWIP_IPV6 */
  LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);
  PRINTF("\n%s\n", "HOLA SOY EL SERVER" );
  /* Tell connection to go into listening mode. */

  PIT_StartTimer(DEMO_PIT_BASEADDR, kPIT_Chnl_0);
  netconn_listen(conn);
  err = netconn_accept(conn, &newconn);
  if (err == ERR_OK) {

  while (1) {

	pit_flag = PIT_get_irq_status(kPIT_Chnl_0);
	if(pit_flag)
	{
		GPIO_toogle_pin(GPIO_A, 1);
		adc_value = ADC0_read();
		PIT_clear_irq_status(kPIT_Chnl_0);

		/* Grab new connection. */

		  //Data[0]=adc_value;
		  Data_test[counter] = adc_value;
		  counter ++;
		  if(counter >= 40)
		  {
			 err=netconn_write(newconn, Data_test, 80, 0x01);

			 counter = 0;


		  }

		  /*Para calcular en ms usar 10/PortTicksPeriodMs
		  Calcular cuanto toma la tarea con freertos
		  */

	}
  }
  netconn_close(newconn);
  netconn_delete(newconn);
  }
}
/*-----------------------------------------------------------------------------------*/
void
tcpecho_init(void)
{
  sys_thread_new("tcpecho_thread", tcpecho_thread, NULL, 512, 1);
}
/*-----------------------------------------------------------------------------------*/

#endif /* LWIP_NETCONN */
