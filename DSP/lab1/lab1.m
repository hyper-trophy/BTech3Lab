clc;
close all;
t=-10:0.01:10;%time window
fm=1/4;%Analog Frequency

%code for plotting input signal
x=cos(2*pi*fm*t);%input signal
subplot(2,2,1);
plot(t,x);
xlabel('Time in Seconds-->');
ylabel('x(t)');
title('Continuous Signal');

%code for plotting fs<Nquist Rate
fs1=1.2*fm;%sampling freuqncy
n=-5:1:5;%defining time range
xn1=cos(2*pi*n*fm/fs1);
subplot(2,2,2);
stem(n,xn1);
hold on;
plot(n,xn1);
xlabel('n-->');
ylabel('X(n)');
title('Under Sampling');

%code for plotting fs=Nquist Rate
fs2=2*fm;%sampling freuqncy
xn2=cos(2*pi*n*fm/fs2);
subplot(2,2,3);
stem(n,xn2);
hold on;
plot(n,xn2);
xlabel('n-->');
ylabel('X(n)');
title('Perfect Sampling');

%code for plotting fs>Nquist Rate
fs3=10*fm;%sampling freuqncy
n=-10:1:10;%defining time range
xn3=cos(2*pi*n*fm/fs3);
subplot(2,2,4);
stem(n,xn3);
hold on;
plot(n,xn3);
xlabel('n-->');
ylabel('X(n)');
title('Over Sampling');