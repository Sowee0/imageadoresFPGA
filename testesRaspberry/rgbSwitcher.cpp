#include <iostream>
#include <wiringPiI2C.h>
#include <errno.h>

using namespace  std;

//Variáveis de controle
const int enderecoCamera	= 0x5D;
const int enderecoPagina	= 0xF0;
const int enderecoControle	= 0x97;
const int mascaraRGB		= 0b0000000000010000; //RGB ligado
const int mascaraFormato	= 0b0000000000100000; //Formato RGB555

//esboço da função de inversão de bytes
short int invWord(short int  word);

int main(){

//Variáveis úteis
int fd1;
int enderecoObjetivo	= 0x08;
int paginaObjetivo	= 1;

short int result, regPage;


//Iniciando a câmera no I2C
fd1 = wiringPiI2CSetup(enderecoCamera);
cout << "Init Result: " << fd1 << endl;

//Recebendo e imprimindo a página atual
regPage = wiringPiI2CReadReg16(fd1, enderecoPagina);
regPage = invWord(regPage);
cout << "Current register page: " << dec << regPage << endl;
cout << "Changing to register page " << paginaObjetivo << endl;

//Mudando a página escrevendo no registrador

cout << "Reading from page " << dec << paginaObjetivo << " address " << hex << enderecoObjetivo << " should be 0x01F8" << endl; 

paginaObjetivo = invWord(paginaObjetivo);
wiringPiI2CWriteReg16 (fd1, enderecoPagina, paginaObjetivo);

//Verificando se a página foi realmente mudada

regPage = wiringPiI2CReadReg16(fd1, enderecoPagina);
regPage = invWord(regPage);
cout << "Current register page: " << dec << regPage << endl;


//Verificando o valor no registrador 8 

result = wiringPiI2CReadReg16(fd1, enderecoObjetivo);
result = invWord(result);

cout << "Value on address " << hex << enderecoObjetivo << " = " << result << endl;

//Aplicando a saída RGB 555

int valorFinal = mascaraFormato | mascaraRGB;

valorFinal = invWord(valorFinal);
wiringPiI2CWriteReg16 (fd1, enderecoObjetivo, valorFinal);

//Checando se a saída foi escrita corretamente

enderecoObjetivo = enderecoControle;

result = wiringPiI2CReadReg16(fd1, enderecoObjetivo);
result = invWord(result);

cout << "Value on address " << hex << enderecoObjetivo << " = " << result << endl;
if(result = valorFinal){
	cout <<  "Success!" << endl;
}

}

short int invWord(short int word){

	//Operação simples de inversão do byte mais significativo com o menos significativo
	//A leitura é feita por ODD/EVEN byte 
	short int hibyte = (word & 0xFF00) >> 8;
	short int lobyte = (word & 0xFF);

	return(lobyte << 8 | hibyte);

}
