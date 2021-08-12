
n=0:4;
x=[1 2 3 2 1];

subplot (5, 1, 1);
stem (n, x);
xlabel ('time sample');
ylabel ('amplitude');
title ('original signal')
axis ( [-1 8 0 4]) ;

subplot (5, 1, 2);
m=n+1 ;
stem (m, x);
xlabel ('time sample');
ylabel ('amplitude');
title ('positive shift')
axis ( [-1 8 0 4]) ;

subplot (5, 1, 3);
m=n-1 ;
stem (m, x);
xlabel ('time sample');
ylabel ('amplitude');
title ('negetive shift')
axis ( [-1 8 0 4]) ;

subplot (5, 1, 4) ;
m=n.*2;
stem (m, x) ;
xlabel('time sample') ;
ylabel('amplitude') ;
title('time scaling') ;
axis([-1 8 0 4]) ;

subplot(5, 1, 5) ;
m=n./2;
stem (m, x) ;
xlabel('time sample') ;
ylabel('amplitude') ;
title('Time scaling') ;
axis([-1 8 0 4]) ;



