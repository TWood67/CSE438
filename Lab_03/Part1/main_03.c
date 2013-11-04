/***********************************************************
 * File: main_03.c
 * Created By: Taylor Wood
 * ASU ID: 1202553801
 * Class: CSE 438
 * Assignment: 3 - 1
 ***********************************************************/

#include <linux/i2c-dev.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define SLAVE_ADDR		0x52
#define ADAPT_NUMB		2
#define PAGE_BYTES		64
#define NUM_OF_PAG		512

//prototypes
int read_EEPROM(void *, int);
int write_EEPROM(const void *, int);
int seek_EEPROM(int);
void inc_offset(int);

int fd;			// file device
int currPage = 0x0000;	// global page offsetl

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

	char filename[20];	// device to open
	int uInput;		// user input
	int pageRWS;		// num of pages to read, write
	char inp[64];		// input from user
	char *buf;
	// or set
	
	//create the file name according to adapter num
	snprintf(filename, 19, "/dev/i2c-%d", ADAPT_NUMB); 
	
	//first we open the device and verify that it was
	//opened correctly
	fd = open(filename, O_RDWR);
	if (fd < 0) {
		printf("\n%s could not be opened, or was not found\n", filename);
		exit(1);
	}
	
	//set slave address, check for errors
	if (ioctl(fd, I2C_SLAVE, SLAVE_ADDR) < 0) {
		printf("\n%d address not found.\n");
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
				buf = malloc(sizeof(char) * PAGE_BYTES * pageRWS);
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				read_EEPROM(buf, pageRWS);
				printBuf(buf, PAGE_BYTES * pageRWS, PAGE_BYTES);
				free(buf);
				break;
			case 2	:
				printf("\nWrite Statement\n");
				printf("\nHow many pages to write?\n");
				fgets(inp, sizeof(inp), stdin);
				sscanf(inp, "%d", &pageRWS);
				buf = malloc((sizeof(char) * PAGE_BYTES * pageRWS));
				memset(buf, 0, sizeof(char) * 64 * pageRWS);
				printf("\nData to write:\n");
				fgets(buf, sizeof(char) * PAGE_BYTES * pageRWS, stdin);
				write_EEPROM(buf, pageRWS);
				free(buf);
				break;
			case 3	:
				printf("\nSet Statement\n");
				printf("\nNew device offset?\n");
				fgets(inp, sizeof(inp), stdin);
				sscanf(inp, "%d", &pageRWS);
				seek_EEPROM(pageRWS);
				break;
			case 4 	:
				printf("\nQuit\n");	
				break;
			default:
				printf("\nUnknown Command\n");
				break;
		}
	} while (uInput != 4);

	close(fd);
	return 0;
}

/* FUNCTION:	int write_EEPROM(const void *buf, int count)
 * DESCRIPTION:	Writes a sequence of count pages to an EEPROM 
 * 		device starting from the current page position
 *		of the EEPROM. The page position is then
 * 		advanced by count and, if reaching the end,
 *		of pages, wrapped around to the beginning of
 *		the EEPROM.
 * RETURN:	0 if succeed
 *		-1 if failure
 * PROTOCOL: 	Address High|Address Low|Data 0|Data etc
 *		    8	         7	   8	   8
 */
int write_EEPROM(const void *buf, int count) {

	//allocate memory for buffer
	char *tBuf = malloc(PAGE_BYTES + 2);
	int i = 0;	//loop count
	int address;
	int res;
	int buffPtr = 2;

	//first check and make sure the number of pages
	//to write it valid
	if (count < 0 || count > NUM_OF_PAG) return -1;	//error
	
	i = 0;
	
	for (i; i < count; i++) {

		memcpy(tBuf + 2, (char *)(buf + (i * PAGE_BYTES)), PAGE_BYTES);

		//which page to write to. Increment the 
		//page offset as well
		//Address Low
		address = (currPage & 0x00ff);
		//memcpy((char *)tBuf + 1, &address, 1);
		memcpy(tBuf + 1, &address, 1);

		//Address high
		address = (currPage & 0xff00) >> 8;
		//memcpy((char *)tBuf, &address, 1);
		memcpy(tBuf, &address, 1);

		inc_offset((currPage / PAGE_BYTES) + 1);
		
		//attempt to write everything
		res = write(fd, tBuf, PAGE_BYTES + 2);
		if(res < 0) {
			//failure
			printf("\nSomething happened when writing!\n");
			return -1;
		}
	//my program is too awesome and fast that
	//it needs to sleep
	usleep(5000);

	}

	free(tBuf);

	return 0;	//SUCCESS!!
}

/* FUNCTION:	int read_EEPROM(void *buf, int count)
 * DESCRIPTION:	Reads a sequence of count pages from the EEPROM
 * 		device into user memory pointed by buf. The 
 *		pages to be read start from the current page
 *		poisition of the EEPROM. The page position is
 *		then advanced by count and, if reaching the end
 *		of pages, wrapped around to the beginning of 
 *		the EEPROM. 
 * RETURN:	0 is succeed
 *		-1 if failure
 */
int read_EEPROM(void *buf, int count) {
	
	//allocate some memory for the read
	//PAGE_BYTES -1 since char is of size 1
	//and we don't care about the page
	//offset. That is within the device
	char *tBuf = malloc(PAGE_BYTES);
	int buffPtr = 0;
	int address;
	int i = 0; //control for the for loop
	int res;

	//loop through the number of pages that need to
	//be read
	for (i; i < count; i++) {

		seek_EEPROM(currPage / PAGE_BYTES);

		//read from the 
		//TODO This doesn't return correctly when there are
		//spaces. Due to printf
		res = read(fd, buf + (i * PAGE_BYTES), PAGE_BYTES);
		if (res < 0) {
	
		printf("\nReading from the page failed!\n");
			return -1;
		}
		
		

		inc_offset((currPage / PAGE_BYTES) + 1);
		/*
		if (read(fd, tbuf, PAGE_BYTES) != PAGE_BYTES) {
			printf("\nI2C Read Failed!\n");
			return -1;			
		}
		*/
	}

	return 0;	//SUCCESS!!
}

/* FUNCTION:	int seek_EEPROM(int offset)
 * DESCRIPTION:	Set the current page position in the EEPROM
 *		to offset which is the page number in the
 *		range of 0 to 2k-1.
 * RETURN:	0 if offset is in the address range of 
 *		the EEPROM
 *		-1 otherwise
 */
int seek_EEPROM(int offset) {
	
	char *asBuf = malloc(2);
	int address;
	int res;

	currPage = offset * PAGE_BYTES;
	//increment the current page
	if (currPage < 0 || currPage > NUM_OF_PAG * PAGE_BYTES)
		currPage = 0x0000;

	//Addres Low
	address = (currPage & 0x00ff);
	memcpy((char *)asBuf + 1, &address, 1);

	//Address high
	address = (currPage & 0xff00) >> 8;
	memcpy((char *)asBuf, &address, 1);

	res = write(fd, asBuf, 2);
	if (res < 0) {
		printf("\nWriting the address failed!\n");
		return -1;
	}

	free(asBuf);
}

void inc_offset(int offset) {
	
	currPage = offset * PAGE_BYTES;

	//increment the current page
	if (currPage < 0 || (currPage / PAGE_BYTES) > 511)
		currPage = 0x0000;
}
