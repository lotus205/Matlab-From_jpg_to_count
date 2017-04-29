clc; clear all; close all;
lista_plikow= dir;

no_file = length(lista_plikow)

pattern = ".jpg";
for i=1:no_file
    if( contains(lista_plikow(i).name,pattern,'IgnoreCase',true) )
        delete(lista_plikow(i).name)
    end
end