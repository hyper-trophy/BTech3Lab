%Butterworth Low Pass Filter
clc;
close all;
clear all;

rp = input('enter the passband ripple: ');
rs = input('enter the stopband attenuation: ');
wp = input('enter the passband frequency: ' );
ws = input('enter the stopband frequency: ' );
fs = input('enter the sampling frequency: ' );

w1 = 2*wp/fs;
w2 = 2*ws/fs;
[n, wn] = buttord(w1, w2, rp, rs, 's');
[z, p, k] = butter(n, wn);      

[b, a] = butter(n, wn, 's' );
w = 0 : 0.01 : pi;
[h, om] = freqs(b, a, w);
m = 20*log10(abs(h) );
an = angle(h);

subplot(2, 1, 1);
plot(om/pi, m);
ylabel('Gain (dB)') ;
xlabel('Normalized frequency (x pi rad/sample)');

subplot(2, 1, 2);
plot(om/pi, an);
ylabel('Phase') ;
xlabel('Normalized frequency (x pi rad/sample)');