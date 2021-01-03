function [vr]=traslacion(vi, v0)
% Mueve un vector vi a nuevas coordenadas vr=vi+v0
%
%   vr=traslacion(vi, v0)
%
% Entrada:
%   vi      coordenadas iniciales, matriz de vectores en columnas 2 x N 
%   v0      cordenadas de vector traslaci�n, vertor columna tama�o 2 
% Salida:
%   vr      coordenada finales, matriz de vectores en columnas 2 x N
%

% Ejercicio 2.5

if (size(vi,1)-2)
    error('Error: la matriz debe contener vectores columna de tama�o 2');
elseif (sum(abs((size(v0)-[2,1]))))
    error('Error: el vector traslacion debe ser un vector tama�o 2x1');
end

vr=[v0(1)+vi(1,:);v0(2)+vi(2,:)];
end