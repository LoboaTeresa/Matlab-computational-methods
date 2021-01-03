%% Comuptación I,  Control 2 grupo 5114 (15-02-2017)
%  Ejercicio 2

clear all; % limpiamos variables
close all; % cerramos gráficos
home;      % limpiamos ventana de comandos

% Carga de datos iniciales
load('C2vZ_datos.mat', 'Cap', 'Ind', 'Per', 'V_0', 't_f');
C=Cap*1e-3;
L=Ind;
T=Per;
V0=V_0;
tf=t_f;

% funciones anónimas que voy a usar: potencial de la fuente V_B (que sólo 
% depende del tiempo), potencial en el condensador (que sólo depende de la
% carga) y potencial en la bobina que sólo depende de la 2ª derivada de la
% carga.
potVB=@(t) V0*(-1).^(floor(2*t/T));
potC=@(q) q/C;
potL=@(ddq) ddq*L;

%% Apartado A
%

% Datos iniciales: carga inicial, intensidad inicial
q0=0;   
i0=0;

% inicialización de incremento de tiempo usado, la variable tiempo y 
% el número de pasos a dar
dt=T/500;
dt2=dt^2;
tiempo=[0:dt:tf];
npasos=length(tiempo);
% Tambien inicializo el potencial de la fuente VB, ya que sólo depende del
% tiempo
VB=potVB(tiempo);

% Defino el tamaño que van a tener las variables carga, 1ª y 2ª derivada
% de carga (y las relleno de cero). [Como voy a utilizar método de Verlet 
% no voy a necesitar en el cálculo la intesidad (derivada de la carga);  
% sólo para el cálculo del primer paso, pero ese es el valor i0.]
q=zeros(1,npasos);
dq=q;
ddq=q;

% Cantidades
q(1)=q0;
ddq(1)= ( VB(1) -potC(q(1)) )/L;

% Calculamos el primer paso del Verlet, que necesitamos antes de poder
% empezar el bucle, mediante un Euler:
q(2)=q(1)+i0*dt+0.5*ddq(1)*dt2;
ddq(2)= ( VB(2) -potC(q(2)) )/L;

% Bucle para integrar ec movimiento por el método de Verlet
for i=3:npasos  
    q(i)=2*q(i-1)-q(i-2)+dt2*ddq(i-1);           % carga en paso i
    ddq(i)=( VB(i) -potC(q(i)) )/L;    % 2º der. carga en paso i
end   % Fin bucle método de Verlet


% Esto no se pide
%figure(21)
%plot(tiempo,q, '-g')
%xlabel ('tiempo (s)');
%ylabel('Carga (C)');
%title('Carga en el condensador C');

%% Apartado B
% Ahora se calcula la intensidad (derivada de la carga) 
dq(1)=i0;                                          % punto inicial
dq(2:npasos-1)=(q(3:npasos)-q(1:npasos-2))/(2*dt); % puntos intermedios
dq(npasos)=dq(npasos-1)+ddq(npasos-1)*dt;          % punto final 

% Y se dibuja
figure(22)
plot(tiempo,dq,'-m')
xlabel ('tiempo (s)');
ylabel('Intensidad (A)');
title('Intensidad que pasa por el circuito LC');


%% Apartado C
% Voltaje de la fuente ya está calculado
% Voltaje del condensador
VC=potC(q);
% Voltaje de la bobina
VL=potL(ddq);
% Voltaje del circuito: no se pedía pero ayuda a ver si el resultado es 
% correcto ya que debe ser cero en todo momento
Vtotal=VC+VL-VB; 

% Dibujamos los resultados
figure(23)
plot(tiempo,VB,tiempo,VC,tiempo,VL,tiempo,Vtotal,'-c');
xlabel ('tiempo (s)');
ylabel('Voltaje (V)');
title('Voltaje de los diferentes elementos del circuito');
legend('voltaje V_B','voltaje en C', 'voltaje en L','voltaje circuito');




