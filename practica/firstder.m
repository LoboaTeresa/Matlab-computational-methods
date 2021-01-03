% ===================================================
% Primera derivada de una funcion
% Pablo Garcia Gonzalez 12/agosto/2016
%
% Uso : DF = firstder(F,dx)
% F   : array fila con los valores de la funcion f(x)
% dx  : espaciado
% DF  : array fila con los valores de f'(x)
% ===================================================
function DF = firstder(F,dx)
n = numel(F) ; % Numero de elementos del array F
tdx = 2*dx   ; % Doble del espaciado
% Primera derivada:
for k = 2:n-1
    DF(k) = (F(k+1)-F(k-1))/tdx ;
end
DF(1) = (4*F(2)-F(3)-3*F(1))/tdx ;
DF(n) = (3*F(n)-4*F(n-1)+F(n-2))/tdx ;
end
