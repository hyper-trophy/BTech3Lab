clc;
clear all;
close all;
 
ap = -20*log10(0.8); %pass band ripple
as = -20*log10(0.2); %stop band ripple
wp = 0.2*pi; %pass band edge frequency
ws = 0.3*pi; %stop band edge frequency

%returns the order N of the lowest order digital Chebyshev Type I filter
[n,wn] = cheb1ord(wp/pi,ws/pi,ap,as);
 
%designs an Nth order lowpass digital Chebyshev filter of order n+1
[b1,a1] = cheby1(n+1,ap,wn);
%designs an Nth order lowpass digital Chebyshev filter of order n+2
[b2,a2] = cheby1(n+2,ap,wn);
%designs an Nth order lowpass digital Chebyshev filter of order n+3
[b3,a3] = cheby1(n+3,ap,wn);
 
%Range of w
w = 0:0.01:pi;
 
%returns the N-point complex frequency response 
[h1,ph1] = freqz(b1,a1,w);
[h2,ph2] = freqz(b2,a2,w);
[h3,ph3] = freqz(b3,a3,w);
 
%% Plotting Magnitude Response
subplot(2,1,1);
plot(ph1/pi,20*log10(abs(h1)));
hold on;
plot(ph2/pi,20*log10(abs(h2)));
hold on;
plot(ph2/pi,20*log10(abs(h3)));
 
title('Chebyshev type1 Magnitude Plot');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
legend('order=3','order=4','order=5');
 
%% Potting Phase Response
subplot(2,1,2);
plot(ph1/pi,angle(h1));
hold on;
plot(ph2/pi,angle(h2));
hold on;
plot(ph3/pi,angle(h3));
 
title('Chebyshev type1 Phase Plot');
xlabel('Normalized Frequency');
ylabel('Phase');
legend('order=3','order=4','order=5');