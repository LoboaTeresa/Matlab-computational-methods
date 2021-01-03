function [a]=FRelatividad(F,v,m)
% Dado un objeto de masa m, una fuerza F que actua sobre �l y la velocidad 
% v a la que se mueve el objeto, calcula la aceleraci�n a que experimenta  
% el objeto F=gamma�m�a + gamma^3�m/c^2(v�a)�v
%
%       [a]=FRelatividad(F,v,m)
% 
% Entradas:
%    'F' vector columna, componentes de la Fuerza (N);      tama�o 3xN
%    'v' vector columna, componentes de la velociada (m/s); tama�o 3x1
%    'm' escalar, la masa del objeto (kg)
%
% Salidas:
%    'a'  vector columna, componentes de la aceleraci�n (m/s^2); tama�o 3xN 
%

% Ejercicio 3.9. Soluci�n P. Garc�a-Mochales

if (size(F,1)~=3)
    error('Error en el vector fuerza. Debe ser una matriz 3xN.');
else if ~prod(double(size(v)==[3,1]))
    error('Error en el vector velocidad. Debe ser un vector 3x1.');
end

c=2.99792458e8; % velocidad de la luz
C1=c^2-sum(v.^2);
if C1<=0
    error('La velocidad debe ser menor que la velocidad de la luz.');
end
gamma=c/C1.^0.5;

% Matriz de coeficientes del sistema de ecuaciones
A=(eye(3)+v*v'/C1)*gamma*m;
% Se resuelve el sistema de ecuaciones
a=A\F;

end
            