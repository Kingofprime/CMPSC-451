clear all;
clc;
a=0;
b=0.8;
n=4;
func = @(x) exp(-x);
I= integral(func,a,b);

for i=1:6
    z(i)=trapezoid1(func,a,b,n);
    n=n*2;
    err(i)=abs(I-z(i));
end
node=[4,8,16,32,64,128];
loglog(node,err);


function v = trapezoid1(func,a,b,n)
h=(b-a)/n;
f=feval(func,a);
x=a;
for i=1:n-1
    x=x+h;
    f=f+2*feval(func,x);
end
f=f+feval(func,b);
v=(b-a)*f/(2*n);
end

