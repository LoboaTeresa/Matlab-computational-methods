function [d]=muelleslinea(l,k,L)
% Proporciona el vector d de deformaciones de muelles en linea tensados.
%
%          d=muelleslinea(l,k,L)
%
% Entrada:
%    'l', vector fila de longitudes en reposo de los muelles 
%    'k', vector fila de constantes de fuerza de los muelles
%    'L', la longitud total de los muelles tensados
% Salida:
%    'd', vector fila de las deformaciones sufridas por cada muelle

% Ejercicio 3.10

% Construci�n autom�tica la matriz del problema 'A' y el vector 'b' 
NM=length(l);          % N�mero de muelles del problema
D=L-sum(l);            % Deformaci�n total acumulada D

% Construci�n de vector columna de t�rminos independientes
b=zeros(NM,1); b(1)=D;

% Construci�n de la matriz del sistema de ecuaciones
A=zeros(NM, NM); A(1,1:NM)=ones(1,NM);
for n=1:1:NM-1;
	A(n+1,n)=k(n);              % elementos debajo de la diagonal
	A(n+1,n+1)= -k(n+1);        % elementos en la diagonal
end

d=(A\b)';                 % Solucion sist. ec. transpuesto

end