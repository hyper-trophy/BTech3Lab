function Xk=idft_function(y)

N = length(y);
for n = 0:N-1
    for k = 0:N-1
        Wn=exp(1i*2*pi*k*n/N)/N;
        X1(n+1,k+1)=Wn;
    end
end

Xk=X1*y;
