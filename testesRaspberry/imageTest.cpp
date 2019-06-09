#include <iostream>
#include <fstream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

#define HSYNC 0
#define VSYNC 2
#define PXCLK 3

#define D0 12
#define D1 13
#define D2 14
#define D3 15
#define D4 16
#define D5 1
#define D6 4
#define D7 5

short int invWord(short int  word);
void loop();
void setup();

void hsyncInterrupt();
void vsyncInterrupt();
void pxclkInterrupt();



int main(){
	
	setup();
	loop();
}

void loop(){
	
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


void setup(){
	
	pinMode (HSYNC, INPUT);
	pinMode (VSYNC, INPUT);
	pinMode (PXCLK, INPUT);
	
	pinMode (D0, INPUT);
	pinMode (D1, INPUT);
	pinMode (D2, INPUT);
	pinMode (D3, INPUT);
	pinMode (D4, INPUT);
	pinMode (D5, INPUT);
	pinMode (D6, INPUT);
	pinMode (D7, INPUT);
	
}
	
