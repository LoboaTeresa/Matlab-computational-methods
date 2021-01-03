function [eli, f1, f2]  =  FPintarElipse(a,b)
% Calcula los puntos de una elipse de semiejes a y b
%
%       [x,y]=elipse(a,b)
%
% Ecuacion elipse:    (x/a)�+(y/b)�=1
% Entradas:
%    'a' semieje horizontal
%    'b' semieje vertical
% Salidas:
%    'eli' matriz con las posiciones [x;y] de la elipse; tama�o 2x401
%    'f1'  vector [xf1;yf1] con la posici�n del foco 1 de la elipse
%    'f2'  vector [xf2;yf2] con la posici�n del foco 2 de la elipse
%

% Ejercicio 2.8

theta=2*pi*[0:0.0025:1];
eli=[a*cos(theta); b*sin(theta)];

% Calculamos las posiciones de los focos teniendo en cuenta el tama�o
% relativo de los semiejes 
if (a>=b)
    f1=[sqrt(a.^2-b.^2);0];
else
    f1=[0;sqrt(b.^2-a.^2)];  
end
f2=-f1;
fo=[f1,f2];

% Se definen los limites de visualizaci�n: tama�o de la elipse + margen
margenX=1.1*a;
margenY=1.1*b;
limites=[-margenX, margenX, -margenY, margenY];

figure(1);                   % Pintamos la elipse en verde
plot(eli(1,:),eli(2,:),'g',fo(1,:),fo(2,:),'.r'); % y los focos en rojo
axis(limites);       % ponemos los limites de los ejes
axis equal           % hace que escalas vertical y horizontal sean iguales
xlabel('eje x');     % ponemos los titulos del gr�fico
ylabel('eje y');
frase=['Elipse de ejes a=', num2str(a), ' y b=', num2str(b)];
title(frase);
legend('elipse', 'focos', 'Location', 'Best');
end