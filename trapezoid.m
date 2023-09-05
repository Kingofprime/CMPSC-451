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
