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
#include "fsl_pit.h"
#include "PIT.h"

#if LWIP_NETCONN

#include "lwip/sys.h"
#include "lwip/api.h"
#include "DAC.h"

/*-----------------------------------------------------------------------------------*/
static void
tcpecho_thread(void *arg)
{
  struct netconn *conn, *newconn;
  err_t err;
  LWIP_UNUSED_ARG(arg);
  uint32_t outputval = 0;
  uint32_t * output_ptr = NULL;
  uint32_t * output_ptr2 = NULL;
  struct netbuf *buf;
  struct netbuf *buf2;
  void *data;
  void *data2;
  u16_t len;
  u16_t len2;
  uint32_t ctr = 0;
//snewe ashdbahsdghags
  /* Create a new connection identifier. */
  /* Bind connection to well known port number 7. */
#if LWIP_IPV6
  conn = netconn_new(NETCONN_TCP_IPV6);
  netconn_bind(conn, IP6_ADDR_ANY, 7);
#else /* LWIP_IPV6 */
  conn = netconn_new(NETCONN_TCP);
#endif /* LWIP_IPV6 */
  LWIP_ERROR("tcpecho: invalid conn", (conn != NULL), return;);
  /* Tell connection to go into listening mode. */
  ip4_addr_t ipaddrServer;
  IP4_ADDR(&ipaddrServer, 192,168,0,102);//ip del server
  uint8_t Data[]="hello SERVER\r";
  PRINTF("\n%s\n", "HOLA SOY EL CLIENT" );
  err = netconn_connect(conn, &ipaddrServer,7);
  if (err == ERR_OK) {
	  PIT_StartTimer(DEMO_PIT_BASEADDR, kPIT_Chnl_0);
  while(1){

			 netconn_recv(conn, &buf);
			// vTaskDelay(300);

			 do
			 {
				 netbuf_data(buf, &data, &len);
			 }
			 while (netbuf_next(buf) > 0);

			  //netbuf_data(buf, &data, &len);
			  outputval = (uint32_t) data;

			  netbuf_delete(buf);
			  //vTaskDelay(300);

			   outputval = (uint32_t) data;
			   output_ptr = outputval;


//			   netconn_recv(conn, &buf2);
//				// vTaskDelay(300);
//
//				 do
//				 {
//					 netbuf_data(buf2, &data2, &len2);
//				 }
//				 while (netbuf_next(buf2) > 0);
//
//				  //netbuf_data(buf, &data, &len);
//				  outputval = (uint16_t) data2;
//
//				  netbuf_delete(buf2);
//				  //vTaskDelay(300);
//
//				   outputval = (uint16_t) data2;
//				   output_ptr = outputval;


			   do
			   {
				   DacSend(*output_ptr);
				   DacSend((*output_ptr) >> 16);
				   output_ptr++;
				   ctr++;
			   }
			   while(ctr <= 40);

			   ctr = 0;
  }
  netconn_close(conn);
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
