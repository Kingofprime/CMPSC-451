% Defining functions
f1 = @(x) sin(x);
f2 = @(x) sqrt(x);

% Defining integration intervals
a1 = 0; 
b1 = pi; 
a2 = 0; 
b2 = 1;

% Defining tolerance
tol = 1e-9;


approx1_quad = quad(f1, a1, b1, tol);
error1_quad = abs(2 - approx1_quad);
approx1_quadl = quadl(f1, a1, b1, tol);
error1_quadl = abs(2 - approx1_quadl);

approx2_quad = quad(f2, a2, b2, tol);
error2_quad = abs((2/3) - approx2_quad);

approx2_quadl = quadl(f2, a2, b2, tol);
error2_quadl = abs((2/3) - approx2_quadl);
