clc;
clear all;

% Procedure GaussianX(n, d, a, b)
%     Initialize x as a zero vector of size n
%     p = floor(n/2)
% 
%     For i from 1 to p - 1 do
%         factor = a(i) / d(i)
%         d(n - i + 1) = d(n - i + 1) - factor * a(n - i + 1)
%         b(n - i + 1) = b(n - i + 1) - factor * b(i)
%     End For
% 
%     For i from n down to p do
%         x(i) = b(i) / d(i)
%     End For
% 
%     For i from p - 1 down to 1 do
%         x(i) = (b(i) - a(n - i + 1) * x(n - i + 1)) / d(i)
%     End For
% 
%     Return x
% End Procedure


n=11;
a=ones(n,1);
d=4*a;
b=(4+1)*a;
b(round(n/2))=4;
x=GaussianX(n,d,a,b)




function x=GaussianX(n,d,a,b)

x=zeros(n,1);
p=round(n/2);
for i=0:p-2
       factor=a(i+1)/d(i+1);
    d(n-i) = d(n-i)-factor*a(n-i);
    b(n-i) = b(n-i)-factor*b(i+1);
end

for i=n:-1:p
x(i)=b(i)/d(i);
end
for i=p-1:-1:1
x(i)=(b(i)-a(n-i)*x(n-i))/d(i);
end
end