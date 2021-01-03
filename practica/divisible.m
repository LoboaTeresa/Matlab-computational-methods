%Creación de funciones en MatLab y utilización del los comandos de 
%control if y else.
%Comprueba si dos números (a y b) son divisibles el uno por el otro: devuelve 
%un 1 si a es divisible entre b, o b lo es entre a; devuelve un 0 si no son divisibles.
%Utilización de la función rem (remainder after division; resto de una división)
%y la negación lógica '~'.

function[r]=divisible(a,b)
if (rem(a,b)==0)|(rem(b,a)==0)
  r=1;
  disp(r)
  
else (rem(a,b)~=0)|(rem(b,a)~=0)
   r=0;
  
  disp(r)
end
end
