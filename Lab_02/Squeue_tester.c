/***********************************************************
 * File: Squeue_tester.c
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

static const char *cmdWrite = "write";
static const char *cmdRead = "read";
static const char *cmdIoctl = "ioctl";
static unsigned int *buffer;

int main(int argc, char **argv)
{
	int fd1;
	int res;
	
	/* open devices */	
	fd1 = open("/dev/Squeue2", O_RDWR);


	if (fd1<0 )
	{
		printf("Can not open device file.\n");		
		return 0;
	}
	if (!strcmp(argv[1], cmdRead)) {
		res = read(fd1, buffer, 0);
	}
	else if (!strcmp(argv[1], cmdWrite)) {
		write(fd1, atoi(argv[2]), 32);
	}
	else if (!strcmp(argv[1], cmdIoctl)) {
		ioctl(fd1, 0, 0);
	}
	
	
	/* close devices */
	close(fd1);

	
	return 0;
}
