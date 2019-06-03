#include <iostream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

short int invWord(short int  word);

int main(){
int fd1;
short int result;
int addr_zero = 0x00;

fd1 = wiringPiI2CSetup(0x5D);


cout << "Init Result: " << fd1 << endl;

cout << "Changing the register page" << endl;

result = wiringPiI2CReadReg16(fd1, addr_zero + i);
result = invWord(result);

}

short int invWord(short int word){
	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}
