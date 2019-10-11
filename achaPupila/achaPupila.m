close all
tic

referenciaPupila    = imread('pesquisa_olho.png');
frameBase           = imread('base_olhotst.png');
matrizNotas         = zeros(480,640);
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
subplot(1,2,1)
imshow(frameBase)

subplot(1,2,2)
imshow(frameCinza)

for a = 1:altura - alturaReferencia;
   
    for l = 1:largura - larguraReferencia;
        
        for aR = 1:alturaReferencia
            
            for lR = 1:larguraReferencia
                
                valorFrame = int32(abs(frameCinza(a + aR, l + lR) - referenciaCinza(aR, lR)));
                if( valorFrame < threshold)
                   
                    nota = nota + threshold - valorFrame;
                    
                end
                
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

maiorXaj =  maiorX + 90;
maiorYaj =  maiorY + 120;

hold on

%plot(y2, x2, 'ro');

subplot(1,2,1);
hold on
plot(maiorYaj, maiorXaj, 'go');

M = max(matrizNotas);

toc