clc
a = 0:6;

x= (a./3);
b= -2:2;
h= ones(1, length(b));
disp(x) ;
disp(h) ;
n1=length(x);

n2=length(h) ;
N=n1+n2-1;
y= zeros(1, N);
y= conv(x, h);
disp(y)