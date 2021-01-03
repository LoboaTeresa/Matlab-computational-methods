%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [R,V] = runge2(ac,rin,vin,T)
% Solucion de la EDO d2(r)/dt2 = a(r,v,t) usando RK2
% Usa la funcion de script rk2.m
% Inputs:
% ac: nombre de la funcion anonima a(r,v,t)
% rin: posicion en T(1)
% vin: velocidad en T(1)
% T: array de tiempos de longitud NT
% Outputs:
% R: matriz DxNT con las posiciones
% V: matriz DxNT con las velocidades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R,V] = runge2(ac,rin,vin,T)
D = numel(rin) ;    % Numero de grados de libertad
D1 = D+1 ;          % D+1
DD = 2.*D ;         % Numero de componentes del vector de estado
qin = [rin;vin] ;   % Vector de estado en T(1)
g =@(q,t) [q(D1:DD) ; ac(q(1:D),q(D1:DD),t)] ; % Funcion anonima para RK2
Q = rk2(g,qin,T) ;  % Obtencion de q(t) usando RK2
R = Q(1:D,:) ;      % Almacenamiento de R
V = Q(D1:DD,:) ;    % Almacenamiento de V
return
end