clc

X=input('enter the sequence x =');
N=input('Enter the number of point of DFT N =');
% L=length(X);
% if(N<L)
%    error('N must be grater than L') 
% end    
% x1=[x zeros(1,N-L)];
x=zeros(1,N);

for n=1:N
    for k=1:N
        x(n)=x(n)+(1/N)*X(k)*exp(2*pi*i(k-1)*(n-1)/N);
    end
end

disp('IDFT of input sequence is X=')
disp(x)
n = 0:length(X)-1;
subplot(2,1,1);
stem(X)
% plot(n,x);
title('DFT of input sequence is X=');
subplot(2,1,2);
stem(abs(x));
% plot(n,X);