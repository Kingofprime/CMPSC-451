x= zeros(6);
y= zeros(6);
divdif(x,y)
function a = divdif(x,y)
n = length(x);
for i=1:n
    a(i,1)= y(i);
end
for j=2:n
    for i=1:n-j+1
        a(i,j)= (a(i+1,j-1)-a(i,j-1))/(x(i+j-1)-x(i));
    end
end
end


