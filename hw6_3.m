clc;
clear all;

A = sparse(17,17);
apha = cos(pi/4);

%Equations
A(1,1) = -apha; 
A(1,4) = 1;
A(1,5) = apha;
A(2,1) = -apha; 
A(2,3) = -1;
A(2,5) = -apha;
A(3,2) = -1;
A(3,6) = 1;
A(4,3) = 1;
A(5,4) = -1; 
A(5,8) = 1;
A(6,7) = -1;
A(7,5) = -apha; 
A(7,6) = -1; 
A(7,9) = apha; 
A(7,10)= 1;
A(8,5) = apha;
A(8,7) = 1; 
A(8,9) = apha;
A(9,8) = -1; 
A(9,9) = -apha; 
A(9,12) = 1; 
A(9,13) = apha;
A(10,9) = -apha; 
A(10,11) = -1; 
A(10,13) = -apha;
A(11,10) = -1;
A(11,14) = 1;
A(12,11) = 1;
A(13,12) = -1;
A(13,16) = apha;
A(14,15) = -1;
A(14,16) = -apha;
A(15,13) = -apha; 
A(15,14) = -1; 
A(15,17) = 1;
A(16,13) = apha; 
A(16,15) = 1;
A(17,16) = -apha; 
A(17,17) = -1;

%a
a= sparse(17,1);
a(4) = 10; 
a(8) = 15; 
a(12) = 0; 
a(16) = 10;

%b
b= sparse(17,1); 
b(4) = 15; 
b(8) = 0; 
b(12) = 0; 
b(16) = 10;

%c
c= sparse(17,1); 
c(4) = 10; 
c(8) = 0; 
c(12) = 20; 
c(16) = 0;

%d
d= sparse(17,1); 
d(4) = 0; 
d(8) = 10; 
d(12) = 10; 
d(16) = 0;

f1 = full(A\a)
f2 = full(A\b)
f3 = full(A\c)
f4 = full(A\d)