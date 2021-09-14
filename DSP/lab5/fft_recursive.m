function y = fft_recursive(P)
    n = length(P);
    if n == 1
        y = P;
        return;
    end

    w = exp(-2*pi*1i/n);

    Podd = P(1:2:end);
    Peven = P(2:2:end);

    yodd = fft_recursive(Podd);
    yeven = fft_recursive(Peven);

    y = zeros(1, n);
    for k = 1:n/2
        y(k) = yodd(k) + w^(k-1)*yeven(k);
        y(k+n/2) = yodd(k) - w^(k-1)*yeven(k);
    end
end