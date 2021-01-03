clear all 
home
close all
Lmax=500;
n=0:Lmax;
f=cumsum(((-1).^n)./(2.*n+1));
pi4=(pi./4)*ones(1,length(f));
plot(n,f,'-r',n,pi4,'-b')