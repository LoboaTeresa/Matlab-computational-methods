% ==================================================
% function simpsonf()
% Integral por el metodo de Simpson de una funcion f
% Pablo Garcia Gonzalez 7/septiembre/2016
%
% Uso: res = simpsonf(func,a,b,N)
% func : nombre de la funcion *anonima*
% a    : limite inferior
% b    : limite superior
% N    : numero de puntos
% ===================================================
function res = simpsonf(func,a,b,N)
N = N + 1 - mod(N,2) ; % Nos aseguramos que N es impar
X = linspace(a,b,N)  ; % Mallado x
dx = X(2)-X(1)       ; % Paso de integración 
F = func(X)          ; % Array con los valores de la funcion
res = F(1)+F(N)+4*sum(F(2:2:N-1))+2*sum(F(3:2:N-2)) ;
res = res*dx/3 ;
return