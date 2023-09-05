 x = [1,0,0,0;1,5,25,125;1,10,100,1000;1,15,225,3375];

  y = [3;8;-2;9];

  a = x\y;


t = [0:0.1:15];
p3 = a(1)+a(2)*t+a(3)*t.^2+a(4)*t.^3;
x = [0;5;10;15];
plot(x,y,'x',t,p3)
grid on
xlabel('x');
title('The interpolate polynomial p_3(x)')
