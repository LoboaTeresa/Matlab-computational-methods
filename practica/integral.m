function z=integral(x,y)

% Given a function y as a vector of values at points x, returns its 
% definite integral between the first point and each of the other points. 
% Uses a linear interpolation approximation for y(x) between points.
% Input:
%   x    : vector of x points
%   y    : vector of y values at given x points
% Output:
%   z    : vector of Int_xmin^x y(x') dx', at given x points 
% Usage example:
%    x = 0:pi/100:2*pi
%    y = sin(x)
%    inty = integral(x,y)
% J.M.Soler. Sep.2010

n=length(x);
z(1)=0;
for i=2:n
    z(i) = z(i-1) + (y(i)+y(i-1))/2 * (x(i)-x(i-1));
end

end % function integral