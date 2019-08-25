if ["$1" == ""]; then
    echo "Uso: getAndBuild entrada saida";
    exit
fi

echo "Atualizando os arquivos\n"
git pull
echo "Compilando o arquivo\n" 

g++ $1 -lwiringPi -o $2d