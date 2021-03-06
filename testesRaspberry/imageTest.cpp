#include <iostream>
#include <fstream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

const int HSYNC = 0;
const int VSYNC = 2;
const int PXCLK = 3;

const int D0 = 12;
const int D1 = 13;
const int D2 = 14;
const int D3 = 15;
const int D4 = 16;
const int D5 = 1;
const int D6 = 4;
const int D7 = 5;

char image[1800][1400];
int line = 0;
int column = 0;

bool startCapture = false;


short int invWord(short int  word);
void loop();
void setup();

void hsyncInterrupt();
void vsyncInterrupt();
void pxclkInterrupt();






int main(){

	int fd1;
	short int result;
	int addr_zero = 0x00;

	fd1 = wiringPiI2CSetup(0x5D);
	

	setup();
	loop();
}

void loop(){
	



//Sincronizar VSYNC, HSYNC e PXLCLK para receber uma imagem inteira
//Lembrar que cada pixel tem DOIS BYTES



}

short int invWord(short int word){

	//Invertendo o byte mais significativo e o byte menos significativo
	//de maneira a seguir o que é pedido pela comunicação de escrita
	//e leitura da câmera.

	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}


void setup(){

	//Iniciando o wiringPi (obrigatório)
	wiringPiSetup ();
	
	//Setando os pinos de transmissão de dados de acordo
	
	pinMode (D0, INPUT);
	pinMode (D1, INPUT);
	pinMode (D2, INPUT);
	pinMode (D3, INPUT);
	pinMode (D4, INPUT);
	pinMode (D5, INPUT);
	pinMode (D6, INPUT);
	pinMode (D7, INPUT);

	//Setando os pinos de sincronização e definindo as suas interrupções de acordo

	wiringPiISR (VSYNC, INT_EDGE_BOTH, vsyncInterrupt());
	wiringPiISR (HSYNC, INT_EDGE_RISING, hsyncInterrupt());
	wiringPiISR (PXCLK, INT_EDGE_RISING, pxclkInterrupt());
	
}


void vsyncInterrupt(){

	if(digitalRead(VSYNC)){
	cout << "Starting a frame capture:" << endl;
	startCapture = true;
	}
	else{
		save
	}


}

void hsyncInterrupt(){
	
	if(startCapture)
	line++;

}

void pxclkInterrupt(){
	if(startCapture){
	if(digitalRead(HSYNC)){
		image[line][column] = inputToByte();
		column++;
	}
	else{
		column = 0;
	}
}



	if(digitalRead())
	

}

char inputToByte(){
	char byteRead;

	byteRead = 	(digitalRead(D7) << 7) | (digitalRead(D6) << 6) | (digitalRead(D5) << 5) | (digitalRead(D4) << 4) | 
				(digitalRead(D3) << 3) | (digitalRead(D2) << 2) | (digitalRead(D1) << 1) | (digitalRead(D0) << 0);
	
	return byteRead;
}
