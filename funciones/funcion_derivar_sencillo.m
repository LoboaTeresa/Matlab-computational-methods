function [xd,yd]=derivar_sencillo(x,y)
% Dada una funci�n y (escalar o vectorial) definida en los puntos x 
% calcula la derivada num�rica (y') 
%
%       [xd,yd]=deriva_sencilla(x,y)
%
% Devuelve los puntos xd=[x_i+x_(i+1)]/2 y la derivada en esos puntos
%
% No realiza ninguna comprobaci�n de error.
%
% Entradas:
%    'x' vector fila con las coordenadas x de los puntos; tama�o 1xN
%    'y' vector fila con las coordenadas y de los puntos; tama�o 1xN
%
% Salidas:
%    'xd' vector fila de los puntos x donde se calcula la derivada; 1x(N-1)
%    'yd' vector fila de los valores y' (derivada de y);     tama�o 1x(N-1)
%

% Ejercicio 2.2

yd=diff(y)./diff(x);    %derivada numerica
xd=(x(2:end)+x(1:end-1))/2;    %puntos x medios para la der. num�rica
end

%%ej:
%x=[0:1:20];
%y=x.^2;