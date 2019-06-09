#Esse script inicia o clock no pino designado com a frequência designada

pinoClock=7
frequencia=4000000

echo "Iniciando o clock"
gpio mode $pinoClock clock

echo "Selecionando a frequência de $frequencia Hz"
gpio clock $pinoClock $frequencia

echo "Rodando a ferramenta de I2C para testar"
i2cdetect -y 1


