function PF = integra(F,X)
% ==============================================
% function integra()
% Primitiva de una funcion f(x) usando trapecios
% El mallado X no tiene porque ser equiespaciado
% Pablo Garcia Gonzalez 12/agosto/2016
%
% Uso PF = integra(F,X)
% F : array con los valores de f(x)
% X : array con los valores de x
% PF : funcion primitiva Pf(x)
% ===============================================

N = numel(X) ;    % Numero de elementos del array
PF = zeros(1,N) ; % No es necesario, pero ayuda a Matlab
PF(1) = 0  ;      % Iniciamos
for k=2:N
    PF(k) = PF(k-1) + 0.5*(X(k)-X(k-1))*(F(k-1)+F(k)) ;
end
return
end