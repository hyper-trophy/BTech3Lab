clc;
close all;

%% 
%For Continuous Part
t=-1:0.01:1;%time window
x=sin(pi*t);%defining input signal

%plotting Original signal
subplot(3,2,1);
plot(t,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-2 2 -1 1]);
title('Original Signal U19EC046 in Continuous');

%plotting Expanded signal
subplot(3,2,3);
plot(t*2,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-3 3 -1 1]);
title('Expanded Signal by 2 in Continuous');

%plotting Compressed signal
subplot(3,2,5);
plot(t/2,x);
grid on;
xlabel('t');
ylabel('x(t)');
axis([-2 2 -1 1]);
title('Compressed Signal by 2 in Continuous');

%%

%For Discrete Part

n=-4:2:4;%time window
x=[-2 -1 0 1 2];%Defining Input signal

%plotting Original signal
subplot(3,2,2);
stem(n,x);
xlabel('n');
ylabel('x(n)');
axis([-8 8 -3 3]);
title('Original Signal in Discrete U19EC046');

%plotting Expanded signal
subplot(3,2,4);
stem(n*2,x);
xlabel('n');
ylabel('x(n)');
axis([-9 9 -3 3]);
title('Expanded Signal by 2 in Discrete');

%plotting Compressed signal
subplot(3,2,6);
stem(n/2,x);
xlabel('n');
ylabel('x(n)');
axis([-4 4 -3 3]);
title('Compressed Signal by 2 in Discrete');
