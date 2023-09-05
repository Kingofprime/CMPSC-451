clc;
clear all;
% create A, b, x0
A = diag([-2.011 -2.012 -2.013 -2.014 -2.015 -2.016 -2.017 -2.018 -2.019]) + diag(ones(1,8),-1) + diag(ones(1,8),1);
b = [-0.994974; 1.57407e-3; -8.96677e-4; -2.71137e-3; -4.07407e-3; -5.11719e-3; -5.92917e-3; -6.57065e-3; -0.507084];
x0 = [0.95; 0.9; 0.85; 0.8; 0.75; 0.7; 0.65; 0.6; 0.55];


% solve the system
[x,nit] = jacobi(A, b, x0, 1e-4, 100)





function [x, nit] = jacobi(A, b, x0, tol, nmax)
% JACOBI: Solve linear system with Jacobi iteration
% Usage: [x, nit] = jacobi(A, b, x0, tol, nmax)
% Inputs:
% A : an n x n-matrix,
% b : the rhs vector, with length n
% x0 : the start vector for the iteration
% tol: error tolerance
% nmax: maximum number of iterations
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
            % Calculate the sum of the current row
            A_sum = A(i,:) * x_old;

            % Subtract the contribution of x_old(i)
            A_sum = A_sum - A(i,i) * x_old(i);

            % Update the x-value
            x(i) = (b(i) - A_sum) / A(i,i);
        end

        if norm(x - x_old, inf) < tol
            break;
        end
    end

    if nit == nmax
        warning('Jacobi method did not converge to the desired tolerance');
    end
end
