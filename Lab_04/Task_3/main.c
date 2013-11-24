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

int bCalcPi = 1;	//global to determine pi calc iterations

#define MOUSEFILE	"/dev/input/event1"

/*
 * Calculate Pi
 * This function will be called by a thread and its purpose is
 * to calculate an imprecise computation such as pi.
 * After one second the function will be forced to print the 
 * calculated value.
 * I will be using the Leibniz formula for pi which can be found
 * here: http://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80
 */
void* calculate_pi(void *arg) {
	
	int i = 0;
	double val = 0.0;

	do {
	
		val += (pow(-1, i) / ((2 * i) + 1));
		i++;

	} while (bCalcPi);

	printf("\nPi was calculated to be [%f]\n", 4 * val);

}

/*
 * Signal Handler
 * Since calculate_pi continually checks the boolean bCalcPi, the
 * signal handlers only purpose is to set this value false. Doing
 * so will stop further calculations of Pi and will print the 
 * value to user space.
 */
static void signal_handler(int signo) {
	
	bCalcPi = 0;

}

int main(int argc, char **argv) {

	int fd;
	struct input_event ie;
	pthread_t pi_calc;
	struct timeval tv_last = {0, 0};
	int time_out = 500000;
	int time_diff = 0;

	if (signal(SIGINT, signal_handler) == SIG_ERR) {
		printf("\nSomething happened while setting a signal handler.\n");
		return -1;
	}

	pthread_create(&pi_calc, NULL, calculate_pi, 0);

	if ((fd = open(MOUSEFILE, O_RDONLY)) == -1) {
		perror("\nopening device\n");
		exit(EXIT_FAILURE);
	}

	while (read(fd, &ie, sizeof(struct input_event)) && bCalcPi) {
	
		if (ie.type == EV_KEY && ie.code == BTN_RIGHT && ie.value == 1) {
			time_diff = ie.time.tv_sec - tv_last.tv_sec;
			if (time_diff >= 0 && time_diff < 1) {
				time_diff *= 1000000;
				time_diff += ie.time.tv_usec;
				time_diff -= tv_last.tv_usec;
			}
			else time_diff = time_out + 1;

			if (time_diff <= time_out) {
				
				if (raise(SIGINT) != 0) {
					printf("\nError raising the signal.\n");
				}
			}

			tv_last.tv_sec = ie.time.tv_sec;
			tv_last.tv_usec = ie.time.tv_usec;
		}
	}

	usleep(1000);
	close(fd);

	return 0;
}
