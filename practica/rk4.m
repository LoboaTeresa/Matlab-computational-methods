%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function Q = rk4(g,q1,T)
% Integracion de la EDO dq/dt = g(q,t) usando RK4
% Pablo Garcia Gonzalez (Diciembre 2016)
% Inputs:
% g:  nombre de la funcion anonima g(q,t)
% q1: condicion inicial q(t1)
% T:  array fila con los tiempos
% Output:
% Q:  matriz que contiene los valores q(t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Q = rk4(g,q1,T)
D =  numel(q1) ;    % Numero de componentes de q
NT = numel(T) ;     % Numero de tiempos
Q =  zeros(D,NT) ;  % Prealocacion (es necesario)
Q(:,1) = q1 ;       % Condicion inicial
for n = 1:NT-1
    dt = T(n+1)-T(n) ;
    hdt = dt./2 ;
    tha = T(n) + hdt ;     
    kap1 = g(Q(:,n),T(n)) ;
    kap2 = g(Q(:,n)+kap1.*hdt,tha) ;
    kap3 = g(Q(:,n)+kap2.*hdt,tha) ;
    kap4 = g(Q(:,n)+kap3.*dt ,T(n+1)) ;
    Q(:,n+1) = Q(:,n) + (kap1+2.*(kap2+kap3)+kap4).*dt./6 ;
end
return
end
