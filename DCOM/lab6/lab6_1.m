clc; clear all; 
%% Hamming Coding
data=input('Enter data bits : ') 
k = length(data) ; % no. of information symbols
n = 2^3 - 1 ; % codeword length
p = n - k ; % no.of parity bits
disp('parity check matrix');
H = hammgen(p) % parity check matrix
parity = H(1:p,p+1:n); 
disp('generator matrix');
G = [eye(k),parity'] % generator matrix
c = data * G ; % codeword
disp('codeword');
c = mod(c,2)