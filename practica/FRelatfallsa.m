function [a]=FRelatfallsa(F,v,m);
c=3e8;
modv=sqrt((v(1,:).^2)+(v(2,:).^2)+(v(3,:).^2));
gamma=c/sqrt((c.^2)-modv.^2);
aux=gamma*m*eye(3);
aux2=(gamma.^3)*m/(c.^2)*[(v(1)).^2,v(1)*v(2),v(1)*v(3);
                           v(2)*v(1),(v(2)).^2,v(2)*v(3);
                           v(1)*v(3),v(2)*v(3),(v(3)).^2];
                           
A=aux+aux2;
b=[F(1);F(2);F(3)];
a=A\b;
end
                           