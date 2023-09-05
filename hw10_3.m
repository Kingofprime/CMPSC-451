

% Initial guess for y'(0) (start with 0 and 1)
s0 = 0; 
s1 = 1;
tol = 1e-9;  % tolerance for the shooting method
maxIter = 5; % maximum iterations for secant method

for i = 1:maxIter
    % Solve the IVP with current guess for y'(0)
    [~, y0] = ode45(@ode_system, [0, pi], [0, s0]);
    [~, y1] = ode45(@ode_system, [0, pi], [0, s1]);
    
    % Compute the function values at x = pi
    f0 = y0(end, 1);
    f1 = y1(end, 1);
    
    % Update the guess for y'(0) using secant method
    s = s1 - f1 * (s1 - s0) / (f1 - f0);
    
    % Check if the update is within the tolerance
    if abs(s - s1) < tol
        break;
    end
    
    % Update s0 and s1 for next iteration
    s0 = s1;
    s1 = s;
end

% Solve the IVP with final guess for y'(0)
[x, y] = ode45(@ode_system, [0, pi], [0, s]);

% Plot the numerical solution
plot(x, y(:,1));
hold on;

% Exact solution
exact_sol = @(x) sin(x);

% Plot the exact solution
fplot(exact_sol, [0, pi]);

% Display the guess for y'(0) that satisfies the boundary conditions
disp(s);

% Plot the error
figure;
plot(x, y(:, 1) - exact_sol(x));
title('Error between numerical and exact solution');

% Function for the system of ODEs
    function dy = ode_system(x, y)
        dy = zeros(2,1);
        dy(1) = y(2);
        dy(2) = (y(2))^2 + y(1) - cos(x)^2;
    end
