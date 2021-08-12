
%user inputs for frequenct and amplitede
fm=input('Enter Signal frequency : ');
Am=input('Enter Signal Amplitude : ');

%0.01 spaced time array 
t=(-1/fm):0.01:(1/fm);

%original signal
x=Am*cos(2*pi*fm*t);

%plots
subplot(2,2,1);
plot(t,x);
xlabel('Time');
ylabel('x(t)');
title('Continuous Signal');

%fs < 2fm undersampling case
fs_under=1.2*fm;
n=(-1/fm):1:(1/fm);
xn_under=Am*cos(2*pi*n*fm/fs_under);
subplot(2,2,2);
stem(n,xn_under);
hold on;
% plot(n,xn_under, 'LineWidth',2);
plot(t,Am*cos(2*pi*t*fm/fs_under) , 'LineWidth', 1)
xlabel('n');
ylabel('X(n)');
title('Under Sampling');

%fs = 2fm ideal case
fs_ideal=2*fm;
xn_ideal=Am*cos(2*pi*n*fm/fs_ideal);
subplot(2,2,3);
stem(n,xn_ideal);
hold on;
% plot(n,xn_ideal, 'LineWidth',2);
plot(t,Am*cos(2*pi*t*fm/fs_ideal) , 'LineWidth', 1)
xlabel('n');
ylabel('X(n)');
title('Perfect Sampling');

%fs > 2fm oversampling case
fs_over=12*fm;
% n=-20:1:20;
xn_over=Am*cos(2*pi*n*fm/fs_over);
subplot(2,2,4);
stem(n,xn_over);
hold on;
% plot(n,xn_over, 'LineWidth',2);
plot(t,Am*cos(2*pi*t*fm/fs_over) , 'LineWidth', 1)
xlabel('n-->');
ylabel('X(n)');
title('Over Sampling');