clc;
clear all;

% Parameters
sigma = 10;
b = 8/3;
r = 28;

% Initial conditions
x0 = 0;
y0 = 1;
z0 = 0;
initial_conditions = [x0, y0, z0];

% Time span
tspan = [0, 80];

% Define ODEs
odefun = @(t, y) [sigma*(y(2)-y(1)); r*y(1)-y(2)-y(1)*y(3); y(1)*y(2)-b*y(3)];

% Solve ODEs
[t, y] = ode45(odefun, tspan, initial_conditions);

% 3D plot
figure;
plot3(y(:,1), y(:,2), y(:,3));
title('3D plot of the Lorenz system');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
grid on;

% Plot of x(t), y(t), and z(t)
figure;
subplot(3,1,1);
plot(t, y(:,1));
title('x(t)');
xlabel('t');
ylabel('x');

subplot(3,1,2);
plot(t, y(:,2));
title('y(t)');
xlabel('t');
ylabel('y');

subplot(3,1,3);
plot(t, y(:,3));
title('z(t)');
xlabel('t');
ylabel('z');


% Plot of x against y
figure;
plot(y(:,1), y(:,2));
title('x against y');
xlabel('x');
ylabel('y');


% Plot of x against z
figure;
plot(y(:,1), y(:,3));
title('x against z');
xlabel('x');
ylabel('z');

% Plot of y against z
figure;
plot(y(:,2), y(:,3));
title('y against z');
xlabel('y');
ylabel('z');