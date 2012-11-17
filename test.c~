#include <stdlib.h>
#include <stdio.h>
#include "function.h"
int main()
{
	unsigned char buffer;
	int result;
	int fd = API_OpenComm("/dev/ttyUSB0",9600);
	result = API_ControlBuzzer(fd,0x00,0x0a,0x0a,&buffer);
	printf("result:%02x buffer:%02x\n",result,buffer);
	return 0;
}
