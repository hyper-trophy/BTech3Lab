M=16;
k=log2(M);
S_nr=3:1:13;
B_er=(1/k)*3/2*erfc(sqrt(k*0.05*(10.^(S_nr/10))));

semilogy (S_nr,B_er);
hold on
grid on
xlabel('SNR dB')
ylabel('BER')
title('BER VS SNR')