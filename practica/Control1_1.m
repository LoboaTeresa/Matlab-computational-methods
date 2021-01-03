%% Comuptación I,  Control 1 (4-11-2016)
%  Ejercicio 1
clear all; % limpiamos variables
close all; % cerramos gráficos
home;      % limpiamos ventana de comandos


%% Apartado 1.A
Aux1=[1:100];

Aux2=Aux1'*ones(size(Aux1)); % repite el vector Aux1 en columnas
Aux3=Aux2';                  % repite el vector Aux1 en filas

%Una forma alternativa de calularlo
% [Aux3,Aux2]=meshgrid(Aux1);

%Otra forma alternativa
% Aux3=repmat(Aux1,lenght(Aux1),1);
% Aux2=Aux3';

A=floor(Aux3./Aux2);  % Se crea A
B=ceil(Aux2./Aux3);   % Se crea B

%Forma alternativa de cálcular A y B (muy ineficiente)
% for i=1:100
%     for j=1:100
%         A(i,j)=floor(j/i);
%         B(i,j)=ceil(i/j);
%     end
% end
        

%% Apartado 1.B
Aux4=B-A;
C=Aux4(3:3:end,3:3:end); % Contamos los elementos de 3 en 3

%También podía ser
% C=B(3:3:end,3:3:end)-A(3:3:end,3:3:end);

%Forma alternativa de calculo (muy ineficiente)
% for i=1:floor(100/3)
%     for j=1:floor(100/3)
%         C(i,j)=B(3i,3j)-A(3i,3j);
%     end
% end
        

%% Apartado 1.C:
D=diag(C(:,end:-1:1));   % Cálculo de la diagonal

%Forma alternativa de calculo (muy ineficiente)
% for i=1:floor(100/3)
%     D(i)=C(i,end+1-i);   
% end
% 

SDiagSecC=sum(D);    % Suma de los elementos de la diagonal
disp(['La suma de la diagonal secundaria de C da ', num2str(SDiagSecC),'.']);


%% Apartado 1.D:
SPositivoC=sum(sum(C.*(C>0)));  % Suma elementos positivos de C
disp(['La suma de los elementos positivos de C da ', num2str(SPositivoC),'.']);

Aux4=(rem(C,13)==0 & C~=0);     % Decie donde hay multiplos de 13 no nulos
PMultiplo13C=prod(prod(C.*Aux4+(~Aux4))); % Calculo del producto
% Si no estuviese "+(~Aux4)" multiplicaría por los 0 correspondientes a los
% elementos no multiplos de 13 y todo el producto daría 0. Por eso luego
% hay que introducir una salvedad a la hora de sacar los resultados: 
% Si PMultiplo13C=1 implica que (~Aux4) es una matriz llena de 1 y 
% por tanto no hay ningún elemento múltiplo de 13.

%Forma alternativa de cálculo (muy ineficiente)
% SPositivoC=0;
% PMultiplo3C=1;
% for i=1:floor(100/3)
%     for j=1:floor(100/3)
%         if C(i,j)>0;
%             SPositivoC=SPositivoC+C(i,j);
%         end
%         if rem(C(i,j),13)==0 && C(i,j)~=0
%             PMultiplo13C=PMultiplo13C*C(i,j);
%         end
%     end
% end

if PMultiplo13C==1
    disp(['El poducto de los elementos de C multiplos de 13 da 0 (no hay multiplos de 13).']);
else
    disp(['El poducto de los elementos de C multiplos de 13 da ', num2str(PMultiplo13C),'.']);
end
    
