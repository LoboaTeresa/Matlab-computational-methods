% Exercise 2 of control 3, Computacion I. 2015/04/15
% Simulate random walk in a lattice
% Written as a function to include all models of control 3 (teacher only)
% Input:
%   model : ('A'|'B'|'C'|'D')
% Sample usage:
%   Control3_2('B')
% J.M.Soler


 DE = 1.36e-21;   % barrier height (J)
    T  = 364;        % temperature (K)

dx = 0.36;                 % position interval (nm)
xl = 2.88;                 % max. position (nm)
k = 1.38e-23;              % Bolztman constant (J/K)
nj = 20;                   % jump attempts
np = 5000;                 % number of particles
pJump = exp(-DE/(k*T));    % total jump probability (left or right)

% Find particle positions after nj jump attempts
xp = zeros(np,1);                   % initially all particles at x=0
for j = 1:nj                        % iterate on jump attempts
    willJump = (rand(np,1)<pJump);  % will the particles jump this time?
    jumpDir = 2*randi(2,np,1)-3;    % random jump direction (-1 or +1)
    xp = xp + dx*willJump.*jumpDir; % new particle positions
    xp = min(xp,+xl);               % avoid moving out of range
    xp = max(xp,-xl);
end

% Find mean final distance and standard deviation
xMean = sum(xp)/np                       % mean position (nm)
xStanDev = sqrt(sum((xp-xMean).^2)/np)
d = abs(xp);                             % distance to origin (nm)
dMean = sum(d)/np                        % mean distance (nm)
dStanDev = sqrt(sum((d-dMean).^2)/np)

% Plot histogram of positions
x = -xl:dx:+xl;              % possible positions (bins)
npx = hist(xp,x);            % particles in each position
bar(x,npx)
xlabel('x (nm)')
ylabel('number of particles')


