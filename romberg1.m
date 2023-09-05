function R = romberg(func, a, b, n)
    % Converting string to function handle
    f = str2func(func);
    
    % Preallocating matrix R with zeros
    R = zeros(n, n);
    
    h = (b - a);
    
    % R(1,1) = h/2 * (f(a) + f(b))
    R(1, 1) = (h/2) * (f(a) + f(b));
    
    % Creating Romberg Matrix
    for j = 2:n
        h = h / 2;
        sum = 0;
        for i = 1:(2^(j-2))
            sum = sum + f(a + (2*i - 1) * h);
        end
        R(j, 1) = 0.5 * R(j-1, 1) + sum * h;
        for k = 2:j
            R(j, k) = R(j, k-1) + (1/(4^(k-1) - 1)) * (R(j, k-1) - R(j-1, k-1));
        end
    end
end
