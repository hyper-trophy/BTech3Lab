clc;
clear all;

% For M = 7
M1 = 7;
n1 = 0:M1-1;

w1 = rectwin(M1);
[H1, W1] = freqz(w1, 1, (-pi/2:0.01:pi/2));

w2 = bartlett(M1);
[H2, W2] = freqz(w2, 1, (-pi/2:0.01:pi/2));

w3 = blackman(M1);
[H3, W3] = freqz(w3, 1, (-pi/2:0.01:pi/2));

w4 = hamming(M1);
[H4, W4] = freqz(w4, 1, (-pi/2:0.01:pi/2));

w5 = hann(M1);
[H5, W5] = freqz(w5, 1, (-pi/2:0.01:pi/2));

subplot(2, 1, 1)
plot(n1,w1,n1,w2,n1,w3,n1,w4,n1,w5)
legend('rectangular','bartlett','blackman','hamming','hanning');
title('Time domain plot for M = 7');
ylabel('Magnitude');
xlabel('n-->');

subplot(2, 1, 2)
plot(W1/pi,abs(H1), W2/pi, abs(H2), W3/pi, abs(H3), W4/pi, abs(H4), W5/pi, abs(H5));
legend('rectangular', 'bartlett', 'blackman', 'hamming', 'hanning');
title('Frequency domain plot for M = 7');
ylabel('Magnitude');
xlabel('Normalised Frequency');