clc;
clear all;
close all;
 
M1 = 7;
M2 = 31;
M3 = 61;
M4 = 109;
wc = pi/4;
fc = wc/2*pi;
wn = wc/pi;
 
%Rectangle Window
w1 = rectwin(M1);
bw1 = fir1(M1-1,wn,'high',w1);
[H1,W1] = freqz(bw1,1,[-pi:0.001:pi]);
 
w2 = rectwin(M2);
bw2 = fir1(M2 - 1,wn,'high',w2);
[H2,W2] = freqz(bw2,1,[-pi:0.001:pi]);
 
w3 = rectwin(M3);
bw3 = fir1(M3 - 1,wn,'high',w3);
[H3,W3] = freqz(bw3,1,[-pi:0.001:pi]);
 
w4 = rectwin(M4);
bw4 = fir1(M4 - 1,wn,'high',w4);
[H4,W4] = freqz(bw4,1,[-pi:0.001:pi]);
 
subplot(2,3,1);
plot(W1/pi,10*log10(abs(H1)), W2/pi,10*log10(abs(H2)), W3/pi,10*log10(abs(H3)), W4/pi,10*log10(abs(H4)));
legend('M1=7', 'M2=31', 'M3=61', 'M4=109');
title('HPF using rectangular window');
xlabel('Normalised frequency');
ylabel('Magnitude in dB');
 
%Hamming Window
w5 = hamming(M1);
bw5 = fir1(M1-1,wn,'high',w5);
[H5,W5] = freqz(bw5,1,[-pi:0.001:pi]);
 
w6 = hamming(M2);
bw6 = fir1(M2 - 1,wn,'high',w6);
[H6,W6] = freqz(bw6,1,[-pi:0.001:pi]);
 
w7 = hamming(M3);
bw7 = fir1(M3 - 1,wn,'high',w7);
[H7,W7] = freqz(bw7,1,[-pi:0.001:pi]);
 
w8 = rectwin(M4);
bw8 = fir1(M4 - 1,wn,'high',w8);
[H8,W8] = freqz(bw8,1,[-pi:0.001:pi]);
 
subplot(2,3,2);
plot(W5/pi,10*log10(abs(H5)), W6/pi,10*log10(abs(H6)), W7/pi,10*log10(abs(H7)), W8/pi,10*log10(abs(H8)));
legend('M1=7', 'M2=31', 'M3=61', 'M4=109');
title('HPF using hamming window');
xlabel('Normalised frequency');
ylabel('Magnitude in dB');
 
%Hanning window
w9 = hann(M1);
bw9 = fir1(M1-1,wn,'high',w9);
[H9,W9] = freqz(bw9,1,[-pi:0.001:pi]);
 
w10 = hann(M2);
bw10 = fir1(M2 - 1,wn,'high',w10);
[H10,W10] = freqz(bw10,1,[-pi:0.001:pi]);
 
w11 = hann(M3);
bw11 = fir1(M3 - 1,wn,'high',w11);
[H11,W11] = freqz(bw11,1,[-pi:0.001:pi]);
 
w12 = hann(M4);
bw12 = fir1(M4 - 1,wn,'high',w12);
[H12,W12] = freqz(bw12,1,[-pi:0.001:pi]);
 
subplot(2,3,3);
plot(W9/pi,10*log10(abs(H9)), W10/pi,10*log10(abs(H10)), W11/pi,10*log10(abs(H11)), W12/pi,10*log10(abs(H12)));
legend('M1=7', 'M2=31', 'M3=61', 'M4=109');
title('HPF using hanning window');
xlabel('Normalised frequency');
ylabel('Magnitude in dB');
 
%Bartlett Window
w13 = bartlett(M1);
bw13 = fir1(M1-1,wn,'high',w13);
[H13,W13] = freqz(bw13,1,[-pi:0.001:pi]);
 
w14 = bartlett(M2);
bw14 = fir1(M2 - 1,wn,'high',w14);
[H14,W14] = freqz(bw14,1,[-pi:0.001:pi]);
 
w15 = bartlett(M3);
bw15 = fir1(M3 - 1,wn,'high',w15);
[H15,W15] = freqz(bw15,1,[-pi:0.001:pi]);
 
w16 = bartlett(M4);
bw16 = fir1(M4 - 1,wn,'high',w16);
[H16,W16] = freqz(bw16,1,[-pi:0.001:pi]);
 
subplot(2,3,4);
plot(W13/pi,10*log10(abs(H13)), W14/pi,10*log10(abs(H14)), W15/pi,10*log10(abs(H15)), W16/pi,10*log10(abs(H16)));
legend('M1=7', 'M2=31', 'M3=61', 'M4=109');
title('HPF using bartlett window');
xlabel('Normalised frequency');
ylabel('Magnitude in dB');
 
%Blackman Window
w17 = blackman(M1);
bw17 = fir1(M1-1,wn,'high',w17);
[H17,W17] = freqz(bw17,1,[-pi:0.001:pi]);
 
w18 = blackman(M2);
bw18 = fir1(M2 - 1,wn,'high',w18);
[H18,W18] = freqz(bw18,1,[-pi:0.001:pi]);
 
w19 = blackman(M3);
bw19 = fir1(M3 - 1,wn,'high',w19);
[H19,W19] = freqz(bw19,1,[-pi:0.001:pi]);
 
w20 = blackman(M4);
bw20 = fir1(M4 - 1,wn,'high',w20);
[H20,W20] = freqz(bw20,1,[-pi:0.001:pi]);
 
subplot(2,3,5);
plot(W17/pi,10*log10(abs(H17)), W18/pi,10*log10(abs(H18)), W19/pi,10*log10(abs(H19)), W20/pi,10*log10(abs(H20)));
legend('M1=7', 'M2=31', 'M3=61', 'M4=109');
title('HPF using blackman window');
xlabel('Normalised frequency');
ylabel('Magnitude in dB');