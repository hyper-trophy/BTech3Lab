clc;
close all;

%% Taking Input
% data
d = input('Enter data bits : ');

%Shift Register initially set to 000.
shift_initial=[0 0 0];

%creating a shift vector
shift = [d,shift_initial];

%a stores the state of shift register table in transpose form
a=zeros(3,length(shift));

%initialising the column of D0.
for i=1:length(shift)
    a(1,i)=shift(i);
end
%shift once to get D1,D2.
for i=2:3
    for j=2:length(shift)
        if j==length(shift)
            a(i,1)=a(i-1,j);
        else
            a(i,j)=a(i-1,j-1);
        end
    end
end

%% calculating outputs v1,v2 based on logic
v1=zeros(1,length(shift));
v2=v1;
for i=1:length(shift)
    v1(i)=mod(a(1,i)+a(3,i),2);
    v2(i)=mod(a(1,i)+a(2,i)+a(3,i),2);
end
%displaying outputs state matrix, v1,v2.
disp([' D0' ' D1' ' D2' ' v1' ' v2'])
for i=1:length(D)
    disp([' ' num2str(D(i,:)) '  ' num2str(v1(i)) '  ' num2str(v2(i))]);
end

%% Concatenating v1,v2 to get code word

%neglection last row of v1,v2.
len = length(v1)+length(v2)-2;
c=zeros(1,len);
for i=1:len
    if mod(i,2)==0
        c(i)=v2(i/2);
    else
        c(i)=v1((i+1)/2);
    end
end
disp('code word');
disp(c);

