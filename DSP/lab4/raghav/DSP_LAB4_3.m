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
title('Input Sequence')

% initializing blank array to fill the IDFT 
y = zeros(1,N);

% custom function to find dft
y = dft_function(x,N);
disp('y: ')
disp(y)

% output the dft sequence
k = 0:N-1;
subplot(3,2,2)
stem(k,y)
xlabel('k')
ylabel('Amplitude')
title('DFT value of X(n) using twiddle facor');

magnitude = abs(y);
subplot(3,2,3)
stem(k,magnitude)
xlabel('k')
ylabel('Amplitude')
title('Magnitude')

phase = angle(y);
subplot(3,2,4)
stem(k,phase)
xlabel('k')
ylabel('Phase')
title('Phase')


%IDFT generation using custom function
m=idft_function(y);

% plotting the idft
n = 0:N-1;
subplot(3,2,5)
stem(n,m)
xlabel('n')
ylabel('Amplitude')
title('IDFT using twiddle factor');