
clc;
clear all;

a = 0:7;
x = sin(pi*a/2);
N = length(x);
l = nextpow2(N);
x = [x, zeros(1, (2^l)-N)];
N = length(x);
t=0:N-1;

subplot(3, 2, 1);
stem(t, x, 'linewidth', 2);
ylabel('Amplitude');
xlabel('n');
title('Input Sequence');

grid on;
for j = l:-1:1
    L = 2^j;
    for n = 1:L:N-L+1
        for k = 0:L/2 - 1
            w = exp(-1i*2*pi*k/L); %Twiddle Factor
            A = x(n+k);
            B = x(n+k+L/2);
            x(n+k) = A+B;
            x(n+k+L/2) = (A-B)*w;
        end
    end
end

y = bitrevorder(x);

subplot(3, 2, 2);
stem(t, abs(y), 'linewidth', 2);
ylabel('Amplitude');
xlabel('n');
title('Magnitude');

grid on;
subplot(3, 2, 3);
stem(t, angle(y), 'linewidth', 2);
ylabel('Angle');
xlabel('n');
title('Phase');

grid on;
% IDFT
for j = l:-1:1
    L = 2^(j);
    for n = 1:L:N-L+1
        for k = 0:L/2 - 1
            w = exp(1i*2*pi*k/L); %Twiddle Factor
            C = y(n+k);
            D = y(n+k+L/2);
            y(n+k) = C+D;
            y(n+k+L/2) = (C-D)*w;
        end
    end
end

y=y/N;
y=bitrevorder(y);

n=0:N-1;
subplot(3,2,4)
stem(n,y, 'linewidth', 2);
xlabel('n');
ylabel('magnitude');
title('IDFT')
grid on;
