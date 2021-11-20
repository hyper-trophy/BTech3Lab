clc
clear all;
close all;

%x = input('Enter the elements: ');	%input signal 

N=9;

%L = length(x);
n1=0:0.01:N-1;
x= zeros(1, length(n1));
i=1;
for n = 0:0.01:N-1;
    z=(n-4)/4;
    x(i)=1-abs(z);
    i=i+1;
end

%x = [x zeros(1,N-L)];

subplot(2,2,1)
plot(n1,x)
xlabel('n')
ylabel('amplitude')
title('Input Sequence U19EC072')


%DFT

y = zeros(1, length(n1));
l=1
m=1
for k = 0:0.01:N-1
    W = exp((-1j*2*pi*k)/N);
    for n = 0:N-1
        y(l) =y(l)+ x(m)*W^n;
        l=l+1;
    end
    m=m+1;
end
disp('y: ') 
disp(y)

k = 0:0.01:N-1;
subplot(2,2,2) 
plot(k,y)
xlabel('k')
ylabel('amplitude')
title('DFT value U19EC072')

magnitude = abs(y); 
subplot(2,2,3) 
plot(k,magnitude)
xlabel('k') 
ylabel('amplitude')
 title('Magnitude U19EC072')

phase = angle(y);
subplot(2,2,4)
plot(k,phase) 
xlabel('k') 
ylabel('phase')
title('Phase U19EC072')