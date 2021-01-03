function [sucF]=Fibonacci(N)
%Calcula la serie de Fibonacci f(n) hasta el t�rmino N, 
% donde f(1)=1, f(2)=1 y f(n)=f(n-2)+f(n-1) para n>2.
%
%   [sucF]=Fibonacci(N)
%
%Entrada:
%   N       n�mero natural; n�mero de terminos de la serie a calcular
%Salida:
%   sucF    vector, serie de Fibonacci hasta el t�rmino N
%

% Ejercicio 2.9

% Primero se comprueba si N un �nico n�mero y si es natural y positivo
if (numel(N)-1)
    error('N no puede ser una matriz; debe ser un entero mayor que cero');
elseif( N<=0 || rem(N,1) )         
    error('N debe ser un n�mero natural (entero y N>0)');
end

%Creamos la sucesi�n
sucF=ones(1,N);
for in=3:N   % solo se ejecuta si N>2
    sucF(in)=sucF(in-1)+sucF(in-2);
end

end
