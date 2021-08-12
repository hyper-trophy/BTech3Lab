n = input('Enter number of Symbols : ');
p = zeros(1,n);

for i = 1:n
    p(i) = input(['Enter probability p(' num2str(i) ') : ']);
end

res = -sum(p.*log2(p));

disp(['Entropy = ' num2str(res)]);