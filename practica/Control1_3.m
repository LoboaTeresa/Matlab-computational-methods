%% Comuptaci�n I,  Control 1 (4-11-2016)
%  Ejercicio 3
clear all; % limpiamos variables
close all; % cerramos gr�ficos
home;      % limpiamos ventana de comandos

% Datos
q=1e-9;             % C
rq=[-2.5;3.0;-1.0]; % m
xi=-3.5;            % m
xf=-2.0;            % m


%% Apartado 3.B
xe=linspace(xi,xf,1000);       % Componentes 'x' del segmento
re=[xe;zeros(2,1000)];         % Segmento como sucesi�n de puntos 
[E,V]=CampoPotencial(q,rq,re); % C�lculo de E y V usando la funci�n creada
modE=(sum(E.^2)).^0.5;         % M�dulo del Campo el�ctrico

% Si la funci�n 'CampoPotencial' creada s�lo puede calcular una posici�n 
% 're' cada vez, entonces habr�a que hacer un bucle:
%xe=linspace(xi,xf,1000);
%for i=1:1000
%    [Ea,Va]=CampoPotencial(q,rq,[xe(i);0;0]);
%    E(:,i)=Ea;
%    modE(i)=(sum(Ea.^2)).^0.5;
%    V(i)=Va;
%end

%% Apartado 3.C
% Se dibuja las componentes y el m�dulo del campo el�ctrico
figure(31)
plot(xe,E(1,:),'-b',xe,E(2,:),'-r',xe,E(3,:),'-g',xe,modE,'-k');
xlabel('Posici�n x (m)')
ylabel('Campo el�ctrico (V/m)')
legend('E_x','E_y','E_z','|E|','Location','Best');
title('Campo el�ctrico a lo largo del vector ([-3.5,-2.0], 0, 0)');

% Se dibuja el potencial el�ctrico
figure(32)
plot(xe,V,'-c');
xlabel('Posici�n x (m)')
ylabel('Potencial el�ctrico (V)')
title('Potencial el�ctrico a lo largo del vector ([-3.5,-2.0], 0, 0)');

