clear all;
clc;
disp('i')
c = [0.2:0.2:1];
x = ones(length(c),1);
A = vander(c);
b = A*x;
x1 = naiv_gauss(A,b);
x2 = A\b; 
error1 = (x-x1)'
error2 = (x-x2)'

disp('ii')
c = [0.1:0.1:1];
x = ones(length(c),1);
A = vander(c);
b = A*x;
x1 = naiv_gauss(A,b);
x2 = A\b; 
error1 = (x-x1)'
error2 = (x-x2)'

disp('iii')
c = [0.05:0.05:1];
x = ones(length(c),1);
A = vander(c);
b = A*x;
x1 = naiv_gauss(A,b);
x2 = A\b; 
error1 = (x-x1)'
error2 = (x-x2)'


function x = naiv_gauss(A,b);
n = length(b);
x = zeros(n,1);

for k=1:n-1
  for i=k+1:n
    xmult = A(i,k)/A(k,k);
    A(i,k) = xmult;
    for j=k+1:n
      A(i,j) = A(i,j)-xmult*A(k,j);
    end
    b(i) = b(i)-xmult*b(k);
  end
end
x(n) = b(n)/A(n,n);
for i=n-1:-1:1
  sum = b(i);
  for j=i+1:n
    sum = sum-A(i,j)*x(j);
  end
  x(i) = sum/A(i,i);
end
end