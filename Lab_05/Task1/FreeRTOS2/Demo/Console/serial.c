/*
    FreeRTOS V7.1.0 - Copyright (C) 2011 Real Time Engineers Ltd.


 ***************************************************************************
 *                                                                       *
 *    FreeRTOS tutorial books are available in pdf and paperback.        *
 *    Complete, revised, and edited pdf reference manuals are also       *
 *    available.                                                         *
 *                                                                       *
 *    Purchasing FreeRTOS documentation will not only help you, by       *
 *    ensuring you get running as quickly as possible and with an        *
 *    in-depth knowledge of how to use FreeRTOS, it will also help       *
 *    the FreeRTOS project to continue with its mission of providing     *
 *    professional grade, cross platform, de facto standard solutions    *
 *    for microcontrollers - completely free of charge!                  *
 *                                                                       *
 *    >>> See http://www.FreeRTOS.org/Documentation for details. <<<     *
 *                                                                       *
 *    Thank you for using FreeRTOS, and thank you for your support!      *
 *                                                                       *
 ***************************************************************************


    This file is part of the FreeRTOS distribution.

    FreeRTOS is free software; you can redistribute it and/or modify it under
    the terms of the GNU General Public License (version 2) as published by the
    Free Software Foundation AND MODIFIED BY the FreeRTOS exception.
    >>>NOTE<<< The modification to the GPL is included to allow you to
    distribute a combined work that includes FreeRTOS without being obliged to
    provide the source code for proprietary components outside of the FreeRTOS
    kernel.  FreeRTOS is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details. You should have received a copy of the GNU General Public
    License and the FreeRTOS license exception along with FreeRTOS; if not it
    can be viewed here: http://www.freertos.org/a00114.html and also obtained
    by writing to Richard Barry, contact details for whom are available on the
    FreeRTOS WEB site.

    1 tab == 4 spaces!

    http://www.FreeRTOS.org - Documentation, latest information, license and
    contact details.

    http://www.SafeRTOS.com - A version that is certified for use in safety
    critical systems.

    http://www.OpenRTOS.com - Commercial support, development, porting,
    licensing and training services.
 */

/*
	BASIC INTERRUPT DRIVEN SERIAL PORT DRIVER FOR USART0.

	This file contains all the serial port components that can be compiled to
	either ARM or THUMB mode.  Components that must be compiled to ARM mode are
	contained in serialISR.c.
 */

/* Standard includes. */
#include <stdlib.h>

/* Scheduler includes. */
#include "FreeRTOS.h"
#include "queue.h"
#include "task.h"

/* Hardware includes. */
#include <bbconsole.h>
#ifdef CFG_PRINTK
#ifdef CFG_NS16550

#include <ns16550.h>

#define LCRVAL LCR_8N1					/* 8 data, 1 stop, no parity */
#define MCRVAL (MCR_DTR | MCR_RTS)			/* RTS/DTR */
#define FCRVAL (FCR_FIFO_EN | FCR_RXSR | FCR_TXSR)	/* Clear & enable FIFOs */

/* Constants to setup and access the UART. */
#define portUSART0_AIC_CHANNEL	( ( unsigned long ) 2 )

#define serINVALID_QUEUE		( ( xQueueHandle ) 0 )
#define serHANDLE				( ( xComPortHandle ) 1 )
#define serNO_BLOCK				( ( portTickType ) 0 )

/*-----------------------------------------------------------*/

/* Queues used to hold received characters, and characters waiting to be
transmitted. */
static xQueueHandle xRxedChars;
static xQueueHandle xCharsForTx;

/*-----------------------------------------------------------*/

/*
 * The queues are created in serialISR.c as they are used from the ISR.
 * Obtain references to the queues and THRE Empty flag.
 */
extern void vSerialISRCreateQueues(  unsigned portBASE_TYPE uxQueueLength, xQueueHandle *pxRxedChars, xQueueHandle *pxCharsForTx );

/*-----------------------------------------------------------*/

void vSerialPortInit()
{
	extern void ( vUART_ISR_Wrapper )( void );

	int baud_divisor = (CFG_NS16550_CLK / 16 / CONFIG_BAUDRATE);

	/* The queues are used in the serial ISR routine, so are created from
	serialISR.c (which is always compiled to ARM mode. */
	vSerialISRCreateQueues( configPRINTKBUFSIZE, &xRxedChars, &xCharsForTx );

	if(
			( xRxedChars != serINVALID_QUEUE ) &&
			( xCharsForTx != serINVALID_QUEUE )
	)
	{
		portENTER_CRITICAL();
		{

			xConsole->ier = 0x00;
#ifdef CONFIG_OMAP
			xConsole->mdr1 = 0x7;   /* mode select reset TL16C750*/
#endif
			xConsole->lcr = LCR_BKSE | LCRVAL;
			xConsole->dll = baud_divisor & 0xff;
			xConsole->dlm = (baud_divisor >> 8) & 0xff;
			xConsole->lcr = LCRVAL;
			xConsole->mcr = MCRVAL;
			xConsole->fcr = FCRVAL;
#if defined(CONFIG_OMAP)
			xConsole->mdr1 = 0;	/* select uart mode */
#endif

			//			/* Enable clock to USART0... */
			//			AT91C_BASE_PS->PS_PCER = AT91C_PS_US0;NS16550

			/* Disable all USART0 interrupt sources to begin... */

			/* Reset various status bits (just in case)... */

			//			AT91C_BASE_PIO->PIO_PDR = TXD0 | RXD0;  /* Enable RXD and TXD pins */
			//			AT91C_BASE_US0->US_CR = US_RSTRX | US_RSTTX | US_RXDIS | US_TXDIS;

			/* Clear Transmit and Receive Counters */
			//AT91C_BASE_US0->US_RCR = 0;
			//AT91C_BASE_US0->US_TCR = 0;

			/* Input clock to baud rate generator is MCK */
			//ulSpeed = configCPU_CLOCK_HZ * 10;
			//ulSpeed = ulSpeed / 16;
			//ulSpeed = ulSpeed / ulWantedBaud;

			/* compute the error */
			//ulCD  = ulSpeed / 10;
			//if ((ulSpeed - (ulCD * 10)) >= 5)
			//	ulCD++;

			/* Define the baud rate divisor register */
			//AT91C_BASE_US0->US_BRGR = ulCD;

			/* Define the USART mode */
			//AT91C_BASE_US0->US_MR = US_CLKS_MCK | US_CHRL_8 | US_PAR_NO | US_NBSTOP_1 | US_CHMODE_NORMAL;

			/* Write the Timeguard Register */
			//AT91C_BASE_US0->US_TTGR = 0;

			/* Setup the interrupt for USART0.

			Store interrupt handler function address in USART0 vector register... */
			//AT91C_BASE_AIC->AIC_SVR[ portUSART0_AIC_CHANNEL ] = (unsigned long)vUART_ISR_Wrapper;

			/* USART0 interrupt level-sensitive, priority 1... */
			//AT91C_BASE_AIC->AIC_SMR[ portUSART0_AIC_CHANNEL ] = AIC_SRCTYPE_INT_LEVEL_SENSITIVE | 1;

			/* Clear some pending USART0 interrupts (just in case)... */
			//AT91C_BASE_US0->US_CR = US_RSTSTA;

			/* Enable USART0 interrupt sources (but not Tx for now)... */
			//AT91C_BASE_US0->US_IER = US_RXRDY;

			/* Enable USART0 interrupts in the AIC... */
			//AT91C_BASE_AIC->AIC_IECR = ( 1 << portUSART0_AIC_CHANNEL );

			/* Enable receiver and transmitter... */
			//AT91C_BASE_US0->US_CR = US_RXEN | US_TXEN;
		}
		portEXIT_CRITICAL();
	}

}
/*-----------------------------------------------------------*/

signed long xSerialGetChar( signed char *pcRxedChar, long xBlockTime )
{
	/* Get the next character from the buffer.  Return false if no characters
	are available, or arrive before xBlockTime expires. */
	if( xQueueReceive( xRxedChars, pcRxedChar, (portTickType)xBlockTime ) )
	{
		return pdTRUE;
	}
	else
	{
		return pdFALSE;
	}
}
/*-----------------------------------------------------------*/

void vSerialPutString( const char * const pcString )
{
	signed char *pxNext;

	/* NOTE: This implementation does not handle the queue being full as no
	block time is used! */

	/* Send each character in the string, one at a time. */
	pxNext = ( signed char * ) pcString;
	while( *pxNext )
	{
		xSerialPutChar( *pxNext, serNO_BLOCK );
		pxNext++;
	}
}
/*-----------------------------------------------------------*/

signed long xSerialPutChar( signed char cOutChar, long xBlockTime )
{

	/* Place the character in the queue of characters to be transmitted. */
	if( xQueueSend( xCharsForTx, &cOutChar, (portTickType)xBlockTime ) != pdPASS )
	{
		return pdFAIL;
	}

	/* Turn on the Tx interrupt so the ISR will remove the character from the
	queue and send it.   This does not need to be in a critical section as
	if the interrupt has already removed the character the next interrupt
	will simply turn off the Tx interrupt again. */
	//AT91C_BASE_US0->US_IER = US_TXRDY;
	xConsole->ier = (xConsole->ier | IER_THR_IT);

	return pdPASS;
}
/*-----------------------------------------------------------*/

#endif
#endif
