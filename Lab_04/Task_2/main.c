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
#include <math.h>

/*
 * Calculate Pi
 * This function will be called by a thread and its purpose is
 * to calculate an imprecise computation such as pi.
 * After one second the function will be forced to print the 
 * calculated value.
 * I will be using the Leibnix formula for pi which can be found
 * here: http://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80
 */
static void calculate_pi(int signo) {
	
}

int main(int argc, char **argv) {


	return 0;
}
