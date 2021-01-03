% ====================================================================
% function [afit,aerr,gfit,chi2] = linfitting(X,Y,phifit)
% Ajuste lineal (caso general)
% Pablo Garcia Gonzalez (Octubre 2016)
% Ha de cumplirse que numel(X) = numel(Y) > 2
% Inputs:
% X: array fila con los valores de la variable independiente
% Y: array fila con los valores de la variable dependiente
% phifit: funcion anonima tal que a cada x le hace corresponder
%         el vector M-columna [phi1(x);phi2(x);...;phiM(x)]
% Outputs
% afit: array M-fila con los parametros optimos de ajuste
% aerr: array M-fila con los errores de los parametros de ajuste
% gfit: funcion anonima igual a la funcion de ajuste optima
% chi2: funcion chi2 tras el ajuste
% ====================================================================

function [afit,aerr,gfit,chi2] = linfitting(X,Y,phifit)
% Test previo:
N = numel(X) ; % Tamagno muestra
if numel(Y) ~= N || N <= 2
    return
end
% Matrices y arrays previos:
PHI = phifit(X)   ;         % Matriz PHI (MxN)
PHIT = PHI'       ;         % Traspuesta de PHI (NxM)
PHPH = PHI*PHIT   ;         % Producto PHI*PHIT (MxM)
IPHP = inv(PHPH)  ;         % Inversa de PHP (MxM) 
vdum(1,:) = diag(IPHP) ;    % Diagonal de IPHP en vdum (1xM)
YPHT = Y*PHIT     ;         % Y*PHIT (1xM)
M = numel(vdum)   ;         % Numero de parametros
% Calculos:
afit = YPHT*IPHP   ;        % Array a (1xM)
gfit =@(x) afit*phifit(x) ; % Funcion de ajuste
bfil = Y-afit*PHI  ;        % Array 1xN para el calculo de chi2
chi2 = bfil*bfil'  ;        % Funcion chi2
aerr(1,:) = sqrt(chi2.*vdum./(N-M)) ; % Error (1xM)
return
end