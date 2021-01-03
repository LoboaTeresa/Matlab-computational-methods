function [V,XM,YM,ZM]=Potencial3D(Q,pQ,xr,yr,zr)
% Funci�n que devuelve el Potencial de Coulomb de las cargas Q que se 
% encuentrasn en las posiciones definidas en el vector pQ. 
% Las posiciones del espacio donde se evalua el potencial est�n definidas
% por los vectores (xr, yr, zr) que contienen respectivamente las
% coordenadas (x,y,z) del enrejado donde se quiere el c�lculo. 
%
%   [V,XM,YM,ZM]=Potencial(Q,pQ,xr,yr,zr))
%
% La funci�n devuelve el potencial calculado y las matrices de coordenadas.
%
%Entrada:
%   Q       Valores de las cargas (en coulombios); vector tama�o N
%   pQ      Posicioned de las cargas (en m); matriz tama�o 3xN
%   xr      vector coordenadas x de calculo de potencial (en m), tama�o J
%   yr      vector coordenadas y de calculo de potencial (en m), tama�o K
%   zr      vector coordenadas z de calculo de potencial (en m), tama�o L
%
%Salidas:      
%   V       Potencial electrico creado por la carga (Voltios);
%           Matriz tama�o (J x K x L) que recorre las posiciones  
%           definidas por las entradas (xr, yr, zr).
%   XM      Matrices de posiciones, componentes x; tama�o J x K x L.
%   YM      Matrices de posiciones, componentes y; tama�o J x K x L.
%   ZM      Matrices de posiciones, componentes z; tama�o J x K x L.
%

% Ejercicios 2.15 y 2.16

nq=length(Q);
tpq=size(pQ);
if tpq(1)-3
    error('Posiciones cargas deben ser vectores columnas de 3 dimensiones');    
elseif length(Q)-tpq(2)
    error('n�mero de cargas y n�mero de posiciones de cargas difieren');
end

% Regi�n donde se calcula el potencial
[XM,YM,ZM]=meshgrid(xr,yr,zr);

% Calculo potencial de forma acumulativa
V=Q(1).*((XM-pQ(1,1)).^2+(YM-pQ(2,1)).^2+(ZM-pQ(3,1)).^2).^(-0.5);
for i=2:nq
    V=V+Q(i).*((XM-pQ(1,i)).^2+(YM-pQ(2,i)).^2+(ZM-pQ(3,i)).^2).^(-0.5);
end
V=V*9e9;;  % Multiplico por constante de Coulomb (9e9 N*m^2/C^2)
end