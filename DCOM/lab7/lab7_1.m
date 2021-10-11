clc;
clear all;

g = input('enter the generator matrix:')

[k,n] = size(g);
disp(['order of the linear block code (n,k) = (' num2str(n) ',' num2str(k) ')'])

disp('possible data:')
u = dec2bin(0 : 1 : 2^k-1);
d = u - '0'

disp('the possible codewords are:')
c = rem(u*g,2)

d_min = min(sum((c(2:2^k,:))'));
disp(['the minimum hamming distance dmin for given block code = ' num2str(d_min)])

r = input('enter the received code word:');

disp('H transpose Matrix : ')
p=[g(:,k+1:n)];
ht=[p;eye(n-k)]

s=rem(r*ht,2);
disp(['syndrome of a given codeword is:' num2str(s)])

for i=1:1:size(ht)
    if (ht(i,1:3)==s)
        r(i)=1-r(i);
        break;
    end
end

disp(['the error is in bit:' num2str(i)])
disp(['the corrected codeword is:' num2str(r)])
