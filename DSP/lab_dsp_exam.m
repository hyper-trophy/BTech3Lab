clc
clear all;
close all;

N=9;

n1=0:0.01:N-1;
x=zeros(1, length(n1));
i=1;

for n = 0:0.01:N-1;
    z=(n-4)/4;
    x(i)=1-abs(z);
    i=i+1;
end

subplot(3,1,1)
plot(n1,x)
xlabel('n')
ylabel('amplitude')
title('Input Sequence U19EC046')

%DTFT

y = zeros(1, length(n1));
w=-0.2:0.001:0.2;

for i=1:length(w);
    X(i)=0;
    for k=1:length(x);
          X(i)=X(i)+x(k).*exp(-1j*w(i)*k);
    end
end

magnitude = abs(X); 
subplot(3,1,2) 
plot(w,magnitude)
xlabel('k') 
ylabel('amplitude')
title('Magnitude U19EC046')

phase = angle(X);
subplot(3,1,3)
plot(w,phase) 
xlabel('k') 
ylabel('phase')
title('Phase U19EC046')