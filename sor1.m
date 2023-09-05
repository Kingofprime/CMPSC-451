clear all;
clc;

% create A, b, x0
A = diag([-2.011 -2.012 -2.013 -2.014 -2.015 -2.016 -2.017 -2.018 -2.019]) + diag(ones(1,8),-1) + diag(ones(1,8),1);
b = [-0.994974; 1.57407e-3; -8.96677e-4; -2.71137e-3; -4.07407e-3; -5.11719e-3; -5.92917e-3; -6.57065e-3; -0.507084];
x0 = [0.95; 0.9; 0.85; 0.8; 0.75; 0.7; 0.65; 0.6; 0.55];

% initialize iteration count array
iteration_count = zeros(1,10);
w_values = 1:0.1:2;

% solve the system for different w values
for i = 1:length(w_values)
    [x,nit] = sor(A, b, x0, w_values(i), 1, 1e-4, 100);
    iteration_count(i) = nit;
    
end
[x,nit] = sor(A, b, x0, 1.5, 1, 1e-4, 100)


% plot iteration count as a function of w
plot(w_values, iteration_count, '*');
xlabel('w value');
ylabel('Number of iterations');
title('SOR Convergence');


function [x,nit]=sor(A,b,x0,w,d,tol,nmax)
% SOR : solve linear system with SOR iteration
% Usage: [x,nit]=sor(A,b,x0,omega,d,tol,nmax)
% Inputs:
% A : an n x n-matrix,
% b : the rhs vector, with length n
% x0 : the start vector for the iteration
% tol: error tolerance
% w: relaxation parameter, (1 < w < 2),
% d : band width of A.
% Outputs:
% x : the solution vector
% nit: number of iterations

    n = length(b);
    x = x0;
    nit = 0;
    
    while nit < nmax
        nit = nit + 1;
        x_old = x;
        
        for i = 1:n
            % compute the sum of the 'left' elements in the row
            sum1 = A(i,max(1,i-d):i-1) * x(max(1,i-d):i-1);
            % compute the sum of the 'right' elements in the row
            sum2 = A(i,i+1:min(i+d,n)) * x_old(i+1:min(i+d,n));
            % update the x-value
            x(i) = (1 - w) * x_old(i) + (w / A(i,i)) * (b(i) - sum1 - sum2);
        end
        
        if norm(x - x_old, inf) < tol
            break;
        end
    end
    
    if nit == nmax
        warning('The SOR method did not converge to the desired tolerance');
    end
end
