#include "Arduino.h"
#include "Wire.h"

const int enderecoCamera = 0x5D;
const int enderecoPagina = 0xFD;

int reading;
char i;

void setup()
{
  pinMode(LED_BUILTIN,OUTPUT);
  Serial.begin(9600);
  Wire.begin();
  while (!Serial);  

}

void loop()
{
  Serial.println("Lendo os primeiros 15 registradores da câmera");
  
  for(i = 0 ; i < 15; i++){

  Wire.beginTransmission(enderecoCamera);
  Wire.write(byte(i));
  Wire.endTransmission();

  Wire.requestFrom(enderecoCamera, 2);

  if (Wire.available() >= 2) { // if two bytes were received
    reading = Wire.read();     // receive high byte (overwrites previous reading)
    reading = reading << 8;    // shift high byte to be high 8 bits
    reading |= Wire.read();    // receive low byte as lower 8 bits
    
  } 

  Serial.print("Registrador: ");
  Serial.print(i, HEX);
  Serial.print("  Valor: ");
  Serial.println(reading, HEX);
  } 

  delay(500);

}
