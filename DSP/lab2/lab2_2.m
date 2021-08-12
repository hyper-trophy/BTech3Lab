n=0:4;
x= [0 1 2 3 3 ] ;

subplot (3, 1, 1) ;
stem (n, x) ;
xlabel (' time sample' ) ;
ylabel ( ' amplitude' ) ;
title ('original signal')
axis ( [-8 8 0 4]) ;

m=fliplr(x) ;
t1=-fliplr(n) ;
subplot (3, 1, 2) ;
stem ( t1, m) ;
xlabel (' time sample' ) ;
ylabel ( ' amplitude' ) ;
title ( 'reversed signal') ;
axis ( [-8 8 0 4]) ;
