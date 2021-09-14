d = input('Enter message signal : ');
g1 = input('Enter generator 1 matrix : ');
g2 = input('Enter generator 2 matrix : ');

d0 = padarray(d, [0, len(d)], 0, 'post');
d1 = circshift(d0, 1);
d2 = circshift(d1, 1);

