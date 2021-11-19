clc;
clear all;
close all;

ap = 0.8; %pass band ripple
as = 0.2; %stop band ripple
wp = 0.2*pi; %pass band edge frequency
ws = 0.3*pi; %stop band edge frequency

t = 1;
pass_attenuation = -20*log10(ap); %pass_attenuation
stop_attenuation = -20*log10(as); %stop_attenuation
p_a = (2/t)*tan(wp/2);
p_s = (2/t)*tan(ws/2);

[n,cf] = cheb1ord(p_a,p_s,pass_attenuation,stop_attenuation,'s');
%Returns the transfer coefficient of nth order.
[bn,an] = cheby1(n,pass_attenuation,1,'s');
%Transfer function.
hsn = tf(bn,an);
%To find Unnormalised function
[b,a] = cheby1(n,pass_attenuation,cf,'s');
hs = tf(b,a);
%converts to a z-transform discrete equivalent of bilinear transformation
[num,den] = bilinear(b,a,1/t);
hz = tf(num,den,t);

w = 0:0.01:pi;
hw = freqz(num,den,w);

%% Plotting Magnitude Response
subplot(2,1,1)
plot(w/pi,abs(hw));
grid on;
title('Magnitude response of chebyshev using bilinear');
ylabel('Magnitude');
xlabel('Normalised Frequency');

%% Plotting Phase Response
subplot(2,1,2);
plot(w/pi,angle(hw));
grid on;
title('Phase response of chebyshev using bilinear');
ylabel('Phase');
xlabel('Normalised Frequency');