
clc;
clear all;

a = 0:7;
x = sin(pi*a/2);
N = length(x);
l = nextpow2(N);
x = [x, zeros(1, (2^l)-N)];
N = length(x);
t=0:N-1;

y = fft_recursive(x);

subplot(3, 1, 1);
stem(t, x, 'linewidth', 2);
ylabel('Amplitude');
xlabel('n');
title('Input Sequence');

subplot(3, 1, 2);
stem(t, abs(y), 'linewidth', 2);
ylabel('Amplitude');
xlabel('n');
title('Magnitude');

grid on;
subplot(3, 1, 3);
stem(t, angle(y), 'linewidth', 2);
ylabel('Angle');
xlabel('n');
title('Phase');