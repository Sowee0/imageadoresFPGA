close all
clear all
tic

referenciaPupila    = imread('pupila.bmp');
frameBase           = imread('olhando_centro.png');
matrizNotas         = int32(zeros(480,640));

nota = int32(0);
valorFrame = int32(0);
valorPupila = int32(0);

maiorNota = int32(0);
maiorX = 0;
maiorY = 0;

frameCinza = rgb2gray (frameBase);
referenciaCinza = rgb2gray (referenciaPupila);

altura  = size(frameCinza, 1);
largura = size(frameCinza, 2);

alturaReferencia    = size(referenciaCinza,1);
larguraReferencia   = size(referenciaCinza,2);

figure
imshow(frameCinza)
%plot(y2, x2, 'ro');

hold on

for L = 1:largura
    for A = 1:altura
        
        for lR = 1:larguraReferencia
            for aR = 1:alturaReferencia
                
                if((aR + A < altura) && (lR + L < largura))
                    valorFrame = int32(frameCinza(A + aR -1, L + lR -1));
                    valorPupila = int32(referenciaCinza(aR, lR));
                    nota = nota + (255 - abs(valorFrame - valorPupila));
                    
                    
                end
            end
        end
        
        
       
        
        matrizNotas(A,L) = nota;
        
        if(nota > maiorNota)
            maiorNota = nota;
            maiorX = L;
            maiorY = A;
            maiorXaj =  maiorX + 127;
            maiorYaj =  maiorY + 127;
        end
        
        nota = 0;
        
        
    end
end


plot(maiorYaj, maiorXaj, 'go');

figure

h = surfl(matrizNotas);
set(h,'LineStyle','none')
xlabel('X')
ylabel('Y')
zlabel('Correlação')


M = max(matrizNotas);

    

toc