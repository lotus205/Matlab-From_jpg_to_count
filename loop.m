clc; clear all; close all;
  jpg_pattern = '.jpg';
i=0;
while true    
    i=i+1
%---------------READ LAST JPG FILE------------------------    
    lista_plikow= dir;
    no_file = length(lista_plikow)

    najbardziej_aktualny_plik = '';
    for i=1:no_file
        numer_pliku = no_file + 1 - i;
        %disp(lista_plikow(numer_pliku).name)
        if( contains(lista_plikow(numer_pliku).name,jpg_pattern,'IgnoreCase',true) )
     %   if( contains(string('test'),jpg_jpg_pattern) )%%%%%to jest if ziomka po lewo 
            najbardziej_aktualny_plik = lista_plikow(numer_pliku).name
            break
        end
    end    
%---------------READ LAST JPG FILE------------------------     

   if(contains(najbardziej_aktualny_plik,jpg_pattern,'IgnoreCase',true) )
%---------------OPEN LAST JPG FILE-------------------------
    
        
        disp('dupa')
             %disp('to jest JPEG');
   

   
    k=imread(najbardziej_aktualny_plik);
dane_z_whos=whos;

rozmiar_zdjecia=dane_z_whos(3).size
rozmiar_y=rozmiar_zdjecia(1)
rozmiar_x=rozmiar_zdjecia(2)

    x=rozmiar_x/2;%%wsp x analizowanego punktu max 3120 srodek x=1560
    y=rozmiar_y/2;%%wsp y alanizowanego punktu min 4160 srodek y=2080

    obraz_org=k;

    %rozmiar_obrazu=whos('obraz_org')

    obraz_bin=im2bw(obraz_org,0.6);
    figure (1)


    subplot 221
    imshow(obraz_org);
    %plot(x,y,'b.')
    title('obraz oryginalny')
    subplot 222
    imshow(obraz_bin);
    title('obraz zbinearyzowany')    
    subplot 223
    imshow(obraz_org);
    title('obraz oryginalny z wskazanym punktem')
    hold on
    plot(x,y,'b.')
    hold off
    subplot 224
    imshow(obraz_bin);
    title('obraz binarny z wskazanym punktem')
        if obraz_bin(x,y)==0%%1==piksel bia³y=miejsce wolne
            hold on;
             disp('miejsce jest wolne ')
             miejsce=0;%%miejsce jest wolne
            plot(x,y,'g.')
            hold off;
        end
        if obraz_bin(x,y)==1%%%%0==piksel czarny=miejsce zajete
             disp('miejsce jest zajete ')
              miejsce=1;%%miejsce jest zajete
             hold on;
             plot(x,y,'r.')
             hold off;
        end
      %  xlswrite ('wynik_z_matlaba',miejsce,'Arkusz pierwszy','A2')
      %  csvwrite('wynik_z_matlaba_csv',miejsce)
      pause(5);
      close (1)
         else
        disp('to nie jest JPEG');
        
%---------------OPEN LAST JPG FILE-------------------------

%---------------PICTURE PROCESSING-------------------------

%---------------PICTURE PROCESSING-------------------------

%---------------SENDING COUNT OF FREE PARKING PLACES-------
%---------------SENDING COUNT OF FREE PARKING PLACES-------
    end
    
%---------------DELETE ALL FILES IN FOLDER-----------------
    lista_plikow= dir;
    no_file = length(lista_plikow)
    jpg_pattern = '.jpg';
    for i=1:no_file
        if( contains(lista_plikow(i).name,jpg_pattern,'IgnoreCase',true) )
            delete(lista_plikow(i).name)
        end
    end
%---------------DELETE ALL FILES IN FOLDER-----------------  
%disp('przed endem  whila')
    pause(5);
    
end