

xNodes1 = linspace(-5,5,21);
yNodes1 =((xNodes1).^2+1).^-1;
x =linspace(-5,5);
y = polya(xNodes1,yNodes1,x);
plot(x,y);

function yval = polya(xn1,yn1,x)
n = length(xn1); 
yval = zeros(size(x));
for k = 1:n
 deg = ones(size(x)); 
 for j = [1:k-1 k+1:n] 
 deg= (x-xn1(j))./(xn1(k)-xn1(j)).*deg;
 end
yval = yval + deg*yn1(k);
end

end