function [E,V] = CampoPotencial (q, rq, re)
% Devuelve el campo el�ctrico y el potencial en los puntos 'r'
% debido a una carga 'q' situada en el punto 'rq'.
%
%       [E,V]=CampoPotencial(q, rq, re);
%
% Entradas
%   q       escalar, carga en Coulombios
%   rq      vector columna 3x1; coordenadas (x;y;z) de la carga; en m
%   re       matriz 3xN; coordenadas (x;y;z) de las N posiciones donde se
%                        quiere realizar el calculo; en m
%
% Salidas
%   E       matriz 3xN; componentes (Ex;Ey;Ez) en las N posiciones donde se
%                        ha realizado el calculo; en V/m
%   V       vector 1xN; potencial el�ctrico V en las N posiciones donde se
%                        ha realizado el calculo; en V
%

% Computaci�n I,  Control 1 (4-11-2016)
%  Ejercicio 3.A
% Se tiene en cuenta que 're' puede contener muchos puntos (no uno �nico).

if (sum(abs(size(q)-[1,1])))
    error('S�lo puede haber una carga: q=%g.', q);
elseif (sum(abs(size(rq)-[3,1])))
    error('S�lo puede haber una posici�n para la carga y debe de ser con formato de vector columna de 3 elementos.');
elseif (size(re,1)-3)
    error('El formato de las posiciones debe ser una matriz de 3xN elementos, con cada posici�n de calculo en una columna diferente');
end

e0=8.854187817e-12;          % F/m 
k=1/4/pi/e0;
rq=repmat(rq,1,size(re,2));  % se hace que rq tenga el mismo tama�o que re
vect=re-rq;                  % vectores de distancias de rq a los re
mvect=(sum(vect.^2)).^0.5;   % m�dulos de esos vectores distancia
mvectR=repmat(mvect,3,1);    % Se repite para tener matriz del tama�o de re
% Tambi�n se podr�a haber hecho con:
%mvectR=ones(3,1)*mvect; 

E=k*q*vect./mvectR.^3;     % Campo el�ctrico en las posiciones re
V=k*q./mvect;              % Potencial el�ctrico en las posiciones re

end

