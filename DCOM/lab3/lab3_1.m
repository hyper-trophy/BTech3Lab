clc;

%error probability vector
p1 = 0.001:0.001:1;

%Channel capacity vector calculation
Ci = zeros(1,length(p1));
for i=1:length(p1)
    Ci(i)=1+p1(i)*log2(p1(i))+(1-p1(i))*log2(1-p1(i));
end

% plotting channel capacity vs erro probabilty 
plot(p1,Ci);
grid on;
title('Channel Capacity vs Error Probability');
xlabel('Error Probability');
ylabel('Channel Capacity');
axis([0 1 0 1.1]);