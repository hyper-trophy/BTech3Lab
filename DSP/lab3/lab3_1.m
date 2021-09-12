clc
clear all;

x = 0:6;
h = -2:2;

x = x./3;

n1=length(x);
n2=length(h);

N=n1+n2-1;
x=[x, zeros(1, N-n1)];
h=[h, zeros(1, N-n2)];

disp('signal x :')
disp(x)
disp('signal h :')
disp(h)

y= zeros(1, N);

for n=1:N
    for k= 1:n
        y(n) = y(n)+x(k)*h(n-k+1);
    end
end

disp('Convolution without inbuild functions is' );
disp(y);

y_inBuilt= zeros(1, N);
y_inBuilt= conv(x, h);
disp('Convolution with inbuild functions is' );
disp(y_inBuilt)
