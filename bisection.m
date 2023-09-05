clc;
clear all;
% Define the function
f = @(x) 9*x^4 + 18*x^3 + 38*x^2 - 57*x + 14;

x = bisection1(f, 0, 1, 1e-6, 100);
disp(['Root in [0, 1] is: ', num2str(x)]);


x = bisection1(f, 0, 0.5, 1e-6, 100);
disp(['Root in [0, 0.5] is: ', num2str(x)]);

x = bisection1(f, 0.5, 1, 1e-6, 100);
disp(['Root in [0.5, 1] is: ', num2str(x)]);


fc=@(x) tan(x)-x;
x = bisection1(fc, 1, 2, 1e-6, 100);
disp(['Root is: ', num2str(x)]);

% Define the function for the intersection
fd = @(x) x^3 - x^2 - 2*x + 1;

k = bisection1(fd, 0, 1, 1e-6, 100);

disp(['The curves intersect at x = ', num2str(k)]);


%% 5.2 part A
f = @(x) exp(-x) - cos(x);
x=bisection1(f,1.1,1.6,1e-6,100);
disp(['5.2 part A Root is: ', num2str(x)]);

function r = bisection1(f, a, b, tol, nmax)
    % Check if f(a)*f(b) is less than or equal to 0
    if f(a) * f(b) >= 0
        disp('Error')
        r='NaN';
    else

    % Initialize the variables
    r = (a + b) / 2;
    err = abs(f(r));
    iter = 0;

    % Iterate until the maximum number of iterations or the error tolerance is achieved
    while err > tol && iter < nmax
        % Bisection Method implementation
        if f(a)*f(r) < 0
            b = r;
        else
            a = r;
        end

        r = (a + b) / 2;
        err = abs(f(r));
        iter = iter + 1;
    end
    end
end
