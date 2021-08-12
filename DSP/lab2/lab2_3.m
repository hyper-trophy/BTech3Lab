n1=-2:1:6;
x1= [1 2 3 4 5 4 3 2 1] ;

n2=-5:1:3;
x2=[2 1 0 -1 -2 -1 0 1 2];

n=min(min(n1) , min(n2)) : max(max(n1) , max(n2)) ;
yl= zeros(1, length(n));
y2= zeros(1, length(n));

yl ( (n>=min(n1) ) & (n<=max(n1) ) )=x1();
y2 ( (n>=min(n2) ) & (n<=max(n2) ) )=x2();
x=yl+y2;

subplot (3, 1, 1);
stem ( n1, x1) ;
xlabel (' time sample' ) ;
ylabel ( ' amplitude' ) ;
title ( 'x1 signal') ;
axis ( [-8 8 0 5]) ;

subplot (3, 1, 2);
stem ( n2, x2) ;
xlabel (' time sample' ) ;
ylabel ( ' amplitude' ) ;
title ( 'x2 signal') ;
axis ( [-8 8 -5 5]) ;


subplot (3, 1, 3);
stem ( n, x) ;
xlabel (' time sample' ) ;
ylabel ( ' amplitude' ) ;
title ( 'summed signal') ;
axis ( [-8 8 0 10]) ;

