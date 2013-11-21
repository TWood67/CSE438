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
#include <math.h>	//pow
#include <pthread.h>	//pthreads
#include <unistd.h>	//usleep

int bCalcPi = 1;	//global to determine pi calc iterations

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

	printf("\nAfter one second Pi was calculated to be [%f]\n", 4 * val);

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

	//create thread object
	pthread_t pi_calc;

	//Set the signal handler
	if (signal(SIGINT, signal_handler) == SIG_ERR) {
		printf("\nSomething happened while setting a signal handler.\n");
		return -1;
	}
	
	printf("\nCalculating Pi for one second.\n");
	pthread_create(&pi_calc, NULL, calculate_pi, 0);

	//sleep for one second
	usleep(1000000);

	//raise the signal
	printf("\nRaising the interactive attention singal.\n");
	if (raise(SIGINT) != 0) {
		printf("\nError raising the signal.\n");
		return -1;
	}

	pthread_join(pi_calc, NULL);
	
	return 0;
}
