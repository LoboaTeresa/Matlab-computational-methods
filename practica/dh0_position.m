function [xt]=dh0_position(m,c,k,x0,t)

%Función para el control1 ejercicio 1A de  2015
% Find the position of a damped harmonic oscillator spring with zero
% initial velocity:
%   x = x0*w0/w * exp(-g*t) * cos(w*t-phi)
% with
%   w0 = sqrt(k/m)
%   w = w0*sqrt(1-z^2)
%   z = c/2/sqrt(m*k)
%   g = c/2/m
%   phi = acos(sqrt(1-z^2))
% Input:
%   m   : mass (kg)
%   c   : damping constant (kg/s)
%   k   : spring constant (N/m)
%   x0  : initial position (m)
%   t   : time (s)
w=sqrt(k/m);
gamma=c/(2*m);
gus=c/(2*sqrt(m*k));
phi=acos(sqrt(1-gus.^2)); %rad


xt=x0*exp(-gamma.*t).*cos((sqrt(1-gus.^2)).*w.*t-phi)./(sqrt(1-gus.^2));

end
