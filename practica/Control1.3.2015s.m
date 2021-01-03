clear all 
home
close all

n=33;
m=31;
a=zeros(1,1000);
a(1)=7;
a(2)=11;
b=zeros(1,1000);
b(1)=27;
b(2)=12;

kmin = 950;
kmax = 1000;

for k = 3:kmax
    a(k) = mod(a(k-1)*a(k-2),n);
    if mod(b(k-1),2)==1
        b(k) = mod(b(k-1)*b(k-2),m);       % b(k-1) odd
    else
        b(k) = mod((b(k-1)-1)*b(k-2),m);   % b(k-1) even
    end
end

% Plot successions
figure(11)
k = 1:kmax;
plot(k,b)
xlabel('k')
ylabel('b_k')

figure(12)
k = kmin:kmax;
plot( k,a(k), k,b(k) )
legend('a_k','b_k')
xlabel('k')
ylabel('succession')