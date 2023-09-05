% Define the time step and initialize arrays
h = 0.1;
t = 0:h:1;
n = length(t);
y = zeros(3,n);

% Define the initial conditions
y(1,1) = 1; % initial condition for y1(0) = x(0)
y(2,1) = 2; % initial condition for y2(0) = x'(0)
y(3,1) = 3; % initial condition for y3(0) = x''(0)

% Define the system of ODEs
f = @(t,y1,y2,y3) [y2; y3; -2*y3 + y1*t];

% Perform the Euler steps
for i=1:n-1
    y(:,i+1) = y(:,i) + h*f(t(i),y(1,i),y(2,i),y(3,i));
end

% The approximation of x(1) is then
x10 = y(1,n)
