#include <iostream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

short int invWord(short int  word);

int main(){
int fd1;
short int result;
int pageNumber = 2;
int addrZero = 0x00;
int addrPage = 0xF0;

fd1 = wiringPiI2CSetup(0x5D);


cout << "Init Result: " << fd1 << endl;

regPage = wiringPiI2CReadReg16(fd1, addrPage);
regPage = invWord(regPage);

cout << "Current register page: " dec << regPage << endl;
cout << "Changing to register page " << pageNumber << endl;

int wiringPiI2CWriteReg16 (fd1, addrPage, pageNumber);

cout << "Reading from page " << dec << pageNumber << " address " << hex << addrZero << "should be 0x00" << endl; 

result = wiringPiI2CReadReg16(fd1, addrZero);
result = invWord(result);

cout << "Value on address " << hex << addrZero << " = " << result << endl;


}

short int invWord(short int word){
	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}
