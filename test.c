#include <stdlib.h>
#include <stdio.h>
#include "function.h"
int main()
{
	unsigned char buffer;
	int result;
	result = API_ControlBuzzer(0x0a,0x0a,&buffer);
	printf("result:%02x buffer:%02x\n",result,buffer);
	return 0;
}
