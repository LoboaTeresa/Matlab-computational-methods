function [vr]=rotacion(vi, theta)
% Rota un vector un angulo theta en grados
%
%   vr=rotacion(vi, theta)
%
% Entrada:
%   vi      coordenadas iniciales, matriz de vectores en columnas 2 x N 
%   theta   angulo de giro (levogiro) en grados, escalar
% Salida:
%   vr      coordenada finales, matriz de vectores en columnas 2 x N
%

% Ejercicio 2.6

if (size(vi,1)-2)
   error('Error: la matriz debe contener vectores columna de tama�o 2');
elseif (prod(size(theta))-1) 
   error('Error: el �ngulo debe ser un �nico valor');
end

ang=theta*pi/180;
c=cos(ang); s=sin(ang);
vr=[c, -s; s, c]*vi;
end