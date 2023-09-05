t=[1.2,1.5,1.6,2.0,2.2];
y=[0.4275,1.139,0.8736,-0.9751,-0.1536];
x=[1.2:0.05:2.2];
ls=lspline1(t,y,x);
function l=lspline1(t,y,x)
n=length(t); 
m=length(x); 
l=zeros(size(x)); 
for j=1:1:m w=x(j); 
    f=0;
    for i=n-1:-1:1
    if (w-t(i) >=0)
    f=i;
    break;
    end
    end
    l(j) = y(f)+(w-t(f))*((y(f+1)-y(f))/(t(f+1)-t(f)));
end
plot(t,y,x,l)

end
