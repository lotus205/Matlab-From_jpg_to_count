clc; clear all; close all;

lista_plikow= dir;
no_file = length(lista_plikow)
pattern = ".jpg";
najbardziej_aktualny_plik = "";
for i=1:no_file
    numer_pliku = no_file + 1 - i;
    if( contains(lista_plikow(numer_pliku).name,pattern,'IgnoreCase',true) )
        najbardziej_aktualny_plik = lista_plikow(numer_pliku).name
        break
    end
end