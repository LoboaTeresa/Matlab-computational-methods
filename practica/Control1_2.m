%% Comuptaci�n I,  Control 1 (4-11-2016)
%  Ejercicio 2
clear all; % limpiamos variables
close all; % cerramos gr�ficos
home;      % limpiamos ventana de comandos

%Datos
tfin=50;     % s
v=0.5;       % m/s
d=5.0;       % m

t=[0:0.01:tfin]; % vector tiempo

%% Apartado 2.A    
% Se van a utilizar columnas para los componentes de los vectores posici�n,
% velocidad y aceleraci�n

% Posici�n objeto a
ra=[v*t; zeros(size(t))];
% Velocidad objeto 'a' mediante derivada num�rica 
% (puede hacerse diciendo que es v)
[dt,va]=derivar(t,ra);
modva=(sum(va.^2)).^0.5;  % Modulo velocidad objeto 'a'
% Aceleraci�n objeto 'a' mediante derivada num�rica
% (puede hacerse diciendo que es 0)
[ddt,aa]=derivar(dt,va);
modaa=(sum(aa.^2)).^0.5;  % Modulo aceleraci�n objeto 'a'

% Posici�n objeto 'b'
rb=[v*t-d*tanh(v*t/d); d*sech(v*t/d)];
% Velocidad objeto 'b' mediante derivada num�rica
[dt,vb]=derivar(t,rb);
modvb=(sum(vb.^2)).^0.5;  % Modulo velocidad objeto 'b'
% Aceleraci�n objeto 'b' mediante derivada num�rica
[ddt,ab]=derivar(dt,vb);
modab=(sum(ab.^2)).^0.5;  % Modulo aceleraci�n objeto 'b'

% Tambi�n se pod�a hacer calculando las componentes x,y de cada objeto
% de forma separada


%% Apartado 2.B 
% Se dibuja:

% Trayetorias
figure(21)
plot(ra(1,:),ra(2,:),'-r',rb(1,:),rb(2,:),'-b');
xlabel('Posici�n x (m)')
ylabel('Posici�n y (m)')
legend('Objeto a','Objeto b','Location','Best');
title('Trayectorias de los objetos');

% M�dulos de las velocidades
figure(22)
plot(dt,modva,'-r',dt,modvb,'-b');
axis([0 tfin 0 v*1.1]);             % Esto no es necesario para el examen
xlabel('Tiempo (s)')
ylabel('Velocidad (m/s)')
legend('|v_a|','|v_b|','Location','Best');
title('Velocidades de los objetos \bf{a} y \bf{b}');

% M�dulos de las aceleraciones
figure(23)
plot(ddt,modaa,'-r',ddt,modab,'-b');
xlabel('Tiempo (s)')
ylabel('Aceleraci�n (m/s^{2})')
legend('|a_a|','|a_b|','Location','Best');
title('Acelerciones de los objetos \bf{a} y \bf{b}');


%% Apartado 2.C
% Discancia recorrida por cada objeto
d_t=diff(t);   % Se calcula las diferencias (diferenciales) de t
da=[0,cumsum(modva.*d_t)]; % Integra el m�dulo de la velocidad en el tiempo 
db=[0,cumsum(modvb.*d_t)];

% Forma alternativa de calcularlo (integrando los diferenciales de espacio)
%da=[0,cumsum((sum((diff(ra,1,2)).^2)).^0.5)];
%db=[0,cumsum((sum((diff(rb,1,2)).^2)).^0.5)];

% Se dibuja la distancia recorrida por cada objeto
figure(25)
plot(t,da,'-b',t,db,'-r');
xlabel('Tiempo (s)')
ylabel('Distancia recorrida (m)')
title('Distancia recorrida por los objetos \bf{a} y \bf{b}');

