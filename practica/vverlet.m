%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [R,V] = vverlet(ac,rin,vin,T)
% Solucion de la EDO d2(r)/dt2 = a(r,v,t) por velocity Verlet
% Inputs:
% ac:  nombre de la funcion anonima a(r,v,t)
% rin: posicion en T(1)
% vin: velocidad en T(1)
% T: array de tiempos de longitud NT
% Outputs:
% R: matriz DxNT con las posiciones
% V: matriz DxNT con las velocidades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R,V] = vverlet(ac,rin,vin,T)
D = numel(rin) ;            % Numero de grados de libertad
NT = numel(T) ;             % Numero de tiempos
R = zeros(D,NT) ;           % Prealocacion
V = zeros(D,NT) ;           % Prealocacion
A = zeros(D,NT) ;           % Prealocacion
R(:,1) = rin ;              % Posicion en T(1)
V(:,1) = vin ;              % Velocidad en T(1)
A(:,1) = ac(rin,vin,T(1)) ; % Aceleracion en T(1)
for n = 1:NT-1
    dt = T(n+1)-T(n) ;                            % Paso de tiempo
    hdt = dt./2 ;                                 % dt/2
    R(:,n+1) = R(:,n)+(V(:,n)+A(:,n).*hdt).*dt ;  % Posicion en T(n+1)
    Aap = ac(R(:,n+1),V(:,n)+A(:,n).*dt,T(n+1)) ; % Primera aproximacion a A(n+1)
    V(:,n+1) = V(:,n) + (A(:,n)+Aap).*hdt ;       % Velocidad en T(n+1)
    A(:,n+1) = ac(R(:,n+1),V(:,n+1),T(n+1)) ;     % Aceleracion en T(n+1)
end
return
end
