/***********************************************************
 * File: main_03.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 2
 ***********************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <pthread.h>

#define ADAPT_NUMB		2
#define PAGE_BYTES		64
#define NUM_READ_T		10
#define NUM_WRIT_T		10

//file
int fd1;

void *write_request(void *arg) {
	
	int id;
	char *buf = "Write thread number [%d]", (int *)arg);
	
	id = queue_write(fd1, buf, (int *)arg);

	do {
		ret = seek_token(id);
		switch (ret) {
			case -2 :
				printf(
				break;
			case -1 :
				//this is when the token is in the 
				//queue, but not at the head
				break;
			case 0:
				//token has been processed and ready 
				//for some action
				break;
		}

	} while (ret != 0);
	
}

void *read_request(void *arg) {
	
	int id;
	char *buf = "Read thread number [%d]", (int *)arg);

	id = queue_write(fd1, buf, 0);
	
	do {
		ret = seek_token(id);
		switch (ret) {
			case -2 :
				//this is when the token is added
				//to the head
			case -1 :
				//this is when the token is added
				//but not at the head position
			case 0:
				//token request has succeded and
				//is no longer in queue
		}
	} while (ret != 0);

}

int main(int argc, char **argv) {
	
	
	char inp[64];
	int pageRWS;
	int i;

	//thread
	pthread_t writers[NUM_READ_T];
	pthread_t readers[NUM_WRIT_T];

	fd1 = open("/dev/i2c_flash", O_RDWR);
	if (fd1 < 0) {
		printf("\n%s could not be opened, or was not found\n", filename);
		exit(1);
	}

	for (i = 0; i < NUM_WRIT_T; i++) {
		pthread_create(&writers[i], NULL, write_request, (void *) i);
	}

	for (i = 0; i < NUM_READ_T; i++) {
		pthread_create(&readers[i], NULL, read_request, (void *) i);
	}

	pthread_join(readers, NULL);
	pthread_join(writers, NULL);

	close(fd1);
	return 0;
}
