function [m]=ModuloVector(A)
% Calcula el m�dulo de un vector 
%
%       m=ModuloVector(A)
%
% Entrada:
%   A       vector o matriz (vectores consecutivos)
% Salida:
%   m       escalar si A es vector;  
%           vector si A en matriz (m�dulos de los vectores columna de A).
%

% Ejemplo 2.1
m=(sum(A.^2)).^0.5;
end