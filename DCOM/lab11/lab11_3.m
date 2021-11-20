clc;
clear all;
close all;
t= -10:0.1:10;
a=[0 0.5 1]; % Alpha
w=1; % bandwidth
subplot(1,2,1);
for x = 1:3
    p_t = (sinc(2*w*t).*cos(2*pi*a(x)*w*t))./(1-(16*(a(x).^2)*(w^2)*(t.^2)));
    plot(t,p_t,'LineWidth',2)
    legendInfo{x} = ['alpha = ' num2str(a(x))];
    legend(legendInfo)
    hold on;
    grid on;
end
title('Time Domain');
xlabel('t');
ylabel('Amplitude');
hold off;
subplot(1,2,2);
f=-10:0.1:10;
for i= 1:3
    p_t = (sinc(2*w*t).*cos(2*pi*a(i)*w*t))./(1-(16*(a(i).^2)*(w^2)*(t.^2)));
    p_f = abs(fftshift(fft(p_t)));
    plot(f,p_f,'LineWidth',2)
    legendInfo{i} = ['alpha = ' num2str(a(i))];
    hold on;
    grid on;
end

title('Frequency Domain');
xlabel('frequency');
ylabel('Amplitude');
legend(legendInfo);