

% Exercise 1 of control 3, Computacion I. 2015/04/15
% Find and plot the trajectory and energy of a damped pendulum
% Written as a function to include all models of control 3 (teacher only)
% Input:
%   model : ('A'|'B'|'C'|'D')
% Sample usage:
%   Control3_1('B')
% J.M.Soler

% Set system parameters

    L = 1;        % length of pendulum (m)
    H = 0.6;       % height from liquid surface to top of pendulum (m)
    M = 0.1;      % pendulum mass (kg)
    mu0 = 0.025;    % friction coefficient of mass in liquid (N/(m/s)=Kg/s)
    theta0 = 1.5;  % initial angle (rad)

g = 9.80;       % gravitational acceleration (m/s^2)
dt = 0.05;      % integration time step (s)
tmax = 10;      % total integration time (s)
s0 = L*theta0;  % initial tangential position (m)
v0 = 0;         % initial velocity

% Set force function (alternative to defining an external function)
mu = @(s)(mu0*(L*cos(s/L)>H));  % position-dependent friction coeff.
                                % note: (L*cos(s/L)>0) is zero or one
force = @(s,v,t)(-M*g*sin(s/L)-mu(s)*v);

% Integrate trajectory
[s,v] = rungeKutta( force, M, s0, v0, dt, tmax );
s = squeeze(s);        % remove singleton particle's index
v = squeeze(v);

% Find third maximum (not counting that at t=0)
imax = 3;                            % maximum searched
nt = numel(s);                       % time steps in whole trajectory
nt = find(s(1:nt-2)<s(2:nt-1) & ...  % s larger than previous and next
          s(2:nt-1)>s(3:nt),imax)+1; % +1 because first point was excluded
nt = nt(imax);                       % time steps until third maximum

% Limit trajectory to first three periods (nt steps)
tmax = (nt-1)*dt;      % time at third maximum
t = (0:dt:tmax);
s = s(1:nt);
v = v(1:nt);
theta = s/L;           % angular position (rad)
x = L*sin(theta);      % horixontal position (m)
y = L*(1-cos(theta));  % vertical position, relative to minimum (m)

% Find energies
Ep = M*g*y;
Ek = 0.5*M*v.^2;
Et = Ep+Ek;

% Plot trajectory
figure(1)
plot(t,theta)
xlabel('time (s)')
ylabel('theta (rad)')

% Plot energy
figure(2)
plot(t,Ep,t,Ek,t,Et)
legend('E_{pot}','E_{kin}','E_{tot}')
xlabel('time (s)')
ylabel('energy (J)')

