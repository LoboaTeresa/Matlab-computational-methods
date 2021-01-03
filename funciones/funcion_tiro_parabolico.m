function [xmax, ymax, tmax]=FTiroParabolico(angg,V0)
%Funci�n que devuelve distancia m�xima, altura m�xima y tiempo de vuelo
%de un tiro parabolico lanzado con angulo angg y velocidad inicial V0
%
%       [xmax,ymax,tmax]=FTiroParabolico(angg,V0)
%
%Entrada:
%   angg    �ngulo de lanzamiento (grados) [puede ser vector]
%   V0      vel. inicial (m/s) [puede ser vector con varias velocidades]
%Salidas:      Todas las salidas son formato 'matriz': 
%           cada columnas corresponde a un angulo de diferente de angg
%           cada fila corresponde a una velocidad inicial diferente de V0
%   xmax    distancia m�xima (m)    
%   ymax    altura m�xima (m)
%   tmax    tiempo m�ximo de vuelo (s)

% Ejercicio 2.1

Ig=1/9.8;           % inverso aceleracion gravedad absoluta ((s^2)/m)
angr=angg*pi/180;   % �ngulo de lanzamiento (radianes)
c=cos(angr);        % coseno angulo lanzamiento
s=sin(angr);        % coseno angulo lanzamiento
tmax=2*Ig*V0'*s;               % tiempo m�ximo de vuelo (s)
xmax=2*Ig*(V0.^2)'*(s.*c);     % distancia m�xima (m)
ymax=Ig/2*(V0.^2)'*(s.^2);     % altura m�xima (m)
end
