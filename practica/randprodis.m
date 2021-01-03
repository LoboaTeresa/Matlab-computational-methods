% ============================================================
% function Xm = randprodis(Nm,Pr,Xr)
% Generacion de un array Xm de Nm numeros aleatorios
% Construidos a partir de la funcion de probabilidad Pr
% Inputs:
% Nm: Tamagno del array de numeros aleatorios
% Pr: array de Nr elementos con la funcion de probabilidad
% Xr: array de Nr elementos con los valores de la var. aleat.
% Output: 
% Xm: array de Nm elementos con los valores aleatorios
% ============================================================
function Xm = randprodis(Nm,Pr,Xr)
Nr = numel(Pr) ;
Xunif = rand(1,Nm) ; % Array con valores aleatorios uniformes en [0,1)

% Primer caso: Pr = constante
if min(Pr) == max(Pr)
   Nindex = ceil(Nr.*Xunif) ; % Array de indices aleatorios
   Xm = Xr(Nindex) ;          % Array valores (indexacion Matlab)
   return
end

% Segundo caso: Pr variable
Fr = [0,cumsum(Pr)] ; % Array con la funcion de probabilidad acumulada
Xm = zeros(1,Nm) ;    % Prealocacion
for k = 1:Nm
    cotinf = 0.d0 ;       % Vamos buscando el valor de F(j)
    j = 0 ;               % que es mas grande que Xunif
    while cotinf <= Xunif(k)
      j = j + 1 ;
      cotinf = Fr(j) ;
    end
    Xm(k) = Xr(j-1) ;     % Asignacion
end
return
end