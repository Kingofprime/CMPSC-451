clc;
clear all;


% Define the system of ODEs
func = @(x, y) [y(2); 6*x.^3 - 6*y(1)];

% Define the initial guess and the interval
z = 1;
interval = [0, 1];

% Initialize tolerance and error
tolerance = 1e-6;
error = inf;

% Initialize arrays for storing solutions
X = [];
Y = [];

% Define the target boundary value at x=1
target = 2;

while abs(error) > tolerance
    % Solve the system with ode45
    [x, y] = ode45(func, interval, [0, z]);

    % Check the error
    error = y(end, 1) + y(end, 2) - target;

    % Update the guess for z
    z = z - error / 10;  % simple gradient descent, in practice, use a more sophisticated method like Newton's method
    X = [X;x];
    Y = [Y;y(:,1)];
end

% Plot the solution
figure;
hold on;
for i=1:size(Y,2)
    plot(X(:,i), Y(:,i))
end
title('Solution of the BVP')
xlabel('x')
ylabel('y(x)')
grid on;
hold off;
