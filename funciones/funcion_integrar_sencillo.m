function [Int]=integrar_sencillo(x,y)
% Dada una funci�n y (escalar o vectorial) definida en los puntos x 
% calcula la integral num�rica Int(y) 
%
%       [Int_y]=integra(x,y)
%
% No realiza ninguna comprobaci�n de error.
% 
% Entradas:
%    'x' vector fila con las coordenadas x de los puntos; tama�o 1xN
%    'y' vector fila con las coordenadas y de los puntos; tama�o 1xN
%
% Salidas:
%    'Inty'  vector [matriz] de los valores de la integral num�rica en las 
%            coordenadas x de los puntos; tama�o 1xN
%

% Ejercicio 2.3

Int=[0, cumsum( (y(2:end)+y(1:end-1)).*diff(x)/2 )]; 
       
end