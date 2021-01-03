function [ MRG ] = randg( x0, sigma, N, M )
%RANDG Devuelve numeros aleatorios con una distribuci�n gaussiana centrada
%      en x0 con desviaci�n est�ndar sigma (varianza=sigma^2); devuelve una
%      matriz de tama�o N*M
%          MRG=randg( x0, sigma, N, M)
% Entradas:  
%   x0      posici�n media de la distribuci�n gaussiana
%   sigma   desviaci�n est�ndar de la distribuci�n (varianza=sigma^2)
%   N       n�mero de filas de la matriz de salida
%   M       n�mero de columnas de la matriz de salida
%
% Salidas:
%   MRG     Matriz de salida (tama�o N*M) con los n�meros aleatorios

% Ejercicio 4.5

MRG=sigma*randn(N,M)+x0;

end