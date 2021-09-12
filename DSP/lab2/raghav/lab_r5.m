clc;
close all;

%% 
%For Continuous Part

%Defining time window
t1=-2:0.01:3;
t2=-3:0.01:2;
%defining input signal
x1=sin(pi*t1);
x2=cos(pi*t2);

%Plotting signal 1
subplot(3,2,1);
plot(t1,x1);
xlabel('t');
ylabel('x1(t)');
grid on;
axis([-4 4 -1 1]);
title('Signal 1 n Continuous U19EC046');

%Plotting signal 2
subplot(3,2,3);
plot(t2,x2);
xlabel('t');
ylabel('x2(t)');
grid on;
axis([-4 4 -1 1]);
title('Signal 2 in Continuous U19EC046');

%Performing Padding.
t=min(min(t1),min(t2)):0.01:max(max(t1),max(t2));
y1=zeros(1,length(t));
y2=zeros(1,length(t));

y1((t>=min(t1) & t<=max(t1)))=x1();
y2((t>=min(t2) & t<=max(t2)))=x2();

%Adding signal1 and Signal 2.
y=y1+y2;

%Plotting summation of signal 1 and signal 2
subplot(3,2,5);
plot(t,y1+y2);
xlabel('t');
ylabel('x1(t)+x2(t)');
axis([-4 4 -1.414 1.414]);
title('Signal 1+2 DIFF RANGE U19EC046');


%%

%For Discrete Part

%time window
n1=-2:1:2;
n2=-3:1:0;
%defining input signal
x1=[-2 -1 0 1 2];
x2=[2 3 2 1];

%Plotting signal 1
subplot(3,2,2);
stem(n1,x1);
xlabel('n');
ylabel('x1(n)');
axis([-4 3 -3 3]);
title('Signal 1 in Discrete U19EC046');

%Plotting signal 2
subplot(3,2,4);
stem(n2,x2);
xlabel('n');
ylabel('x2(n)');
axis([-4 3 -3 4]);
title('Signal 2 in Discrete U19EC046');

%Performing Padding.
n=min(min(n1),min(n2)):1:max(max(n1),max(n2));
y1=zeros(1,length(n));
y2=zeros(1,length(n));

y1((n>=min(n1) & n<=max(n1)))=x1();
y2((n>=min(n2) & n<=max(n2)))=x2();

%Adding signal1 and Signal 2.
y=y1+y2;

%Plotting summation of signal 1 and signal 2
subplot(3,2,6);
stem(n,y);
xlabel('n');
ylabel('x1(n)+x2(n)');
axis([-4 3 -3 3]);
title('Signal 1+2 DIFF RANGE U19EC046');