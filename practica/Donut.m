function [XX,YY,ZZ]=Donut(ri,re,h,pintar)
% Funci�n que debuelve las matrices de coordenadas para dibujar un 'donut'
% Opcionalmente puede pintarlo: de forma esquem�tica o 'decorado'.
%
%   [XX,YY,ZZ]=Donut(ri,re,h,pintar)
%
% Entrada:
%   ri       radio interno del donut
%   re       radio externo del donut
%   h        altura del donut
%   pintar   par�metro opcional: 
%               0 o no existe,  no pinta la figura
%               1  pinta la figura con los puntos unidos por lineas
%               2  pinta la figura sin ejes, iluminada y 'decorada' 
% Salidas:      
%   XX       Matriz de las coordenadas x que definen el donut
%   YY       Matriz de las coordenadas y que definen el donut
%   ZZ       Matriz de las coordenadas z que definen el donut

% Ejemplo 2.5 

if (nargin<3)    % Comprobaci�n de que tenemos suficientes datos
    error('     No hay suficientes argumentos')
end

% Un donut es una elipse, desplazada del origen y que se ha rotado
% alrededor del origen de coordenadas. 
% Es decir, es un toroide generado por una elipse. 
% Si la elipse es una circunferencia, la figura se denomina toro.
%
% El eje horizontal de la elipse va a tener un tama�o dado por la 
% diferencia entre el radio exterior y el radio interior.
% El centro de la elipse va a estar desplazado la mitad de la suma de los
% radios internos y externo.
% El eje mayor de la elipse va a ser la altura que tenga el donut.

% Primero calculamos las coordenadas de la elipse 'origen' (rho, z)
% utilizando el par�metro angular 'alpha'
r=abs((re-ri)/2); % semieje mayor; 'abs' hace que no hay problema si re<ri
d=(re+ri)/2;      % distancia al origen del centro de la elipse desplazada
alpha=0:pi/32:2*pi; % �ngulo auxiliar
rho=r*cos(alpha)+d; % coordenada rho de la elipse 'origen' 
z=h/2*sin(alpha);   % coordenada z de la elipse 'origen'

% Ahora rotamos la elipse alrededor del origen, generamos las posiciones
% (x,y) a partir de la variable rho; las z son las mismas de antes 
phi=0:pi/64:2*pi; % angulo auxiliar
XX=rho'*cos(phi); % trasponemos rho y multiplicamos matricial por cos(phi)
YY=rho'*sin(phi); % o sen(phi); as� obtenemos las matrices de 'x' e 'y' 
ZZ=z'*ones(size(phi)); % matriz de 'z' transponiendo el vector anterior y
                       % multiplicandolo por vector de 1's para repetirlas

% Comprobar si se quiere dibujar la figura y si es as�, la dibujamos                       
if(nargin>3 && pintar)
  figure
  if(pintar==1)
    mesh(XX,YY,ZZ,...
        'EdgeColor',[0.3 0.3 0.3], ...  % Bordes color gris oscuro
        'FaceColor',[0.98 0.86 0.64])   % Superficie de color crema
    axis equal; % para que las proporciones se mantengan visualmente
    xlabel('x') % las etiquetas de los ejes
    ylabel('y')
    zlabel('z')
  else
    mesh(XX,YY,ZZ,'EdgeColor', 'none',...     % No Bordes (lineas)
        'FaceColor',[0.98 0.86 0.64], ...     % Superficie de color crema
        'AmbientStrength', 0.90, ...          % Cantidad luz ambiental
        'DiffuseStrength', 0.9, ...           % reflejo de la luz ambiental
        'FaceLighting', 'phong', ...  % m�todo para calcular la iluminaci�n 
        'SpecularColorReflectance', 0.5, ...    % Estos tres par�metros    
        'SpecularStrength', 0.3,...             % controlan como refleja
        'SpecularExponent',5);                  % la luz el objeto   
    light('Position', [1 -0.1 1], 'Style', 'infinite',... % ponemos una luz
        'Color', [0.22 0.22 0.22]);                       % no muy fuerte 
    axis equal; % para que las proporciones se mantengan visualmente
    axis off;   % para que no se muestren los ejes, etiquetas, ...
    title('\fontsize{14} \bf Aqui tiene su donut');    % el t�tulo
  end
end