clc;
clear all;

a=3;
b=-123454321;
c=2;
p=[a,b,c];
r=roots(p);
[r1,r2]=quadroot(a,b,c);


% Results are bad for last polynomial because the b coefficient is so high
% which makes the nominator of quadratic formula close to zero.

function [r1,r2] = quadroot(a,b,c)

r1 = (-b+sqrt((b^2)-(4*a*c)))/(2*a);
r2 = (-b-sqrt((b^2)-(4*a*c)))/(2*a);

end