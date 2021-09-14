d = input('Enter message signal : ');
g1 = input('Enter generator 1 matrix : ');
g2 = input('Enter generator 2 matrix : ');
c1 = conv(d, g1);
c2 = conv(d, g2);

code = zeros(1, length(c1)+length(c2));

for i = 1:length(c1)+length(c2)
    if mod(i, 2) == 0
        code(i) = c1(i/2);
    else
        code(i) = c2((i+1)/2);
    end
end

code = mod(code, 2);
disp(['codeword : ',num2str(code)]);