clear all;
clc;

% Parameters
a = 0;
b = pi/2;
alpha = -0.3;
beta = -0.1;

% Guess for y'(0)
guess = 0;

% Define the exact solution
exact_sol = @(x) -(sin(x) + 3*cos(x))/10;

% Call shooting method
shooting_method(@ode_system, a, b, alpha, beta, guess, exact_sol);



function dy = ode_system(x, y)
    % Define the system of first-order ODEs
    dy = zeros(2,1);
    dy(1) = y(2);
    dy(2) = y(2) + 2*y(1) + cos(x);
end
function [x, y, error] = shooting_method(ode_system, a, b, alpha, beta, guess, exact_sol)
    options = odeset('RelTol',1e-8,'AbsTol',1e-8);  % Set error tolerance

    % Initial conditions for IVP
    init_cond = [alpha; guess];

    % Solve IVP using ode45
    [x, y] = ode45(ode_system, [a, b], init_cond, options);

    % Compute error
    error = beta - y(end, 1);

    % Print the error
    fprintf('Error: %.5f\n', error);

    % Plot solution
    figure;
    plot(x, y(:, 1), 'r', x, exact_sol(x), 'b');
    legend('Numerical solution', 'Exact solution');
    title('Solution using Shooting Method');

    % Plot error
    figure;
    plot(x, y(:, 1) - exact_sol(x));
    title('Error between numerical and exact solution');
end
