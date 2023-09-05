clc; clear all;

% Define the function and its derivative
f = @(x) x^2 - 2;
df = @(x) 2*x;

% Call the Newton's method function
x = mynewton1(f, df, 1, 1e-12, 10);
disp(['Root is: ', num2str(x)]);

% Define another function and its derivative
f = @(x) exp(-x) - cos(x);
df = @(x) -exp(-x) + sin(x);

% Call the Newton's method function again
x = mynewton1(f, df, 1.4, 1e-12, 10);
disp(['Root is: ', num2str(x)]);

%%5.5 part 2
% Define the function and its derivative
f = @(x) 1/2 + (1/4)*x^2 - x*sin(x) - (1/2)*cos(2*x);
df = @(x) x/2 - sin(x) - x*cos(x) + sin(2*x);

% Initialize
x0 = pi/2;
tol = 1e-3;
x=mynewton1(f,df,x0,tol,100);


%%
function x = mynewton1(f, df, x0, tol, nmax)
    % Initialize the variables
    iter = 0;
    err = tol + 1;
    x = x0;

    % Iterate until the maximum number of iterations or the error tolerance is achieved
    while err > tol && iter < nmax
        % Newton's Method implementation
        x1 = x - f(x)/df(x);
        err = abs(x1 - x);
        x = x1;
        iter = iter + 1;

        % Display the current iteration and the current guess for the root
        fprintf('Iteration %d: %f\n', iter, x);
    end
end
