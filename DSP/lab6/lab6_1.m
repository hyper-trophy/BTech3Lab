clc; clear all; close all;
M = 7;
wc = pi/8;
fc = wc/(2*pi);
wn = wc/pi;
a = (M-1)/2;
rect = rectwin(M);
b = fir1(M-1, wn, rect);
freqz(b, 1, [-pi :0.001:pi]);
title('Filter response with inbuilt function plot M=7')  