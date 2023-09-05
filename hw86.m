clc;
clear all;

% given data
xk = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
yk = [0.7829 0.8052 0.5753 0.5201 0.3783 0.2923 0.1695 0.0842 0.0415 0.009 0];

% calculating polynomials
p1 = polyfit(xk, yk, 1);
p2 = polyfit(xk, yk, 2);
p4 = polyfit(xk, yk, 4);
p8 = polyfit(xk, yk, 8);

% setting the range for x
x = linspace(0, 1, 100);

% plotting the data along with the fit polynomials
figure;

plot(xk, yk, 'ko', 'LineWidth', 2); 
hold on;
plot(x, polyval(p1, x), 'LineWidth', 2);
plot(x, polyval(p2, x), 'LineWidth', 2);
plot(x, polyval(p4, x), 'LineWidth', 2);
plot(x, polyval(p8, x), 'LineWidth', 2);
legend('Data','1st Order','2nd Order','4th Order', '8th Order');
xlabel('x');
ylabel('y');
title('Polynomial Fit to Data');
hold off;
