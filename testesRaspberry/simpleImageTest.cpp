#include <iostream>
#include <fstream>
#include <wiringPiI2C.h>
#include <wiringPi.h>
#include <errno.h>

using namespace  std;

const int VSYNC = 0; //raspberry pino 17
const int HSYNC = 2; //raspberry pino 27
const int PXCLK = 3; //raspberry pino 22

const int D0 = 12;
const int D1 = 13;
const int D2 = 14;
const int D3 = 15;
const int D4 = 16;
const int D5 = 1;
const int D6 = 4;
const int D7 = 5;

const int frameWidth = 1800;
const int frameHeight = 1400;

char image[frameWidth][frameHeight];

int currentFrame 	= 0;
int currentLine 	= 0;
int currentPixel 	= 0;

short int invWord(short int  word);
void loop();
void setup();

void hsyncInterrupt();
void vsyncInterrupt();
void pxclkInterrupt();

void dumpFrame();
char inputToByte();

int main(){

	wiringPiSetup ();

	ofstream imageFile;

	int fd1;
	short int result;
	int addr_zero = 0x00;

	fd1 = wiringPiI2CSetup(0x5D);
	

	setup();
	loop();
}

void loop(){
	
while(1){
//cout << "esperando" << endl;
//delay(500);
}
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

	cout << "Starting the interrupts and frame captures" << endl;

	wiringPiISR (VSYNC, INT_EDGE_RISING, 	&vsyncInterrupt);
	wiringPiISR (HSYNC, INT_EDGE_RISING, 	&hsyncInterrupt);
	wiringPiISR (PXCLK, INT_EDGE_RISING, 	&pxclkInterrupt);
	
}


void vsyncInterrupt(){

	wiringPiISR (PXCLK, NONE, 	&pxclkInterrupt);
	dumpFrame();	
	currentFrame++;
	wiringPiISR (PXCLK, INT_EDGE_RISING, 	&pxclkInterrupt);

	if(currentFrame > 10){
	cout << "read 10 frames" << endl;
	exit(1);
	wiringPiISR (PXCLK, NONE, 	&pxclkInterrupt);
	}


}

void hsyncInterrupt(){	
	
	currentLine++;
	currentPixel = 0;

}

void pxclkInterrupt(){

	image[currentLine][currentPixel] = inputToByte();
	currentPixel++;

}

char inputToByte(){
	char byteRead;

	byteRead = 	(digitalRead(D7) << 7) | (digitalRead(D6) << 6) | (digitalRead(D5) << 5) | (digitalRead(D4) << 4) | 
				(digitalRead(D3) << 3) | (digitalRead(D2) << 2) | (digitalRead(D1) << 1) | (digitalRead(D0) << 0);
	
	return byteRead;
}

void dumpFrame(){

	char fileName[20];
	sprintf(fileName,"frame%d.csv", currentFrame);

	ofstream imageFile;

	imageFile.open(fileName);

	for(int j = 0; j < frameWidth; j++){
		for (int k = 0; k < frameHeight; k++){
			imageFile << image[j][k] << ",";

		}

		imageFile << endl;
	}

	imageFile.close();
}
