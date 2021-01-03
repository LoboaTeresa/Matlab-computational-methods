function [xd,yd]=derivar(x,y) %LA MEJOR
% Dada una funci�n y (escalar o vectorial) definida en los puntos x 
% calcula la derivada num�rica (y') %si derivo en función del tiempo, x=t y dx=dt. y es la funcion que quiero derivar.
%Si quier hacer la derivada segunda, meto xd en el lugar de la d y la yd en el lugar de la y.
%
%       [xd,yd]=deriva(x,y)
%
% Devuelve los puntos xd=[x_i+x_(i+1)]/2 y la derivada en esos puntos 
%
% Entradas:
%    'x' vector fila con las coordenadas x de los puntos;     tama�o 1xN
%    'y' vector [matriz] con las coordenadas y de los puntos; tama�o mxN
%
% Salidas:
%    'xd' vector de puntos x donde se calcula la derivada; tama�o 1x(N-1)
%    'yd' vector [matriz] de los valores y' ;              tama�o mx(N-1)
%

% Ejercicio 2.2

if size(x,2)-size(y,2)
    error('Los datos de entrada no tienen el mismo n�mero de columnas');
elseif size(x,1)-1
    error('La variable x debe contener una �nica fila');
end

nd=size(y,1);              % n�mero de funciones a derivar, n� filas en y
xe=repmat(x,nd,1);             %transforma x para tener mismo tama�o que y
yd=diff(y,1,2)./diff(xe,1,2);  %derivada numerica
%  diff(y,1,2) realiza la diferenciaci�n de 1er orden a lo largo de la
%  2a dimensi�n de la matriz
xd=(x(2:end)+x(1:end-1))/2;    %puntos x medios para la der. num�rica
end
