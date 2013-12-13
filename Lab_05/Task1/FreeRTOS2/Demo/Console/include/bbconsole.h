/*
 * (C) Copyright 2004
 * Texas Instruments
 *
 * (C) Copyright 2000-2004
 * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#ifndef __BBCONSOLE_H_
#define __BBCONSOLE_H_			1

#define CFG_PRINTK

#define DM3730_L4_PERIPHERAL	0x49000000
#define OMAP34XX_UART3			(DM3730_L4_PERIPHERAL+0x20000)

#ifdef CFG_PRINTK

#define KERN_SOH        "\001"          /* ASCII Start Of Header */
#define KERN_SOH_ASCII  '\001'

#define KERN_EMERG      KERN_SOH ""     /* system is unusable */
#define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
#define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
#define KERN_ERR        KERN_SOH "3"    /* error conditions */
#define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
#define KERN_NOTICE     KERN_SOH "5"    /* normal but significant condition */
#define KERN_INFO       KERN_SOH "6"    /* informational */
#define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */

#define CFG_NS16550
#define CFG_NS16550_SERIAL
#define CFG_NS16550_REG_SIZE	-4
#define CFG_NS16550_CLK			48000000
#define CFG_NS16550_COM3		OMAP34XX_UART3

#define CONFIG_SERIAL1			3	/* use UART3 */
#define CONFIG_CONS_INDEX		3

#define CONFIG_BAUDRATE			115200
#define CFG_PBSIZE				256

#define printk(fmt,args...)	serial_printk (fmt ,##args)

#define PRINTKKERNLOG			'7'
#define PRINTKBUFSIZE			1000

void vSerialPortInit( void );
void vSerialPutString( const char * const pcString );
signed long xSerialGetChar( signed char *pcRxedChar, long xBlockTime );
signed long xSerialPutChar( signed char cOutChar, long xBlockTime );

void serial_printf (const char *fmt, ...);
void serial_printk (const char *fmt, ...);

void memdump_32(void *mem, int size);

#else /* CFG_PRINTF */

#define printk(fmt,args...)
//#define getc() ' '

#endif	/* CFG_PRINTF */

#endif	/* __BBCONSOLE_H_ */
