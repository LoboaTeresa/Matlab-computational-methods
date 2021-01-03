function [iR,iV] = CircuitoControl3(R,V)

% Solve circuit of problem 3. Control 3. Computacion I. 2015/04/15:
%   V-I2*R2-I1*R1-I5*R5=0 
%   V-I2*R2-I6*R6-I5*R5=0 
%   IV-I2-I3=0 
%   I2-I1-I4-I6=0
%   V-I2*R2-I4*R4=0 
%   V-I3*R3-I5*R5=0 
%   I4+I5-IV=0
% Input:
%   R(6) : resistance values (Ohm)
%   V    : battery voltage (V)
% Output:
%   iR(6) : current across resistances (Amp)
%   iV    : current across battery (Amp)
% J.M.Soler

% Solve system of equations as A*I=b
A = [ R(1), R(2),   0,   0,R(5),   0, 0
         0, R(2),   0,   0,R(5),R(6), 0
         0,   -1,  -1,   0,   0,   0,+1
        -1,   +1,   0,  -1,   0,  -1, 0
         0  R(2),   0,R(4),   0,   0, 0
         0,    0,R(3),   0,R(5),   0, 0
         0,    0,   0,  +1,  +1,   0,-1 ];
b = [V;V;0;0;V;V;0];
I = A\b;

% Set output variables
iR = I(1:6);
iV = I(7);

end