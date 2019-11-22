clc
close all

contador = 0;
valorPixel = 0;


imagemLida = imread('pupila.bmp');
saida = fopen("saida.txt",'w');

imagemCinza = rgb2gray (imagemLida);
doubleCinza = im2double (imagemCinza);

alturaImagem    = size(imagemCinza,1);
larguraImagem   = size(imagemCinza,2);

for a = 1:alturaImagem;
    for l = 1:larguraImagem;
        
        contadorBinario = dec2bin(contador ,8);
        pixel = doubleCinza(a, l);
        valor = pixel*1023;
        valorPixel = uint16(valor);
        
        texto = '\t\t8''d%d:\toVAL <= 10''d%d;\n';
        fprintf(saida, texto, contador, valorPixel);
        
        contador = contador + 1;
    end
end
