clc;
clear all;

for i = 1:10
a(i)=i;
b(i)=i-5;
end


v = myValue(a,b); 

function v = myValue(a,b)
v=0;
for i = 1:length(b)
    x=1;
    for j = 1:i
        
        x = x*a(j); 

    end
    v = v + ((b(i)^2)*x);
end

end