function dydx=derivative(x,y)

% Given a function y as a vector of values at points x, 
% it returns its derivative at the same points. 
% Uses a simple finite-difference approximation:
%   dydx(i) = (y(i+1)-y(i-1)) / (x(i+1)-x(i-1))   for 1<i<n
%   dydx(1) = (y(2)-y(1)) / (x(2)-x(1))
%   dydx(n) = (y(n)-y(n-1)) / (x(n)-x(n-1))
% Input:
%   x    : vector of x points
%   y    : vector of y values at given x points
% Output:
%   dydx : vector of dy/dx at given x points 
% Usage example:
%    x = 0:pi/100:2*pi
%    y = sin(x)
%    z = derivative(x,y)
% J.M.Soler. Sep.2010

n=numel(x);
for i=1:n
    if i==1
        dydx(i) = (y(2)-y(1)) / (x(2)-x(1));
    elseif i==n
        dydx(i) = (y(n)-y(n-1)) / (x(n)-x(n-1));
    else
        dydx(i) = (y(i+1)-y(i-1)) / (x(i+1)-x(i-1));
    end
end

end % function derivative