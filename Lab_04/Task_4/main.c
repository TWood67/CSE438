/***********************************************************
 * File: main.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 4 - 2
 ***********************************************************/

#include <signal.h>	//for signals
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>	//pow
#include <pthread.h>	//pthreads
#include <unistd.h>	//usleep
#include <linux/input.h>

static pthread_t th;

void *thread(void *arg) {

	sigset_t mask;
	int sig;
	
	pthread_sigmask(SIG_BLOCK, &mask, NULL);
	sigemptyset(&mask);
	sigaddset(&mask, SIGUSR1);
	printf("\nWaiting for signal in thread\n");
	sigwait(&mask, &sig);
	printf("\nDone waiting for signal in thread\n");
}

static void handler(int sig) {
	
	if (!pthread_equal(pthread_self(), th)) {
		pthread_kill(th, SIGUSR1);
	}

	printf("\nSignal raised!\n");
}

int main(int argc, char *argv[]) {

	struct sigaction sa;
	sa.sa_flags = SA_RESTART;
	sa.sa_handler = handler;
	sigemptyset(&sa.sa_mask);
	sigaction(SIGUSR1, &sa, NULL);
	if (pthread_create(&th, NULL, &thread, NULL) != 0) 
		printf("\nThread not created\n");

	//sleep for 1 second to allow the thread to setup
	usleep(1000000);

	raise(SIGUSR1);

	//sleep for 1 second to allow the thread to finish
	usleep(1000000);

	return 0;
}
