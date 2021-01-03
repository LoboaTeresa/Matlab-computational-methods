% ===================================================
% Segunda derivada de una funcion
% Pablo Garcia Gonzalez 12/agosto/2016
%
% Uso : D2F = secondder(F,dx)
% F   : array fila con los valores de la funcion f(x)
% dx  : espaciado
% D2F : array fila con los valores de f''(x)
% ===================================================
function D2F = secondder(F,dx)
n = numel(F) ; % Numero de elementos del array F
sdx = dx*dx  ; % Cuadrado del espaciado
% Segunda derivada:
for k = 2:n-1
    D2F(k) = (F(k-1)-2*F(k)+F(k+1))/sdx ;
end
D2F(1) = D2F(2) ;
D2F(n) = D2F(n-1) ;
end
