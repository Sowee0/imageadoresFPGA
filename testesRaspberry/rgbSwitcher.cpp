#include <iostream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

#define enderecoZero 	0x00
#define seletorPagina	0xF0
#define controleSaida	0x97
#define paginaCerta		1
#define mascaraRGB		0b0000000000010000
#define mascaraFormato	0b0000000000100000


short int invWord(short int  word);

int main(){
int fd1;
short int result, regPage;
int pageNumber = 1;
int addrZero = 0x00;
int addrPage = 0xF0;
int 

fd1 = wiringPiI2CSetup(0x5D);


cout << "Init Result: " << fd1 << endl;

regPage = wiringPiI2CReadReg16(fd1, addrPage);
regPage = invWord(regPage);

cout << "Current register page: " << dec << regPage << endl;
cout << "Changing to register page " << pageNumber << endl;

cout << "Reading from page " << dec << pageNumber << " address " << hex << addrZero << " should be 0x00" << endl; 

pageNumber = invWord(pageNumber);

wiringPiI2CWriteReg16 (fd1, addrPage, pageNumber);

result = wiringPiI2CReadReg16(fd1, addrZero);
result = invWord(result);

cout << "Value on address " << hex << addrZero << " = " << result << endl;


}

short int invWord(short int word){
	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}
