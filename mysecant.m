clc;
clear all;

% Define the function
f = @(x) x^2 - 2;

% Call the secant method function
x = mysecant1(f, 1, 2, 1e-12, 10);
disp(['Root: ', num2str(x)]);

% Define another function
f = @(x) exp(-x) - cos(x);

% Call the secant method function again
x = mysecant1(f, 1.1, 1.6, 1e-12, 10);
disp(['Root: ', num2str(x)]);





function x = mysecant1(f, x0, x1, tol, nmax)
    % Initialize the variables
    iter = 0;
    err = abs(x1 - x0);
    
    % Iterate until the maximum number of iterations or the error tolerance is achieved
    while err > tol && iter < nmax
        % Secant Method implementation
        x = x1 - f(x1)*((x1 - x0)/(f(x1) - f(x0)));
        err = abs(x - x1);
        x0 = x1;
        x1 = x;
        iter = iter + 1;
        
        % Display the current iteration and the current guess for the root
        fprintf('Iteration %d: %f\n', iter, x);
    end
end
