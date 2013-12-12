/* Demo Application for Lab 1 */
#include <stdio.h>
#include <fcntl.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

static const char *cmdWrite = "write";
static const char *cmdRead = "show";
static char sReturn[256]; //the string in the buffer will point to this array of char

int main(int argc, char **argv)
{
	int fd1;
	int res;
	//char string1[] = "Test";


	/* open devices */	
	fd1 = open("/dev/gmem", O_RDWR);


	if (fd1<0 )
	{
		printf("Can not open device file.\n");		
		return 0;
	}
	
	//if statements to check the command
	//is the command "write"
	//strcmp() returns 0 when true
	if (!strcmp(cmdWrite, argv[1])) {
		res = write(fd1, argv[2], strlen(argv[2])+1);
	}
	//is the command "show"
	else if (!strcmp(cmdRead, argv[1])) {
		res = read(fd1, sReturn, 256);
		printf("%s\n",sReturn);
	}
	
/*
	if(res == strlen(argv[2])+1)
	{
		printf("Can not write to the device file.\n");		
		return 0;
	}
*/
	
	/* close devices */
	close(fd1);

	
	return 0;
}
