/***********************************************************
 * File: ReadMe.txt
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/

/***********************************************************
To compile the program feel free to run MakeScript.sh. This
script simply exports the path to the cross compile tool
chains. 

Note: You may need to change the KDIR in the makefile. 
Unlike the last project, my Kernel modules are in 
/kernel, rather than /kernel/kernel.
************************************************************/

/***********************************************************
Installation Instructions:
1. Insert the HRTDriver module into the kernel
	insmod HRTDriver.ko
2. Insert the Squeue module into the kernel
	insmod Squeue.ko
************************************************************/

/***********************************************************
To run the program:
1. Run the main binary file
	./main
************************************************************/

/***********************************************************
Uninstall Instructions:
1. Remove the Squeue driver from the kernel
	rmmod Squeue
2. Rmove the HRTDriver driver from the kernel
	rmmod HRTDriver
************************************************************/

/***********************************************************
Precautions:
I developed the kernel drivers on kernel version 3.0.29. I 
was able to test them on 3.6.7 and found the rare case that
a segmentation fault would occur when removing one of the
drivers. The driver will not be removed if this happens.
Restart the machine to fix the issue.
************************************************************/
