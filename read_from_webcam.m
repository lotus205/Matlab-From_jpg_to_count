clc; clear all; close all;
  jpg_pattern = '.jpg';
i=0;

webcamlist
cam = webcam(1);

while true    
    i=i+1

        k = snapshot(cam);
    
        %k=imread('2017.04.29(17-42-51).jpg'); 
        [rozmiar_y,rozmiar_x,kolor] = size(k);

        x=rozmiar_x/2%;%%wsp x analizowanego punktu max 3120 srodek x=1560
        y=rozmiar_y/2%;%%wsp y alanizowanego punktu min 4160 srodek y=2080

        obraz_org=k;

        obraz_bin=im2bw(obraz_org,0.6);
        figure (1)

%---DISPLAING PICTURE---
        subplot 221
        imshow(obraz_org);
        %plot(x,y,'b.')
        title('obraz oryginalny')
        subplot 222
        imshow(obraz_bin);
        title('obraz zbinearyzowany')    
        %subplot 223
        %imshow(obraz_org);
        %title('obraz oryginalny z wskazanym punktem')
        %hold on
        %plot(x,y,'b.')
        %hold off
        %subplot 224
        %imshow(obraz_bin);
        %title('obraz binarny z wskazanym punktem')
%---DISPLAING PICTURE---
    pause(1);
end %infinitive while ends here
clear cam