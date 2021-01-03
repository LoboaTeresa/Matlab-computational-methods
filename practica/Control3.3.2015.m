% Exercise 3 of control 3, Computacion I. 2015/04/15
% Simulate random walk in a lattice
% Written as a function to include all models of control 3.
% Input:
%   model : ('A'|'B'|'C'|'D')
% Sample usage:
%   Control3_3('B')
% J.M.Soler

    R = [4;3;12;7;13;20]; % resistance values (Ohm) (max for R3)
    V = 30;               % battery voltage (V)
R3min = 0;                % min. value of R3 (Ohm)
R3max = R(3);             % max. value of R3 (Ohm)
dR3 = 0.1;                % interval of R3 mesh values (Ohm)

% Find currents as a function of R3
R3 = (R3min:dR3:R3max);
nR3 = numel(R3);
IR = zeros(6,nR3);
IV = zeros(1,nR3);
for jR3 = 1:nR3           % loop on values of R3
    R(3) = R3(jR3);
    [IR(:,jR3),IV(jR3)] = CircuitoControl3(R,V);
end

% Find root of I1-I6 vs R3
DI = IR(1,:)-IR(6,:);                % I1-I6
j0 = find(DI(1:nR3-1).*DI(2:nR3)<0); % root between R3(j0) and R3(j0+1)
R3_0 = (R3(j0)*DI(j0+1)-R3(j0+1)*DI(j0))/(DI(j0+1)-DI(j0)) % lever rule
I1_0 = IR(1,j0)+(IR(1,j0+1)-IR(1,j0))/dR3*(R3_0-R3(j0))  % linear interpol.

% Plot intensities
plot( R3,IR(1,:), R3,IR(6,:), R3_0,I1_0,'d' )
legend('I_1','I_6','Location','SouthEast');
xlabel('R_3 (\Omega)')
ylabel('I (Amp)')

