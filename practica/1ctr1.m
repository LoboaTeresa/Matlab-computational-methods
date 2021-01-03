clear all 
home
close all


%DATOS
a=[1:100];
b=[50:0.5:100];
b(:,101)=[];
aa=ones(100).*a;
A=floor(aa);
bb=ones(100).*b;
B=ceil(bb);
c=B-A;
C=c(3:3:end,3:3:end);
D=zeros(1,33);
Aux1=C;

for i=1:33
C(:,i)=Aux1(:,34-i);
end


for i=1:33
D(i)=C(i,i);
end

%2 PARTE

%suma
for i=1:33
if D(i)>0
D(i)=D(i);
else
D(i)=0;
end
end
S=sum(D)


%multiplos
X=zeros(1,33);
x=rem(D,13);
for(i=1:33)
if (x(i)=0)
X(i)=D(i);
else
X(i)=0;
end
end
Y=zeros(1,33);
y=rem(D,13);
for(i=1:33)
if y=0;
Y(i)=0;
else
Y(i)=D(i);
end
end
M=X*Y;


