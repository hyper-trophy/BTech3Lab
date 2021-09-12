clc
n=0:7;
N=8;

x = cos (2*pi*n./N);
h = sin(2*pi*n./N);
disp( 'First Sequence is' );
disp(x);

disp( 'Second Sequence is');
disp(h);
y=zeros(1, N);
for n=1:N
    for m=1:N
        z=mod( n-m, N);
        y(n)=y(n)+x(m)*h(z+1) ;
    end
end

disp('Circular Convolution without inbuild functions is' );
disp(y);
z=cconv(x, h, N);
disp('Circular Convolution with inbuild functions is');
disp(z)