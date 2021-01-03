clear all 
home
close all

theta0=1.5;
L=1;
M=0.1;
mu0=0.025;
H=0.6;
g = 9.80;       % gravitational acceleration (m/s^2)
dt = 0.05;      % integration time step (s)
dt2=dt.^2;
tmax = 10;      % total integration time (s)
s0 = L*theta0;  % initial tangential position (m)
v0 = 0;         % initial velocity

alfa=90-asin(H/L);
Sl=L*alfa;

a=@(x)-g/L*sin(x)+mu0/M*(abs(x)<=alfa); %x=angulo, y=posición

ang(1)=theta0;
ac(1)=a(ang(1));
recorrido(1)=0;
t(1)=0;

ang(2)=ang(1)+v0*dt+0.5*dt2*ac(1);
ac(2)=a(ang(2));
recorrido(2)=abs(ang(1)-ang(2));
t(2)=dt;

i=2;
while i<100 && (sum(recorrido)<=12*theta0)
i=i+1;
t(i)=t(i-1)+dt;
ang(i)=2*ang(i-1)-ang(i-2)+dt2*ac(i-1);
ac(i)=a(ang(i));
recorrido(i)=abs(ang(i-1)-ang(i));
end
tt=t(1:length(ang))
plot(t,ang)