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

#define ADAPT_NUMB		2
#define PAGE_BYTES		64

/* Prints a buffer with unprintable characters */
void printBuf(char *buf, int count, int lineLength) {

        int curChar;

        for (curChar = 0; curChar < count; curChar++) {

                if (curChar % lineLength == 0) printf("\n");
                printf("%c", isprint(buf[curChar]) ? buf[curChar] : '.');

        }

        printf("\n\n");

}

int main(int argc, char **argv) {
	
	//file
	int fd1;
	int uInput;
	char *buf;
	char inp[64];
	int pageRWS;
	char filename[20];

	//snprintf(filename, 19, "/dev/i2c-%d", ADAPT_NUMB); 

	fd1 = open("/dev/i2c_flash", O_RDWR);
	if (fd1 < 0) {
		printf("\n%s could not be opened, or was not found\n", filename);
		exit(1);
	}

	//do some reading or writing
	do {
		printf("\n1.Read\n2.Write\n3.Set\n4.Quit\n");
		fgets(inp, sizeof(inp), stdin);
		sscanf(inp, "%d", &uInput);

		switch(uInput) {
			case 1 	:
				printf("\nRead Statement\n");
				printf("\nHow many pages to read?\n");
				fgets(inp, sizeof(inp), stdin);
				sscanf(inp, "%d", &pageRWS);
				buf = malloc(sizeof(char) * 64 * pageRWS);
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				if(!read(fd1, buf, pageRWS)) printf("\nSomething happened when reading!\n");
				printBuf(buf, PAGE_BYTES * pageRWS, PAGE_BYTES);
				free(buf);
				break;
			case 2	:
				printf("\nWrite Statement\n");
				printf("\nHow many pages to write?\n");
				fgets(inp, sizeof(inp), stdin);
				sscanf(inp, "%d", &pageRWS);
				buf = malloc((sizeof(char) * 64 * pageRWS));
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				fgets(buf, sizeof(char) * PAGE_BYTES * pageRWS, stdin);
				if(!write(fd1, buf, pageRWS)) printf("\nSomething happened when writing!\n");
				free(buf);
				break;
			case 3	:
				printf("\nSet Statement\n");
				printf("\nNew device offset?\n");
				fgets(inp, sizeof(inp), stdin);
				sscanf(inp, "%d", &pageRWS);
				if(!lseek(fd1, pageRWS, 0)) printf("\nSomething happened when setting!\n");
				break;
			case 4 	:
				printf("\nQuit\n");
				break;
			default:
				printf("\nUnknown Command\n");
				break;
		}
	} while (uInput != 4);
	close(fd1);
	return 0;
}
