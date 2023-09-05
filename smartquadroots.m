clc;
clear all;

a=3;
b=-123454321;
c=2;
p=[a,b,c];
r=roots(p);
[r1,r2]=smartquadroot(a,b,c);


function [r1,r2] = smartquadroot(a,b,c)

r1 = (-b+sqrt((b^2)-(4*a*c)))/(2*a);
r2 = c/(a*r1);
end