clc;
close all;

%% 
%For Continuous Part

t=-2:0.01:2; %time window
x=sin(2*pi*t); %defining input signal

%plotting Original signal
subplot(3,2,1);
plot(t,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-4 4 -1 1]);
title('Original Signal in Continuous U19EC046');

%plotting Advanced signal
subplot(3,2,3);
plot(t+2,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-4 4 -1 1]);
title('Advanced Signal by 2 in Continuous');

%plotting Delayed signal
subplot(3,2,5);
plot(t-2,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-4 4 -1 1]);
title('Delayed Signal by 2 in Continuous');

%%

%For Discrete Part

n=-2:1:2;%time window
x=[-2 -1 0 1 2];%defining input signal

subplot(3,2,2);
stem(n,x);
xlabel('n');
ylabel('x(n)');
axis([-4 4 -3 3]);
title('Original Signal in Discrete U19EC046');

subplot(3,2,4);
stem(n+2,x);
xlabel('n');
ylabel('x(n)');
axis([-5 5 -3 3]);
title('Advanced Signal by 2 in Discrete');

subplot(3,2,6);
stem(n-2,x);
xlabel('n');
ylabel('x(n)');
axis([-5 5 -3 3]);
title('Delayed Signal by 2 in Discrete');