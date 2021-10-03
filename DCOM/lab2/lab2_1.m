n = input('Enter number of Symbols : ');    %read number of symbols
p = zeros(1,n);                             %initialize probability vector

for i = 1:n                                 %read probabilities
    p(i) = input(['Enter probability p(' num2str(i) ') : ']);
end

res = -sum(p.*log2(p));                     %calculate entropy

disp(['Entropy = ' num2str(res)]);          %display result