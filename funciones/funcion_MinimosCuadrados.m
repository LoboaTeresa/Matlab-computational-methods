function [m,n,r]=MinimosCuadrados(x,y)
% Calcula la recta de ajuste por m�nimos cuadrados a los datos D
%
%       [m,n,r]=MinimosCuadrados(x,y)
%
% Entrada:
%   x       vector con las coordenadas x de N datos
%   y       vector con las coordenadas y de N datos
% Salida:
%   m       escalar, pendiente de la recta de ajuste
%   n       escalar, t�rmino independiente de la recta de ajuste
%   r       escalar, coeficiente de correlaci�n de los datos
%

% Ejercicio 2.10

N=length(x); % Tama�o del vector x;

if (numel(x)-N + numel(y)-length(y))
    error('Las entradas "x" e "y" deben ser vectores (y de la misma longitud)');
elseif (N-length(y)) % Se comprueba si los dos vectores tienen igual longitud
    error('Los vectores "x" e "y" deben tener igual longitud');
end

if (size(x,1)-size(y,1))    % Si 'x' e 'y' tienen el mismo tama�o pero
    y=y';                   % uno es vector fila y el otro columna, 
end                         % se traspone 'y' para que no haya problemas.
    
Sx=sum(x);      % Sum(x)
Sxx=sum(x.^2);  % Sum(x^2)
Sy=sum(y);      % Sum(y)
Syy=sum(y.^2);  % Sum(y^2)
Sxy=sum(x.*y);  % Sum(x�y)
Dx=N*Sxx-Sx^2;  % Facilita los calculos posteriores
Dy=N*Syy-Sy^2;

m=(N*Sxy-Sx*Sy)/Dx;    % la pendiente m
n=(Sxx*Sy-Sx*Sxy)/Dx;  % el termino independiente n
r=m*sqrt(Dx/Dy);       % factor de correlaci�n r
end