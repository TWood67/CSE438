*************************************************
*						*
*	Assignment 5 - Part 1			*
*	Taylor Wood				*
*	1202553801				*	
*						*
*************************************************

For part 1 of the assignment, I added two files.
serial.c and serialISR.c, both of which I found
in the RTOS source code online. I made a few 
modifications to both the files. First, I setup the 
NS 16550 driver object inside of 
vSerialPortInit() in serial.c.. The driver object is
created in ns16550.h, and also reference in serialISR.c
. printf.c was removed from
the project, and replaced with printk.c. This
source code was obtained from the kernel source
code. 

Both sampletasks.c and main.c were modified to no
longer user printf, but printk. They run the same
as the demo, but with printk.

In order to run application, navigate to
Task1/FreeRTOS2/Demo/OMAP3_BeagleBoard_GCC. In 
here you will find a file named rtosdemo.bin. 
Mount your sd card and drag this file onto the
boot partition, like in the demo. Boot the
SD card in the beagleboard and run the following
commands.
mmc rescan 0
fatload mmc 0 80300000 rtosdemo.bin
go 0x80300000
