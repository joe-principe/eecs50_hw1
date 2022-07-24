% Script file: hw1_2.m
%
% Purpose:
%   To graph part c in HW 1 problem 2
%
% Define variables:
%   n       -- Sampling index
%   u       -- Unit step function u[1 - 3n]
%   u_t     -- Transformed unit step function u[3n]
%   delta   -- Kronecker Delta function delta[1 - n^2]
%   delta_t -- Transformed Kronecker Delta function delta[n^2]
%   a       -- Symbolic value for Kronecker Delta @ n = 0
%   b       -- Symbolic value for Kronecker Delta @ n = 2

% Initialize the symbolic values for the Kronecker Delta functions
syms a b;
a = sym(0);
b = sym(2);

% Define the input functions
n = -5:5;
u = 1 - 3 * n >= 0;
delta = kroneckerDelta(1 - n.^2, a);

% Find the transformed functions
u_t = 3 * n - 2 >= 0;
delta_t = kroneckerDelta(n, a) + kroneckerDelta(n, b);

% Plot u[1 - 3n] & T7(u[1 - 3n])
subplot(2, 1, 1);
hold on;
stem(n, u, 'k--o');
stem(n, u_t, '- .');
hold off;
xlim([-5, 5]);
title('Plot of {u[1 - 3n]} & T_{7}(u[1 - 3n])');
xlabel('n');
ylabel('{u[1 - 3n]} & T_{7}(u[1 - 3n])');
legend('u[1 - 3n]', 'T_{7}(u[1 - 3n])');

% Plot delta[1 - n^2] & T7(delta[1 - n^2])
subplot(2, 1, 2);
hold on;
stem(n, delta, 'k--o');
stem(n, delta_t, '- .');
hold off;
xlim([-5, 5]);
title('Plot of {\delta[1 - n^2]} & T_{7}(\delta[1 - n^2])');
xlabel('n');
ylabel('{\delta[1 - n^{2}]} & T_{7}(\delta[1 - n^{2}])');
legend('\delta[1 - n^{2}]', 'T_{7}(\delta[1 - n^{2}])');