clc; clear all;

M1=7;
M2=31;
M3=69;
M4=109;

Wc = pi/4;
fc = Wc/2*pi;
Wn = Wc/pi;

rect1 = rectwin(M1);
brect1 = fir1(M1-1, Wn, rect1);
[H1, W1] = freqz(brect1, 1, [-pi:0.001:pi]);

rect2 = rectwin(M2);
brect2 = fir1(M2-1, Wn, rect2);
[H2, W2] = freqz(brect2, 1, [-pi:0.001:pi]);

rect3 = rectwin(M3);
brect3 = fir1(M3-1, Wn, rect3);
[H3, W3] = freqz(brect3, 1, [-pi:0.001:pi]);

rect4 = rectwin(M4);
brect4 = fir1(M4-1, Wn, rect4);
[H4, W4] = freqz(brect4, 1, [-pi:0.001:pi]);

plot(   W1/pi, 10*log10 (abs(H1)),... 
        W2/pi, 10*log10(abs(H2)),...
        W3/pi, 10*log10(abs(H3)),... 
        W4/pi, 10*log10(abs(H4)));
   
legend( 'M1 = 7', 'M2 = 31 ', 'M3 = 69' , 'M4 = 109');
title('LPF using rectangular Window') ;
xlabel('normalized frequency');