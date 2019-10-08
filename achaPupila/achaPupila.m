close all

referenciaPupila    = imread('pesquisa_olho.png');
frameBase           = imread('base_olho.png');
imageBranca         = imread('imagem_branca.png'); %branco: 255 preto: 0
matrizNotas         = zeros(480,640);
threshold = 50;
nota = 0;

altura  = size(frameCinza, 1);
largura = size(frameCinza, 2);

alturaReferencia    = size(referenciaCinza,1);
larguraReferencia   = size(referenciaCinza,2);

imshow(frameBase);

frameCinza = rgb2gray (frameBase);
referenciaCinza = rgb2gray (referenciaPupila);

figure
imshow(frameCinza);

for a = 1:altura - alturaReferencia;
   
    for l = 1:largura - larguraReferencia;
        
        for aR = 1:alturaReferencia
            
            for lR = 1:larguraReferencia
                
                valorFrame = abs(frameCinza(a + aR, l + lR) - referenciaCinza(aR, lR));
                if( valorFrame < threshold)
                   
                    nota = (threshold - valorFrame) + nota;
                    
                end
                
            end
            
        end
        
         matrizNotas(a,l) = nota;
         nota = 0;
          
    end
    
end

M = max(matrizNotas);