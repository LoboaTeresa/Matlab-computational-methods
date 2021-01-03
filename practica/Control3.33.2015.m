clear all 
home
close all
R=[140,3,0,10,2,18];
R3=[0:0.5:10];
V=2;

iR=zeros(length(R),length(R3));
iV=zeros(1,length(R3));

for i=1:length(R3)
R(3)=R3(i);
[iR(:,i),iV(:,i)] = CircuitoControl3(R,V);
end



f=iR(1,:)-iR(6,:); %hallo cuando se hace cero, biseccion


%se cortan en el (x,0)
r3max=0.6167;
r3min=0.6166;
r3med=(r3max+r3min)/2;
R(3)=r3max;
iRmax=CircuitoControl3(R,V);
ymax=iRmax(1,:)-iRmax(6,:);
R(3)=r3min;
iRmin=CircuitoControl3(R,V);
ymin=iRmin(1,:)-iRmin(6,:);
R(3)=r3med;
iRmed=CircuitoControl3(R,V);
ymed=iRmed(1,:)-iRmed(6,:);
p=1e-20;
while abs(ymed)<p
if ymax*ymed>0
r3max=r3med;
else 
r3min=r3med;
end
r3med=(r3max+r3min)/2;
R(3)=r3max;
iRmax=CircuitoControl3(R,V);
ymax=iRmax(1,:)-iRmax(6,:);
R(3)=r3min;
iRmin=CircuitoControl3(R,V);
ymin=iRmin(1,:)-iRmin(6,:);
R(3)=r3med;
iRmed=CircuitoControl3(R,V);
ymed=iRmed(1,:)-iRmed(6,:);
end
r3med
plot(R3,iR(1,:),'-b',R3,iR(6,:),'-r',R3,f,'-g',r3med,0,'d k','MarkerSize',12)