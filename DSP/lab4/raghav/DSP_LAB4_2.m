clc
close all

% reading the input sequence
x = input('Enter the elements: ');

% reading number of DFT points
N = input('Enter the value of N: ');

% appending zeros at the end of sequence
L = length(x);
n = 0:N-1;
x = [x zeros(1,N-L)];

% plot the input sequence
subplot(3,2,1)
stem(n,x)
xlabel('n')
ylabel('Amplitude')
title('Input Sequence Inbuilt')

% initializing blank array to fill the IDFT 
y = zeros(1,N);

% using inbuilt function to find dft
y = fft(x,N);

% output the dft sequence
disp('y: ')
disp(y)

% plot the dft sequence
k = 0:N-1;
subplot(3,2,2)
stem(k,y)
xlabel('k')
ylabel('Amplitude')
title('DFT value of X(n) Inbuilt')

magnitude = abs(y);
subplot(3,2,3)
stem(k,magnitude)
xlabel('k')
ylabel('Amplitude')
title('Magnitude Inbuilt')

phase = angle(y);
subplot(3,2,4)
stem(k,phase)
xlabel('k')
ylabel('Phase')
title('Phase Inbuilt')


%IDFT generation
m=ifft(y);

% plot the idft sequence
n = 0:N-1;
subplot(3,2,5)
stem(n,m)
xlabel('n')
ylabel('Amplitude')
title('IDFT Inbuilt')