clc
clear all

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

% recreating the formula for dft using 2 for loops
for k = 0:N-1
    for n = 0:N-1
        y(k+1) =y(k+1)+ x(n+1)*exp((-j*2*pi*k*n)/N);
    end
end

% output the dft sequence
disp('y: ')
disp(y)

% plot the dft sequence
k = 0:N-1;
subplot(3,2,2)
stem(k,y)
xlabel('k')
ylabel('Amplitude')
title('DFT value of X(n)')

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


%IDFT generation
N = length(y);

% initializing blank array to fill the IDFT
m = zeros(1,N);

% recreating the formula for idft using 2 for loops
for n = 0:N-1
    for k = 0:N-1
        m(n+1) = m(n+1)+((1/N)*(y(k+1)*exp((j*2*pi*k*n)/N)));
    end
end
disp('m: ')
disp(m)

% plotting the IDFT 
n = 0:N-1;
subplot(3,2,5)
stem(n,m)
xlabel('n')
ylabel('Amplitude')
title('IDFT')