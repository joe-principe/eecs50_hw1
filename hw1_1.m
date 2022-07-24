% Script file: hw1_1.m
%
% Purpose:
%   To solve each part of Homework 1 Problem 1
%
% Define variables:
%   x1_c  -- The continuous signal 5cos(3pi*t + pi/4)
%   x2_c  -- The continuous signal 4cos^2(3t + pi/7)
%   x1_fo -- The original frequency of x1_c (Hz)
%   x2_fo -- The original frequency of x2_c (Hz)
%
%   x1_ts -- The sampling time for x1_c (s)
%   x2_ts -- The sampling time for x2_c (s)
%   x1_fs -- The sampling frequency for x1_c (Hz)
%   x2_fs -- The sampling frequency for x2_c (Hz)
%
%   x1_d  -- The discrete signal from sampling x1_c
%   x2_d  -- The discrete signal from sampling x2_c
%   x1_df  -- The frequency of x1_d (Hz)
%   x2_df  -- The frequency of x2_d (Hz)
%
%   x1_r  -- The signal recovered from x1_d
%   x1_fr -- The frequency of the signal recovered from x1_d
%   t     -- Time (s)
%   n     -- Sampling index

% Initialize the continuous time signals
x1_c = @ (t) 5 * cos(3 * pi * t + pi / 4);
x2_c = @ (t) 4 * cos(3 * t + pi / 7).^2;

% Initialize the sampling times and frequencies
x1_fo = 3 / 2;
x2_fo = 3 / (pi * 2);

x1_ts = 0.4;
x2_ts = 0.2;

x1_fs = 1 / x1_ts;
x2_fs = 1 / x2_ts;

x1_df = x1_fo / x1_fs;
x2_df = x2_fo / x2_fs;

x1_fr = -1;

% a) Determine if the Nyquist criterion is satisfied
disp('a) For each case, determine if the Nyquist criterion is satisfied:');
fprintf('\tFor x1: ');
nyquist(x1_fs, x1_fo);
fprintf('\tFor x2: ');
nyquist(x2_fs, x2_fo);

% Initialize the discrete time signals
n = -5:5;
x1_d = 5 * cos(3 * pi * x1_df * n + pi / 4);
x2_d = 4 * cos(3 * x2_df * n + pi / 7).^2;

% b) & c) Is x[n] periodic? If so, then find its fundamental period, N
fprintf('\nb) & c) Is x[n] periodic? If so, then find its fundamental period, N\n');
fprintf('\tFor x1: The function is periodic\n\t\t\tThe fundamental period is %g\n', 5);
fprintf('\tFor x2: The function is not periodic\n\t\t\tThere is no fundamental period\n');

% Initialize the recovered signal x1_r
x1_r = @ (t) 5 * cos(2 * pi * x1_fr * t + pi / 4);

% Plot all of the signals
subplot(5, 1, 1);
fplot(x1_c);
title('Plot of x_{1}(t)');
xlabel('t');
ylabel('x_{1}(t)');

subplot(5, 1, 2);
fplot(x2_c);
title('Plot of x_{2}(t)');
xlabel('t');
ylabel('x_{2}(t)');

subplot(5, 1, 3);
stem(n, x1_d);
title('Plot of x_{1}[n]');
xlabel('n');
ylabel('x_{1}[n]');

subplot(5, 1, 4);
stem(n, x2_d);
title('Plot of x_{2}[n]');
xlabel('n');
ylabel('x_{2}[n]');

subplot(5, 1, 5);
fplot(x1_r);
title('Plot of x_{1r}(t)');
xlabel('t');
ylabel('x_{1r}(t)');

% A local function to check the Nyquist Sampling Criterion
function nyquist(fs, fo)
narginchk(2, 2);

if fs >= 2 * fo
    fprintf('The Nyquist criterion is satisfied because %.2fHz >= 2(%.2f)Hz\n', fs, fo);
else
    fprintf('The Nyquist criterion is not satisfied because %.2fHz <= 2(%.2f)Hz\n', fs, fo);
end

end