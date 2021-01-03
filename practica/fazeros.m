    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % function fazeros(func,a,b,dx)
    % Calculo de los ceros de la funcion anonima func en el intervalo [a,b]
    % acotando la busqueda en intervalos de anchura dx (aprox.)
    %
    % Uso Z = fazeros(func,a,b,dx)
    %
    % Z es el array fila que contiene los ceros
    % Utiliza la funcion implicita de Matlab fzeros
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function Z = fazeros(func,a,b,dx)
    Nv = ceil(1+(b-a)/dx) ; % Numero de puntos del array
    X = linspace(a,b,Nv) ;  % Mallado para la variable independiente
    F = func(X) ;           % Array con los valores de func(X)
    S = sign(F) ;           % Array con los valores de sign(func(X))
    Z = [] ;                % Inicialmente, Z es la matriz vacia
    numz = 0 ;              % Este sera un indice para los ceros
    % Es X(1) un cero?
    if S(1) == 0
       numz = numz+1 ;
       Z(numz) = X(1) ;
    end
    % Resto de los elementos:
    for n = 2:Nv
       if S(n) == 0
          numz = numz+1 ; 
          Z(numz) = X(n) ;
       elseif S(n-1)*S(n) == -1
          numz = numz+1 ;
          Z(numz) = fzero(func,[X(n-1),X(n)]) ; % Cero en (X(n-1),X(n))
       end
    end
    return
    end 