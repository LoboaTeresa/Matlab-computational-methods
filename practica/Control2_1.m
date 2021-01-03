%% Comuptación I,  Control2 grupo 5114 (15-02-2017)
%  Ejercicio 1
clear all; % limpiamos variables
close all; % cerramos gráficos
home;      % limpiamos ventana de comandos

% Cargamos fichero de datos
load('C2vZ_datos.mat', 'q_fijas', 'x_fijas', 'q_p');

q1=q_fijas(1)*1e-6; % en C
q2=q_fijas(2)*1e-6;
q3=q_fijas(3)*1e-6;
x1=x_fijas(1);
x2=x_fijas(2);
x3=x_fijas(3);
qp=q_p*1e-6;        % en C

k=9e9;             % definimos 1/4*pi*epsilon0  (N*m^2/C^2)

% Definimos la función anónima de la fuerza
f_fz=@(x) k*qp*( q1*(x-x1)./(abs(x-x1)).^3 + ...
    q2*(x-x2)./(abs(x-x2)).^3 + q3*(x-x3)./(abs(x-x3)).^3 );

%% Apartado A
% Dibujamos el gráfico de la fuerza para conocer de forma aproximada donde
% van a estar los puntos de equilibrio que queremos calcular. Para poder 
% distinguirlos en el gráfico acotamos el eje 'y' de representación

d=x3-x1; 
x=[x1-2:0.0033:x3+2];
fz=f_fz(x);


figure(11)
plot(x,fz,'-r');
axis([x1-d/5 x3+d/5 -2 2]);
xlabel('posición x (m)');
ylabel('fuerza (N)');
title('Fuerza sobre sobre p_q'); 
    
%%Definimos la precisión con la que queremos buscar nuestros xeq
precision=1e-12;

% Primer punto de equilibrio
xizq=x1+0.05;
xder=x2-0.05;
yizq=f_fz(xizq);

xmed=(xizq+xder)/2;   		% Definimos punto medio 
ymed=f_fz(xmed);            % Calculamos valor de la función en xmed

%Bucle para buscar punto de f_fz(xeq)=0
while (abs(ymed) > precision)
	if (ymed*yizq > 0)
		xizq=xmed;      %Si la y(xmed)*y(xizq)>0 eso significa que xmed<xeq
	else  
		xder=xmed;	    %Si la y(xmed)*y(xizq)<0 eso significa que xmed>xeq
	end
	xmed=(xizq+xder)/2;      % Definimos el nuevo punto medio 
	ymed=f_fz(xmed);        % Recalculamos y(xmed) con la función anónima
end                                    % y vuelve a comenzar el bucle

xeq(1)=xmed;     %Posición punto de equilibrio
feq(1)=ymed;

% Segundo punto de equilibrio
xizq=x2+0.05;
xder=x3-0.05;
yizq=f_fz(xizq);

xmed=(xizq+xder)/2;   		% Definimos punto medio 
ymed=f_fz(xmed);            % Calculamos valor de la función en xmed

%Bucle para buscar punto de f_fz(xeq)=0
while (abs(ymed) > precision)
	if (ymed*yizq > 0)
		xizq=xmed;      %Si la y(xmed)*y(xizq)>0 eso significa que xmed<xeq
	else  
		xder=xmed;	    %Si la y(xmed)*y(xizq)<0 eso significa que xmed>xeq
	end
	xmed=(xizq+xder)/2;      % Definimos el nuevo punto medio 
	ymed=f_fz(xmed);        % Recalculamos y(xmed) con la función anónima
end                                    % y vuelve a comenzar el bucle

xeq(2)=xmed;          %Posición punto de equilibrio
feq(2)=ymed;

%% Apartado B
% Dibujamos la fuerza y los puntos de equilibrio
figure(11)
plot(x,fz,'-r', xeq, feq, '.g', 'MarkerSize',15);
axis([x1-d/5 x3+d/5 -2 2]);
xlabel('posición x (m)');
ylabel('fuerza (N)');
title('Fuerza sobre sobre p_q');
legend('fuerza','pt. equilibrio')

 