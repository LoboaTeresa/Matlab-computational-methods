%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function X = randar(q,a,b,m,N)
% Funcion de script de generacion de numeros aleatorios bajo
% la distribucion de probabilidad p(x) = A*q(x)
% Pablo Garcia Gonzalez (Noviembre 2016)
%
% Inputs:
% q : funcion anonima con la pdf q(x) (no es necesaria normalizacion)
% a : cota inferior valores variable aleatoria
% b : cota superior valores variable aleatoria
% m : cota superior valor q(x)
% N : tamaño del conjunto de numeros aleatorios
% Output:
% X : Array fila de N elementos que contiene numeros aleatorios en el
%     intervalo [a,b] bajo la pdf p(x) = A.*q(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function X = randar(q,a,b,m,N)
X = zeros(1,N) ; % prealocacion
bma = b-a ;
for k = 1:N
    aceptacion = 0 ;
    while aceptacion == 0
        xs = a + rand.*bma ;    % Valor aleatorio en [a,b]
        ys = m.*rand ;          % Valor aleatorio en [0,m]
        if ys < q(xs)
            aceptacion = 1 ;
        end
    end
    X(k) = xs ;
end
return
end
