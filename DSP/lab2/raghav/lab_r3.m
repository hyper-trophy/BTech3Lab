clc;
close all;

%% 
%For Continuous Part

t=-1:0.01:1;%time window
x=sin(pi*t); %defining input signal

%plotting Original signal
subplot(2,2,1);
plot(t,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-2 2 -1 1]);
title('Original Signal U19EC046 in Continuous');

%plotting Reversed signal
subplot(2,2,3);
plot(-t,x);
grid on;
xlabel('t');
ylabel('x(-t)');
axis([-2 2 -1 1]);
title('Reversed Signal in Continuous');

%%

%For Discrete Part
n=-2:1:2;%time window
x=[-2 -1 0 1 2];%defining input signal

%plotting Original signal
subplot(2,2,2);
stem(n,x);
xlabel('n');
ylabel('x(n)');
axis([-3 3 -3 3]);
title('Original Signal U19EC046 in Discrete');

%plotting Reversed signal
subplot(2,2,4);
stem(-n,x);
xlabel('n');
ylabel('x(n)');
axis([-3 3 -3 3]);
title('Reversed Signal in Discrete');