% Problem 2 programming part. Convergence rate comparison of four methods
% for approximating r = 1 in f(x) = x^4 - 10x^3 + 35x^2 - 50x + 24.
% Methods: false position on [0, 1.5], Newton's method x0 = 0.5,
% fixed-point iteration x0 = 0.5, secant method x0 = 0 and x1 = 0.5.
% Stopping criterion: |x_n - r| < 1e-6.

% Define function and derivative
f = @(x) x.^4 - 10*x.^3 + 35*x.^2 - 50*x + 24;
f_prime = @(x) 4*x.^3 - 30*x.^2 + 70*x - 50;
g = @(x) (x.^4 - 10*x.^3 + 35*x.^2 + 24) / 50; % Fixed point iteration function
% True root
r = 1;
%% 1. Method of False Position
a = 0;
b = 1.5;
i = 0;
xi = a;
ei = abs(xi - r);
prev_ei = NaN;
fprintf('\nFalse Position Method\n');
fprintf('%3s %12s %12s %12s %12s\n', 'i', 'xi', 'g(xi)', 'ei', 'ei/ei-1');
while ei >= 1e-6
    xi = (a*f(b) - b*f(a)) / (f(b) - f(a));
    ei = abs(xi - r);
    ratio = ei / prev_ei;
    fprintf('%3d %12.7f %12.7f %12.7f %12.7f\n', i, xi, f(xi), ei, ratio);
    if f(a) * f(xi) < 0
        b = xi;
    else
        a = xi;
    end
    prev_ei = ei;
    i = i + 1;
end
%% 2. Newton's Method
x0 = 0.5;
ei = abs(x0 - r);
i = 0;
prev_ei = NaN;
fprintf("\nNewton's Method\n");
fprintf('%3s %12s %12s %12s %12s\n', 'i', 'xi', 'g(xi)', 'ei', 'ei/ei-1');
while ei >= 1e-6
    x1 = x0 - f(x0) / f_prime(x0);
    ei = abs(x1 - r);
    ratio = ei / prev_ei;
    fprintf('%3d %12.7f %12.7f %12.7f %12.7f\n', i, x1, f(x1), ei, ratio);
    x0 = x1;
    prev_ei = ei;
    i = i + 1;
end
