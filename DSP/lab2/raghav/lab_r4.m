clc;
close all;

%% 
%For Continuous Part

%Defining time window
t1=-2:0.01:2;
t2=-2:0.01:2;

%Defining Signals
x1=sin(pi*t1);
x2=cos(pi*t2);

%Plotting signal 1
subplot(3,2,1);
plot(t1,x1);
xlabel('t');
ylabel('x1(t)');
grid on;
axis([-3 3 -1 1]);
title('Signal 1 in Continuous U19EC046');

%Plotting signal 2
subplot(3,2,3);
plot(t1,x2);
xlabel('t');
ylabel('x2(t)');
grid on;
axis([-3 3 -1 1]);
title('Signal 2 in Continuous');

%Plotting summation of signals
x3=x1+x2;
subplot(3,2,5);
plot(t1,x3);
xlabel('t');
ylabel('x1(t)+x2(t)');
grid on;
axis([-3 3 -1.414 1.414]);
title('Signal 1+2 in Continuous');

%%

%For Discrete Part

%time window
n1=-2:1:2;
n2=-2:1:2;

%defining input signal
x1=[-2 -1 0 1 2];
x2=[1 2 0 -2 -1];

%Plotting signal 1
subplot(3,2,2);
stem(n1,x1);
xlabel('n');
ylabel('x1(n)');
axis([-3 3 -3 3]);
title('Signal 1 in Discrete U19EC046');

%Plotting signal 2
subplot(3,2,4);
stem(n2,x2);
xlabel('n');
ylabel('x2(n)');
axis([-3 3 -3 3]);
title('Signal 2 in Discrete');

%Plotting summation of signals
y=x1+x2;
subplot(3,2,6);
stem(n1,y);
xlabel('n');
ylabel('x1(n)+x2(n)');
axis([-3 3 -3 3]);
title('Signal 1+2 in Discrete');