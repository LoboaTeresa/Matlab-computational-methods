% ===================================================
% Primera y segunda derivada de una funcion
% Pablo Garcia Gonzalez 12/agosto/2016
%
% Uso : [D1F,2DF] = derivasdx(F,dx)
% F   : array fila con los valores de la funcion f(x)
% dx  : espaciado
% D1F : array fila con los valores de f'(x)
% D2F : array fila con los valores de f''(x)
% ===================================================
function [D1F,D2F] = derivasdx(F,dx)
n = numel(F) ; % Numero de elementos del array F
tdx = 2*dx   ; % Doble del espaciado
sdx = dx*dx  ; % Cuadrado del espaciado
% Primera derivada:
for k = 2:n-1
    D1F(k) = (F(k+1)-F(k-1))/tdx ;
end
D1F(1) = (4*F(2)-F(3)-3*F(1))/tdx ;
D1F(n) = (3*F(n)-4*F(n-1)+F(n-2))/tdx ;
% Segunda derivada:
for k = 2:n-1
    D2F(k) = (F(k-1)-2*F(k)+F(k+1))/sdx ;
end
D2F(1) = D2F(2) ;
D2F(n) = D2F(n-1) ;
end
