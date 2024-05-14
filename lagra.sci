function [y, polynomial] = lagrange_interpolation(x, y, xx)
    n = length(x);
    m = length(xx);
    yint = zeros(1, m);
    polynomial = "";
    for i = 1:m
        yy = 0;
        term = "";
        for j = 1:n
            p = y(j);
            term = term + string(p);
            for k = 1:n
                if k ~= j
                    p = p .* (xx(i) - x(k)) / (x(j) - x(k));
                    term = term + "*(x - " + string(x(k)) + ") / (" + string(x(j)) + " - " + string(x(k)) + ")";
                end
            end
            yy = yy + p;
            if j < n
                term = term + " + ";
            end
        end
        yint(i) = yy;
        polynomial = polynomial + " + " + term;
    end
    y = yint;
    polynomial = polynomial(4:$);
endfunction

// Ejemplo de uso
x = [1, 2, 3, 4];
y = [1, 4, 9, 16];
xx = 2.5;
[y_interp, polynomial] = lagrange_interpolation(x, y, xx);
disp(y_interp);
disp(polynomial);
