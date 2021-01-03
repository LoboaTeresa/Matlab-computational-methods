% ================================================
% function cuaspace()
% Construccion de un mallado cuadratico
% Pablo Garcia Gonzalez (Octubre 2016)
%
% Uso: Xcua = cuaspace(xin,xfin,N)
% Xcua: vector fila con los N valores X(n) (n=1:N)
% N: numero de elementos de Xcua
% xin: X(1)
% xfin: X(N)
% ================================================

function Xcua = cuaspace(xin,xfin,N)
% Chequeo de N:
N = floor(abs(N)) ; % Por si en el input N no es natural
if N <= 1
    N = 101 ;
end
% Calculo de dx:
dx = 2.*(xfin-xin)/(N.*(N-1)) ;
Xcua = zeros(1,N) ; % No es necesario, pero ayuda a Matlab
Xcua(1) = xin ;
% Calculo de los X(k)
for k=1:N-1
    Xcua(k+1) = Xcua(k) + k*dx ;
end
return % No es necesario, pero buena costumbre
end
