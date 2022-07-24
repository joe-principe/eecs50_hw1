% Script file: hw1_4.m
%
% Purpose:
%   To plot the functions from HW 1 problem 4
%
% Define variables:
%   n  -- Sampling index
%   x1 -- Input signal delta[n] - 2*delta[n - 1]
%   y1 -- Output signal from x1[n]
%   h  -- Impulse Response of the system
%
%   A  -- Coefficient of delta[n + 1]
%   B  -- Coefficient of delta[n]
%   C  -- Coefficient of delta[n - 1]
%   D  -- Coefficient of delta[n - 3]
%
%   x2 -- Input signal delta[n] + 2*delta[n - 1]
%   y2 -- Output signal from x2[n]
%   u  -- Unit step function u[n]
%   s  -- Step Response of the system

% Initialize the symbolic values for the Kronecker Delta functions
syms a b c;
a = sym(0);
b = sym(1);
c = sym(2);

% Initialize inputs
n = -5:5;
x1 = kroneckerDelta(n, a) + (-2 * kroneckerDelta(n, b));
x2 = kroneckerDelta(n, a) + ( 2 * kroneckerDelta(n, b));
y1 = kroneckerDelta(n, a) + (-4 * kroneckerDelta(n, c));

% Plot the functions
subplot(4, 1, 1);
hold on;
stem(n, x1, '.');
stem(n, y1, '--');
hold off;
title('Plot of x_{1}[n] & y_{1}[n]');
xlim([-5, 5]);
legend('x_{1}[n]', 'y_{1}[n]');

% a) Find the values of the constants A, B, C, D
A = 0; % 0*delta[n + 1] = A*delta[n + 1]
B = 1; % delta[n]       = (B - 2A)delta[n]
C = 2; % 0*delta[n - 1] = (C - 2B)delta[n - 1]
D = 0; % 0*delta[n - 3] = D*delta[n - 3]

% Define the impulse response
h  = (B * kroneckerDelta(n, a)) + (C * kroneckerDelta(n, b));

% Plot h[n]
subplot(4, 1, 2);
stem(n, h);
title('Plot of h[n]');
xlabel('n');
ylabel('h[n]');
xlim([-5, 5]);

% b) Find T(x2[n])
% conv() only accepts numeric types, not symbolic types, so convert to
% double first
x2 = double(x2);
h = double(h);
y2 = conv(x2, h);
y2 = y2(6:16); % Shorten y2 to only be between -5:5

% Plot T(x2[n])
subplot(4, 1, 3);
stem(n, y2);
title('Plot of T(x_{2}[n])');
xlabel('n');
ylabel('T(x_{2}[n])');
xlim([-5, 5]);

% c) Find the step response of the system.
u = double(n >= 0);
s = conv(u, h);
s = s(6:16); % Shorten s to only be between -5:5

% Plot u[n] & s[n]
subplot(4, 1, 4);
hold on;
stem(n, u, '.');
stem(n, s, '--');
hold off;
title('Plot of u[n] & s[n]');
xlim([-5, 5]);
legend('u[n]', 's[n]');