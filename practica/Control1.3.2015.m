clear all 
home
close all

load('Datos4_2.mat');
k=9e9;
V=MatrizDatos(:,3);
x=MatrizDatos(:,1);
y=MatrizDatos(:,2);
posq=[1,0;0,1;-1,0;0,-1];
xq=posq(:,1);
yq=posq(:,2);
[X,XQ]=meshgrid(x,xq);
[Y,YQ]=meshgrid(y,yq);
A=k*(((X-XQ).^2)+((Y-YQ).^2)).^(-1/2);
Q=A\V