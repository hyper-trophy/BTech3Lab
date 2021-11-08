clc; clear all;

bits = input('Enter bits matrix : ');
waves = waveGen(bits);
unipolarNRZ = waves{1};
polarNRZ = waves{2};
bipolarNRZ = waves{3};
t = waves{4};

%% ASK --------------------------------------->
carrier = sin(2*pi*t);
ASK = unipolarNRZ.*carrier;

figure;
subplot(3, 1, 1);
plot(t, unipolarNRZ);
title(['Unipolar NRZ of  ' num2str(bits)]);

subplot(3, 1, 2);
plot(t, carrier);
title('carrier signal');

subplot(3, 1, 3);
plot(t, ASK);
title('ASK signal')

ASKbipolar = bipolarNRZ.*carrier;

figure;
subplot(3, 1, 1);
plot(t, bipolarNRZ);
title(['Bipolar NRZ of  ' num2str(bits)]);

subplot(3, 1, 2);
plot(t, carrier);
title('carrier signal');

subplot(3, 1, 3);
plot(t, ASKbipolar);
title('ASK of bipolar signal')

%% FSK --------------------------------------->
carrier1 = sin(2*pi*t);
carrier2 = sin(2*pi*2*t);

bitsInv = mod(bits+1, 2);
waveInv = waveGen(bitsInv);
unipolarNRZInv = waveInv{1};

first = unipolarNRZInv.*carrier1;
second = unipolarNRZ.*carrier2;

FSK = first + second;

figure;
subplot(4, 1, 1);
plot(t, unipolarNRZ);
title(['Unipolar NRZ of  ' num2str(bits)]);

subplot(4, 1, 2);
plot(t, carrier1);
title('carrier signal 1');

subplot(4, 1, 3);
plot(t, carrier2);
title('carrier signal 2');

subplot(4, 1, 4);
plot(t, FSK);
title('FSK signal')

%% PSK --------------------------------------->
carrier = sin(2*pi*t);
PSK = polarNRZ.*carrier;

figure;
subplot(3, 1, 1);
plot(t, polarNRZ);
title(['Polar NRZ of  ' num2str(bits)]);

subplot(3, 1, 2);
plot(t, carrier);
title('carrier signal');

subplot(3, 1, 3);
plot(t, PSK);
title('PSK signal')
