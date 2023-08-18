clear;
close all;
Len=1000;
N=1;
x=ones(Len,1)*2;
mu=0.5;
d=ones(Len,1);
y=Lms1(x,d,N,mu);
plot([x,y,d]);
axis([-5,1500,-5,4]);

