clc; clear all; close all;
jpg_pattern = ".jpg";

i=0;
while true    
    i=i+1
%---------------READ LAST JPG FILE------------------------    
    lista_plikow= dir;
    no_file = length(lista_plikow)

    najbardziej_aktualny_plik = "";
    for i=1:no_file
        numer_pliku = no_file + 1 - i;
        if( contains(lista_plikow(numer_pliku).name,jpg_pattern,'IgnoreCase',true) )
            najbardziej_aktualny_plik = lista_plikow(numer_pliku).name
            break
        end
    end    
%---------------READ LAST JPG FILE------------------------     

    if(contains(najbardziej_aktualny_plik,jpg_pattern,'IgnoreCase',true) )
%---------------OPEN LAST JPG FILE-------------------------
    
        
        
        
        
%---------------OPEN LAST JPG FILE-------------------------

%---------------PICTURE PROCESSING-------------------------
%---------------PICTURE PROCESSING-------------------------

%---------------SENDING COUNT OF FREE PARKING PLACES-------
%---------------SENDING COUNT OF FREE PARKING PLACES-------
    end
    
%---------------DELETE ALL FILES IN FOLDER-----------------
    lista_plikow= dir;
    no_file = length(lista_plikow)
    pattern = ".jpg";
    for i=1:no_file
        if( contains(lista_plikow(i).name,pattern,'IgnoreCase',true) )
            delete(lista_plikow(i).name)
        end
    end
%---------------DELETE ALL FILES IN FOLDER-----------------    
    pause(1);
end