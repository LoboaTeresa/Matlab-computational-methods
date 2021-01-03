%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function Q = rk2(g,q1,T)
% Integracion de la EDO dq/dt = g(q,t) usando Euler Mod. (RK2)
% Pablo Garcia Gonzalez (Diciembre 2016)
% Inputs:
% g:  nombre de la funcion anonima g(q,t)
% q1: condicion inicial q(t1)
% T:  array fila con los tiempos
% Output:
% Q:  matriz que contiene los valores q(t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Q = rk2(g,q1,T)
D =  numel(q1) ;    % Numero de componentes de q
NT = numel(T) ;     % Numero de tiempos
Q =  zeros(D,NT) ;  % Prealocacion (es necesario)
Q(:,1) = q1 ;       % Condicion inicial
for n = 1:NT-1
    dt = T(n+1)-T(n) ;                          % Paso de tiempo
    kap1 = g(Q(:,n),T(n)) ;         
    kap2 = g(Q(:,n)+kap1.*dt,T(n+1)) ;
    Q(:,n+1) = Q(:,n)+0.5.*(kap1+kap2).*dt ;    % Calculo de q(n+1)
end
return
end
