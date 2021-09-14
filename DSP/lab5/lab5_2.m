clc;
clear all;

a=0:7;
xn=sin(pi*a./2);
N=8;
L=length(xn);
n=0:N-1;
xn=[xn zeros(1,N-L)];

subplot(3,2,1)
stem(n,xn,'linewidth',2);
xlabel('n');
ylabel('amplitude');
title('input sequence');
grid;

% DFT
Xk=fft(xn,N);

subplot(3,2,2)
stem(n,Xk,'linewidth',2);
xlabel('n');
ylabel('amplitude');
title('DFT');
grid;

magnitude=abs(Xk);
subplot(3,2,3)
stem(n,magnitude,'linewidth',2);
xlabel('n')
ylabel('amplitude');
title('magnitude plot')
grid;

phase=angle(Xk);
subplot(3,2,4)
stem(n,phase,'linewidth',2)
xlabel('n')
ylabel('phase')
title('phase plot')
grid;

% IDFT
y=ifft(Xk,N);
subplot(3,2,5)
stem(n,y,'linewidth',2);
xlabel('n')
ylabel('y')
title('IDFT')
grid;
