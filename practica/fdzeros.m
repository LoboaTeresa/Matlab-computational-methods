%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function Z = fdzeros(F,X)
% Pablo Garcia Gonzalez (Octubre 2016)
% Calculo de los ceros de la funcion f(x).
% Inputs:
% X : Array de longitud Nx con los valores de x
% F : Array de longitud Nx con los valores de f(x)
% Output:
% Z : array fila con los ceros de f(x) en el intervalo [X(1),X(N)]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Z = fdzeros(F,X)
Nx = numel(X) ; % Numero de puntos
S = sign(F) ;   % Array con los valores de sign(F)
Z = [] ;        % Inicialmente, Z es la matriz vacia
numz = 0 ;      % Este sera un indice para los ceros
% Es X(1) un cero?
if S(1) == 0
   numz = numz+1 ;
   Z(numz) = X(1) ;
end
% Resto de los elementos:
for n = 2:Nx
    if S(n) == 0
       numz = numz+1 ; 
       Z(numz) = X(n) ;
    elseif S(n-1)*S(n) == -1
       numz = numz+1 ;
       Z(numz) = X(n-1)-(X(n)-X(n-1)).*F(n-1)./(F(n)-F(n-1)); % Cero en (X(n-1),X(n))
    end
end
return
end