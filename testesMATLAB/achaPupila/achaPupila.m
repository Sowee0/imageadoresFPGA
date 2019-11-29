close all
tic

referenciaPupila    = imread('pupila.bmp');
frameBase           = imread('olhando_centro.png');
matrizNotas         = int32(zeros(480,640));
threshold = int32(50);
nota = int32(0);
valorFrame = int32(0);

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

subplot(1,2,2)
imshow(frameCinza)

for a = 1:altura - alturaReferencia
   
    for l = 1:largura - larguraReferencia
        
        for aR = 1:alturaReferencia
            
            for lR = 1:larguraReferencia
                
                valorFrame = int32(frameCinza(a + aR, l + lR));
                valorPupila =  int32(referenciaCinza(aR, lR));
                nota = 255 + nota + abs(valorFrame - valorPupila);
                    
            end
                
         end
         matrizNotas(a,l) = nota;
          if(nota > maiorNota)
             
             maiorNota = nota;
             maiorX = a;
             maiorY = l;
             
          end
         
         nota = 0;
    end
end

%[max_num, max_idx]=max(matrizNotas(:));
%[X,Y]=ind2sub(size(matrizNotas),max_idx);

%y2 = Y + 120;
%x2 = X + 90;

maiorXaj =  maiorY + 127;
maiorYaj =  maiorX + 127;

hold on

%plot(y2, x2, 'ro');
subplot(1,2,1)
surfl(matrizNotas);

subplot(1,2,2);
hold on
plot(maiorYaj, maiorXaj, 'go');


M = max(matrizNotas);



toc