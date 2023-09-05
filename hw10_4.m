clear all
clc

% Define problem parameters
a = 0;
b = pi/2;
N1 = 10;
N2 = 20;
y_a = -0.3;
y_b = -0.1;
exact_sol = @(x) -(sin(x) + 3*cos(x))/10;

% Solve the system for N = 10 and N = 20
y1 = solve_system(a, b, N1, y_a, y_b);
y2 = solve_system(a, b, N2, y_a, y_b);

% Create x grids
x1 = linspace(a, b, N1+1);
x2 = linspace(a, b, N2+1);

% Compute the exact solution on the grids
y_exact1 = exact_sol(x1);
y_exact2 = exact_sol(x2);

% Compute the errors
error1 = abs(y1 - y_exact1);
error2 = abs(y2 - y_exact2);

% Plot solutions and errors
figure;
subplot(2,1,1);
plot(x1, y1, x2, y2, x1, y_exact1, '--', x2, y_exact2, '--');
legend('Approximate solution, N=10', 'Approximate solution, N=20', 'Exact solution, N=10', 'Exact solution, N=20');
xlabel('x');
ylabel('y');

subplot(2,1,2);
semilogy(x1, error1, x2, error2);
legend('Error, N=10', 'Error, N=20');
xlabel('x');
ylabel('Error');



function y = solve_system(a, b, N, y_a, y_b)

h = (b - a) / N;
x = linspace(a, b, N+1);

% Create the A matrix
A = zeros(N+1);
A(1,1) = 1;
A(N+1,N+1) = 1;
for i = 2:N
    A(i,i-1) = 2/h^2 - 1/(2*h);
    A(i,i) = -4/h^2 + 2;
    A(i,i+1) = 2/h^2 + 1/(2*h);
end

% Create the B vector
B = -cos(x)';
B(1) = y_a;
B(N+1) = y_b;

% Solve the system
y = A\B;

end