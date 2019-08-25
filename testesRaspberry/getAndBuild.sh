#!/bin/bash

if ["$1" == ""]
then
    echo "Uso: getAndBuild entrada saida";
    exit
fi

echo "Atualizando os arquivos"
git pull
echo "Compilando o arquivo" 

g++ $1 -lwiringPi -o $2
echo "finalizado"