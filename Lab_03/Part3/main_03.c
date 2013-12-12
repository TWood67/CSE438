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
#include <errno.h>

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
	int ret;

	//snprintf(filename, 19, "/dev/i2c-%d", ADAPT_NUMB); 

	fd1 = open("/dev/i2c_flash", O_RDWR);
	if (fd1 < 0) {
		printf("\n%s could not be opened, or was not found\n", filename);
		exit(1);
	}

	//do some reading or writing
	do {
		printf("\n1.Read\n2.Write\n3.Set\n4.Quit\n");
		scanf("%d", &uInput);
		//fgets(inp, sizeof(inp), stdin);
		//sscanf(inp, "%d", &uInput);

		switch(uInput) {
			case 1 	:
				printf("\nRead Statement\n");
				printf("\nHow many pages to read?\n");
				scanf("%d", &pageRWS);
				//fgets(inp, sizeof(inp), stdin);
				//sscanf(inp, "%d", &pageRWS);
				buf = malloc(sizeof(char) * 64 * pageRWS);
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				do {
					ret = read(fd1,buf, pageRWS);
					printf("\nRet [%d]\n", ret);
					if (errno == 2) {
						printf("\n Errno [%d]\n", errno);
						ret = -errno;
					}
					switch (ret) {
						case -2 :
							printf("\nRequest stored in token!\n");
							break;
						case -1 :
							printf("\nEEPROM is busy!\n");
							break;
						case 0 :
							//do nothing, buffer has been read
							break;
					}
				usleep(1000);
				} while (ret < 0);
				printf("\nPrinting buffer\n");
				printBuf(buf, PAGE_BYTES * pageRWS, PAGE_BYTES);
				printf("\nDone printing buffer. Freeing memory\n");
				free(buf);
				printf("\nDone freeing memory\n");
				break;
			case 2	:
				printf("\nWrite Statement\n");
				printf("\nHow many pages to write?\n");
				scanf("%d", &pageRWS);
				//fgets(inp, sizeof(inp), stdin);
				//sscanf(inp, "%d", &pageRWS);
				buf = malloc((sizeof(char) * 64 * pageRWS));
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				scanf("%s", buf);
				//fgets(buf, sizeof(char) * PAGE_BYTES * pageRWS, stdin);
				do {
					ret = write(fd1, buf, pageRWS);
					printf("\nBack in user space\n");
					if (errno == 2) {
						printf("\n Errno [%d]\n", errno);
						ret = -errno;
					}
					switch (ret) {
						case -2 :
							printf("\nRequest stored in token!\n");
							break;
						case -1 :
							printf("\nEEPROM is busy!\n");
							break;
						case 0 :
							printf("\nDone writing!\n");
							//do nothing, buffer has been read
							break;
					}
				//usleep(3000);
				} while (ret < 0);
				free(buf);
				break;
			case 3	:
				printf("\nSet Statement\n");
				printf("\nNew device offset?\n");
				scanf("%d", &pageRWS);
				//fgets(inp, sizeof(inp), stdin);
				//sscanf(inp, "%d", &pageRWS);
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
