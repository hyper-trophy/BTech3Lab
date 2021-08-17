clc;

%Probabilty of Inputs
PX=zeros(1,2);
PX(1)=input('Enter probabilty for input x1');
PX(2)=1-PX(1);

%Error probabilty
p=input('Enter error probability');

%Channel Matrix
PC=[1-p p;p 1-p];

%Probabilty of Output
PY=PX*PC;

%Calculating Entropy
H=0;
for i=1:length(PY)
    H=H+PY(i)*log2(PY(i));
end

H=-H;

%Calculating Mutual Information
I=H+p*log2(p)+(1-p)*log2(1-p);

%displaying
disp('oinput matrix P(X):');
disp(PX);

disp('Channel matrix P(Y/X):');
disp(PC);

disp('output matrix P(Y):');
disp(PY);

disp('Entropy of output H(Y): ');
disp(H);

disp('Mutual Information is ');
disp(I);