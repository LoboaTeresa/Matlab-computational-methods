clear all 
home
close all

m=1.9;
k=8.7;
c=0.65;
x0=-5.1;
ti=0;
tf=16;
t=[ti:0.001:tf];
%A
xt=dh0_position(m,c,k,x0,t);
%B
plot(t,xt)
%C
[dt,vt]=derivar(t,xt);%calculo la velocidad
[ddt,at]=derivar(dt,vt);%aceleración

figure(2)
plot(dt,vt)
figure(3)
plot(ddt,at)

%D
W=c.*[0,cumsum((vt.^2).*diff(t))];

figure(4)
plot(t,W)

%E
T=0.5*m*vt.^2;
U=0.5*k*vt.^2;
ET=T+U;
figure(5)
plot(dt,T,'-b',dt,U,'-g',dt,ET,'-r',t(1:10:end),W(1:10:end)+ET(1),'-k');



