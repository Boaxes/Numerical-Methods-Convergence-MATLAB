% Problem 1 programming part. Implements fixed-point iteration (FPI) to
% approximate all three roots of f(x) = 2x^3 - 6x - 1. Two iteration
% functions g1 and g2 are derived; at least one converges to each root.
% Stopping criterion: |x_n - r| < 1e-8.

% Define root values for comparison
R1 = -1.641783527452926;
R2 = -0.168254401764093;
R3 = 1.810037929236685;
% Tolerance for stopping criteria
tol = 1e-8;
% Function definitions
g1 = @(x) nthroot((6*x + 1)/2, 3); % For R1 and R3
g2 = @(x) (2*x.^3 - 1)/6;          % For R2
% Initial guesses
x1 = -1.5;
x2 = 0;
x3 = 1.5;
% Run iterations
fprintf('\nFixed-Point Iteration for R1 (Using g1)\n');
fixed_point_iteration(g1, x1, R1, tol);
fprintf('\nFixed-Point Iteration for R2 (Using g2)\n');
fixed_point_iteration(g2, x2, R2, tol);
fprintf('\nFixed-Point Iteration for R3 (Using g1)\n');
fixed_point_iteration(g1, x3, R3, tol);
function fixed_point_iteration(g, x0, r, tol)
    fprintf('\n%3s %12s %12s %12s %12s\n', 'i', 'xi', 'g(xi)', 'ei', 'ei/ei-1');
    i = 0;
    e_prev = NaN;
    e = abs(x0 - r);

    while e >= tol
        gx = g(x0);
        ratio = e / e_prev;
        if i == 0
            fprintf('%3d %12.7f %12.7f %12.7f %12s\n', i, x0, gx, e, '---');
        else
            fprintf('%3d %12.7f %12.7f %12.7f %12.7f\n', i, x0, gx, e, ratio);
        end

        e_prev = e;
        x0 = gx;
        e = abs(x0 - r);
        i = i + 1;
    end
end
