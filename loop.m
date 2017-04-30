clc; clear all; close all;
  %jpg_pattern = '.jpg';
i=0;

webcamlist
cam = webcam(1);

while true    
    i=i+1;
%---------------READ LAST JPG FILE------------------------    
%     lista_plikow= dir;
%     no_file = length(lista_plikow)
% 
%     najbardziej_aktualny_plik = '';
%     for i=1:no_file
%         numer_pliku = no_file + 1 - i;
%         %disp(lista_plikow(numer_pliku).name)
%         if( contains(lista_plikow(numer_pliku).name,jpg_pattern,'IgnoreCase',true) )
%      %   if( contains(string('test'),jpg_jpg_pattern) )%%%%%to jest if ziomka po lewo 
%             najbardziej_aktualny_plik = lista_plikow(numer_pliku).name
%             break
%         end
%     end %searching through file list end here -> no .jpg file found
% %---------------READ LAST JPG FILE------------------------     
% 
% %---------------PICTURE PROCESSING------------------------
%     if(contains(najbardziej_aktualny_plik,jpg_pattern,'IgnoreCase',true) ) %if found file is .jpg
%         
%         %OPEN LAST JPG FILE
%         k=imread(najbardziej_aktualny_plik);
        k = snapshot(cam);
        [rozmiar_y,rozmiar_x,kolor] = size(k);

        x=rozmiar_x/2;%%wsp x analizowanego punktu max 3120 srodek x=1560
        y=rozmiar_y/2;%%wsp y alanizowanego punktu min 4160 srodek y=2080

              obraz_org=k;
obraz_mono=rgb2gray(obraz_org);
obraz_mono=double(obraz_mono);
mono_suma=0;
mono_suma=double(mono_suma);
for xx=1:rozmiar_y
    for yy=1:rozmiar_x
        mono_suma=mono_suma+obraz_mono(xx,yy);
    end
end
mono_suma=double(mono_suma)
rozmiar_zdj=rozmiar_x*rozmiar_y;
prog_bin=(mono_suma/(rozmiar_zdj));
prog_bin=prog_bin/255;
%prog_bin=prog_bin+0.1;

        %rozmiar_obrazu=whos('obraz_org')

        obraz_bin=im2bw(obraz_org,prog_bin);
        figure (1);

%---DISPLAING PICTURE---
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
%---DISPLAING PICTURE---

%---PICTURE PROCESSING---       
        if obraz_bin(x,y)==0%%1==piksel bia³y=miejsce wolne
            hold on;
            STR = ['for:',num2str(i),', miejsce jest wolne'];
            disp(STR)
            miejsce=1;%%miejsce jest wolne
            plot(x,y,'g.')
            hold off;
        end
        if obraz_bin(x,y)==1%%%%0==piksel czarny=miejsce zajete
             STR = ['for:',num2str(i),', miejsce jest zajete'];
             disp(STR)
             miejsce=0;%%miejsce jest zajete
             hold on;
             plot(x,y,'r.')
             hold off;
        end
%---PICTURE PROCESSING---   

%---SENDING COUNT OF FREE PARKING PLACES---
        %  xlswrite ('wynik_z_matlaba',miejsce,'Arkusz pierwszy','A2');
        %  csvwrite('wynik_z_matlaba_csv',miejsce);
        PostName1 = "free_spaces";
        PostValue1 = miejsce;
        PostName2 = "Id";
        PostValue2 = 123321;
        url = "http://parkingdemoapp.azurewebsites.net/api/spaces";
        response = webwrite(url,PostName1,PostValue1,PostName2,PostValue2);
        %pause(5)
%---SENDING COUNT OF FREE PARKING PLACES---
%     else
%         disp('to nie jest JPEG');
%     end
    
%---------------DELETE ALL FILES IN FOLDER-----------------
%     lista_plikow= dir;
%     no_file = length(lista_plikow)
%     jpg_pattern = '.jpg';
%     for i=1:no_file
%         if( contains(lista_plikow(i).name,jpg_pattern,'IgnoreCase',true) )
%             %NIE USUWA PLIKOW JPG - DO TESTOW
%             %delete(lista_plikow(i).name)
%         end
%     end %deleting file loop ends here
%---------------DELETE ALL FILES IN FOLDER-----------------  
%disp('przed endem  whila')
    pause(1);
    %close (1)
    
end %infinitive while ends here
clear cam