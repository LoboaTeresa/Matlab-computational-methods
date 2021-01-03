function [m]=VectorUnitario(A)
% Calcula los vectores unitario de los vectores (columna) contenidos en A
%
%       m=VectorUnitario(A)
%
% Entrada:
%   A       vector columna o matriz (vectores columna consecutivos)
% Salida:
%   m       vector columna si A es vectorcolumna;  
%           matriz si A en matriz (vectores columna consecutivos).
%
m=A./repmat(sum(A.^2).^0.5, size(A(:,1)) ) ;
end