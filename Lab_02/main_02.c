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
#include <pthread.h>
#include <time.h>

struct token
{
	int id;				//token id
	unsigned int ts_write;		//time stamp before writing
	unsigned int ts_enqueued;	//enqueued time stamp
	unsigned int ts_dequeued;	//dequeued time stamp
	unsigned int ts_read;		//read time stamp
	char in_string[80];		//character string
	struct token *next;		//next in the list
};

#define TOKENS_TO_SEND		100
#define NUM_SENDER_THR		6
#define NUM_RECEIV_THR		1 

void* write_queues(void *);
void* read_queues(void *);
void rand_str(char *, size_t);

int fd1, fd2, fd3;

static const char *cmdIoctl = "ioctl";
static const char *cmdRead = "read";

int main(int argc, char **argv)
{
	int i;

	pthread_t writers[6];
	pthread_t readers;

	fd1 = open("/dev/Squeue1", O_RDWR);
	fd2 = open("/dev/Squeue2", O_RDWR);
	fd3 = open("/dev/HRTDriver", O_RDWR);

	if (fd1 < 0) {
		printf("Cannot open device");
		return -1;
	}
	if (fd2 < 0) {
		printf("Cannot open device");
		return -1;
	}
	if (fd3 < 0) {
		printf("Cannot open device");
		return -1;
	}

	for (i = 0; i < NUM_SENDER_THR; i++) {
		pthread_create(&writers[i], NULL, write_queues, (void *) i);
	}
	
	pthread_create(&readers, NULL, read_queues, (void *) i);

	pthread_join(readers, NULL);
	//pthread_join(writers[5], NULL);

	close(fd1);
	close(fd2);
	close(fd3);
	

	return 0;

}

void* read_queues(void *arg) {
	
	struct token *tok = (struct token*)malloc(sizeof(struct token));
	
	int count = 0;
	while (count < TOKENS_TO_SEND * NUM_SENDER_THR) {
		if (read(fd1, tok, sizeof(struct token)) == 0) {
			//read(td1, (void *)tok->ts_read, 32);
			printf("\nToken ID [%d]\nToken string \"%s\"\nWrite Time [%d]\nEnqueued Time [%d]\nDequeued Time [%d]\nRead Time [%d]\n", tok->id, tok->in_string, tok->ts_write, tok->ts_enqueued, tok->ts_dequeued, tok->ts_read);
			count++;
		}
		if (read(fd2, tok, sizeof(struct token)) == 0) {
			//read(td1, (void *)tok->ts_read, 16);
			printf("\nToken ID [%d]\nToken string \"%s\"\nWrite Time [%d]\nEnqueued Time [%d]\nDequeued Time [%d]\nRead Time [%d]\n", tok->id, tok->in_string, tok->ts_write, tok->ts_enqueued, tok->ts_dequeued, tok->ts_read);		
			count++;
		}
	srand(time(NULL));
	usleep((rand() % 10 + 1) * 1000);
	}
	
}

void* write_queues(void *arg) {

	struct token *tok = (struct token*)malloc(sizeof(struct token));

	int i;
	int res;
	unsigned int timer;
	unsigned int buffer;
	//char in_string[] = "All your base are belong to us.";

	for (i = 0; i < TOKENS_TO_SEND; i++) {
		if ((int)arg % 2 == 0) {
			//tok->ts_write = read(fd3, (void *)buffer, 16);;
			res = write(fd1, tok, sizeof(tok));
			//the write failed, decrement so it tries
			//again
			if (res == -1) i--;	
		}
		else {
			//tok->ts_write = read(fd3, (void *)buffer, 16);
			res = write(fd2, tok, sizeof(tok));
			if (res == -1) i--;
		}
		srand(time(NULL));
		usleep((rand() % 10 + 1) * 1000);
	}

}
