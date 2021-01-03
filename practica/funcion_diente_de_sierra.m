function[px,py]=funcion_diente_de_sierra(x0,dx,xf,P,A)

x=[x0:dx:xf];
px=x./P;
y=px-floor(px);
py=A.*y;
plot(x,py);

end
%% En la ventana de comandos he de poner:
%%funcion_diente_de_sierra(0,0.01,10,0.5,2)

