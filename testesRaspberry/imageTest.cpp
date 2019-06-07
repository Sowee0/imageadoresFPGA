#include <iostream>
#include <fstream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

short int invWord(short int  word);

int main(){
	
//Primeiramente escrevendo no I2C na segunda página que o output deve sair em RGB


//Sincronizar VSYNC, HSYNC e PXLCLK para receber uma imagem inteira
//Lembrar que cada pixel tem DOIS BYTES

int fd1;
short int result;
int addr_zero = 0x00;

fd1 = wiringPiI2CSetup(0x5D);


cout << "Starting a frame capture:" << endl;

cout << "Changing the register page" << endl;

result = wiringPiI2CReadReg16(fd1, addr_zero + i);
result = invWord(result);

}

short int invWord(short int word){
	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}
