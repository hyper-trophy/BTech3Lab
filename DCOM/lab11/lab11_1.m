% clc; clear all;
M = 16;
% data = randi([0 15], 1, 4);
data = (0:15)';
[X, Y] = stairs(data);
plot(X, Y)
axis([0 11 0 16])
y = qammod(data, M);
scatterplot(y)
fc = 1000;

k = log2(M);
data = randi([0 15],100*k,1);

figure;
stairs(data)

eyediagram(txSig,2);

txSig = qammod(data,M);

rxSig = awgn(txSig,25);

rxData = qamdemod(rxSig, M);

figure;
stairs(rxData)

scatterplot(rxSig)

eyediagram(rxSig,2);

% cd = comm.ConstellationDiagram('ShowReferenceConstellation',false);
% cd(rxSig)




