clc;
clear all;

   % Define the Airy differential equation as a system of first-order ODEs
f = @(t, y) [y(2); t*y(1)];

% Set the initial conditions
y0 = [0.355028053887817; -0.258819403792807];

% Set the step size
h = 0.01;

% Solve the interval [-4.5, 0]
t1 = -4.5:h:0;
n1 = length(t1);
y1 = zeros(2, n1);
y1(:, 1) = y0;
for i = 2:n1
    k1 = f(t1(i-1), y1(:, i-1));
    k2 = f(t1(i-1) + h/2, y1(:, i-1) + h/2*k1);
    k3 = f(t1(i-1) + h/2, y1(:, i-1) + h/2*k2);
    k4 = f(t1(i-1) + h, y1(:, i-1) + h*k3);
    y1(:, i) = y1(:, i-1) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

% Solve the interval [0, 4.5]
t2 = 0:h:4.5;
n2 = length(t2);
y2 = zeros(2, n2);
y2(:, 1) = y0;
for i = 2:n2
    k1 = f(t2(i-1), y2(:, i-1));
    k2 = f(t2(i-1) + h/2, y2(:, i-1) + h/2*k1);
    k3 = f(t2(i-1) + h/2, y2(:, i-1) + h/2*k2);
    k4 = f(t2(i-1) + h, y2(:, i-1) + h*k3);
    y2(:, i) = y2(:, i-1) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

% Combine the solutions
t = [t1 t2(2:end)];
x = [y1(1, :) y2(1, 2:end)];
xdot = [y1(2, :) y2(2, 2:end)];

% Plot the solution
figure;
plot(t, x);
hold on;
plot(t, xdot);
legend('x(t)', 'x''(t)');
xlabel('t');
ylabel('x');
