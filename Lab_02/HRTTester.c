/***********************************************************
 * File: main_02.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 2
 ***********************************************************/
#include <stdio.h>
#include <fcntl.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

static const char *cmdIoctl = "ioctl";
static const char *cmdRead = "read";

int main(int argc, char **argv)
{
	int fd1;
	int res;
	unsigned int buffer;

	/* open devices */	
	fd1 = open("/dev/HRTDriver", O_RDWR);


	if (fd1<0 )
	{
		printf("Can not open device file.\n");		
		return 0;
	}
	if (!strcmp(argv[1], cmdRead)) {
		res = read(fd1, (void *)buffer, 16);
		printf("Timer value: %u\n", res);
	}
	else if (!strcmp(argv[1], cmdIoctl)) {
		res = ioctl(fd1, 0xffc1, 32);	
	}
	else  printf("\nCommand not recognized!\n");
	
	/* close devices */
	close(fd1);

	
	return 0;
}
