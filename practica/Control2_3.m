%% Comuptaci�n I,  Control 2 grupo 5114 (15-02-2017)
%  Ejercicio 3
clear all; % limpiamos variables
close all; % cerramos gr�ficos
home;      % limpiamos ventana de comandos

%% Apartado A
% Como el primer dado no esta trucado, podemos generar el resultado de sus 
% tiradas con la funci�n randi para generar n�meros enteros entre 1 y 4, a 
% la que quitamos 1.
u=randi(4,1,1e6)-1;

% Para el segundo dado hay que calcular el valor de la constante de
% normalizaci�n alfa para que las probabilidades sumen 1:
% 1=alfa*(2^0+2^1+2^2+2^3)  => alfa=1/(2^0+2^1+2^2+2^3).
alfa=1/sum(2.^[0:3]);
% la probabilidad de cada evento ser�
pd=alfa*(2.^[0:3]);
% y las probailidades acumuladas que se necesitan para generar los eventos
pda=cumsum(pd);
% Generamos n�meros aleatorios entre 0 y 1 con distribuci�n uniforme
a=rand(1,1e6);
% y a partir de ellos generamos los n�meros aleatorios del segundo dado
d=0+(a>pda(1))+(a>pda(2))+(a>pda(3));

% Habiendo generado los resultados de los lanzamientos de los dos dados,
% ahora calculamos su producto
m=u.*d;

% Calculamos el histograma de resultados [que solo puedn ir entre 0 y 9]
[pm,px]=hist(m,[0:1:9]);
% Lo normalizamos entre el n�mero de muestras para transformarlo en los 
% valores de probailidad que se piden
pm=pm/1e6;


%% Apartado B
% Representamos con un gr�fico de barras los resultados del histograma
% obtenido
figure(31)
bar(px,pm);
xlabel('m=u�d');
ylabel('Probabilidad de m');


%% Apartado C
% La mediana de la muestra es el valor que marca la mitad de los valores
% obtenidos son mayores o iguales que el (y que la mitad de los valores son
% menores o iguales a �l). Por tanto es el valor m_g que hace que sacar un
% valor m>mg tenga una probabilidad mayor o igual al 50%  
mg=median(m);
disp(' La mediana determina que el 50% de la muestra es mayor que ella.')
disp(' La mediana de la muestra es el valor mg buscado.')
disp(['   La mediana mg es ', num2str(mg), '.']);