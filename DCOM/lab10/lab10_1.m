clc; clear all;

bits = input('Enter bit sequence :');

if isempty(bits)
    bits = randi([0 1], 1, 8);
end

bitOdd = bits(1: 2: end);
bitEven = bits(2: 2: end);

op = waveGen(bits, 1);
polarNrz = op{1};
t = op{2};

opOdd = waveGen(bitOdd, 2);
polarNrzOdd = opOdd{1};

opEven = waveGen(bitEven, 2);
polarNrzEven = opEven{1};

sin_ = -sin(2*pi*t);
cos_ = cos(2*pi*t);

oddSignal = polarNrzOdd.*cos_;
evenSignal = polarNrzEven.*sin_;

QPSK = oddSignal + evenSignal;

subplot(6, 1, 1)
plot(t, polarNrz)
title(['bit sequence [' num2str(bits) ']'])

subplot(6, 1, 2)
plot(t, polarNrzOdd)
title(['odd bit sequence [' num2str(bitOdd) ']'])

subplot(6, 1, 3)
plot(t, oddSignal)
title(['odd Signal'])

subplot(6, 1, 4)
plot(t, polarNrzEven)
title(['for bit sequence [' num2str(bitEven) ']'])

subplot(6, 1, 5)
plot(t, evenSignal)
title(['Even signal'])

subplot(6, 1, 6)
plot(t, QPSK)
title(['QPSK'])
