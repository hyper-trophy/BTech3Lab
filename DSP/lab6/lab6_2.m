clc; clear all; close all;
M = 7;
wc = pi/8;
fc = wc/(2*pi);
wn = wc/pi;
a = (M - 1) /2;
X=0;
for i=0:M-1
    h(i+1) = 2*fc*sinc(2*fc*(i-a));
end
h1 = h/sum(h);
freqz(h,1,-pi:0.001:pi);
title('Filter response without inbuilt function for M = 7')
