%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [R,V] = runge4(ac,rin,vin,T)
% Solucion de la EDO d2(r)/dt2 = a(r,v,t) usando RK4
% Usa la funcion de script rk4.m
% Inputs:
% ac: nombre de la funcion anonima a(r,v,t)
% rin: posicion en T(1)
% vin: velocidad en T(1)
% T: array de tiempos de longitud NT
% Outputs:
% R: matriz DxNT con las posiciones
% V: matriz DxNT con las velocidades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [R,V] = runge4(ac,rin,vin,T)
D = numel(rin) ;    % Numero de grados de libertad
D1 = D+1 ;          % D+1
DD = 2.*D ;         % Numero de componentes del vector de estado
qin = [rin;vin] ;   % Vector de estado en T(1)
g =@(q,t) [q(D1:DD) ; ac(q(1:D),q(D1:DD),t)] ; % Funcion anonima para RK4
Q = rk4(g,qin,T) ;  % Obtencion de q(t) usando RK4
R = Q(1:D,:) ;      % Almacenamiento de R
V = Q(D1:DD,:) ;    % Almacenamiento de V
return
end