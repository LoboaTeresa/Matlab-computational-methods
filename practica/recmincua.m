% ==========================================================
% function [a,b,erra,errb,ccp] = recmincua(X,Y)
% Pablo Garcia Gonzalez (octubre 2016)
% Ajuste de Y vs X mediante una recta por minimos cuadrados
% Ha de cumplirse que numel(X) = numel(Y) > 2
% a : pendiente             , erra : error en a
% b : ordenada en el origen , errb : error en b
% ccp : coeficiente de correlacion (en el intervalo [-1,1])
% ==========================================================
function [a,b,erra,errb,ccp] = recmincua(X,Y)
% Tamagno de la muestra y test:
N = numel(X) ;
if numel(Y) ~= N || N <= 2
   return
end
% Valores medios:
mX  = sum(X)/N  ; 
mY  = sum(Y)/N  ;
mX2 = sum(X.*X)/N ; 
mY2 = sum(Y.*Y)/N ;
mXY = sum(X.*Y)/N ;
% Varianzas (normalizacion N):
s2X = mX2-mX*mX ; 
s2Y = mY2-mY*mY ;
% Coeficiente de correlacion:
ccp = (mXY-mX*mY)/sqrt(s2X*s2Y) ;
% Resultados:
PH = [1 , -mX ; -mX , mX2 ]./s2X ; % Matriz
Av = PH*[mXY ; mY] ; % Vector con a y b
a = Av(1) ; b = Av(2) ;
chi2 = sum((Y-a.*X-b).^2)/(N*(N-2)) ; % Funcion chi-cuadrado entre N(N-2)
Ev = sqrt(diag(PH).*chi2) ; % Vector con erra y errb
erra = Ev(1) ; errb = Ev(2) ;
return
end