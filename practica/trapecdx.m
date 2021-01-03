% ==============================================
% function trapecdx()
% Primitiva de una funcion f(x) usando trapecios
% Pablo Garcia Gonzalez 12/agosto/2016
%
% Uso PF = trapecdx(F,dx)
% F : array con los valores de f(x)
% dx : espaciado
% PF : funcion primitiva Pf(x)
% ===============================================
function PF = trapecdx(F,dx)
n = numel(F) ; % Numero de elementos del array
hdx = 0.5*dx ;  % dx/2
PF(1) = 0  ;  % Iniciamos
for k=2:n
    PF(k) = PF(k-1) + (F(k-1)+F(k))*hdx ;
end
return