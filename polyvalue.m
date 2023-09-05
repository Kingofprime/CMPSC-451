function v = polyvalue(a,x,t)
n = length(a);
for k = 1 : n - 1
   d(k, 1) = (x(k+1) - x(k))/(a(k+1) - a(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(a(k+j) - a(k));
   end
end

for j = 2 : n
   a(j) = d(1, j-1);
end
diff(1) = 1;
c(1) = a(1);
for j = 2 : n
   diff(j)=(t - a(j-1)) .* diff(j-1);
   c(j) = a(j) .* diff(j);
end
v=sum(c);

end