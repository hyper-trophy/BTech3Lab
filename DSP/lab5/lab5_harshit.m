clc
close all
y=[0 1 2 3 4 5 6 7];
n=length(y);
p=nextpow2(n);
z=zeros(1,2^p-n);
x=[y z];

