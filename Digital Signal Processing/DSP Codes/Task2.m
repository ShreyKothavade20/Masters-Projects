clear;
close all;
Len=1000;
x=ones(Len,1)*2;
d=ones(Len,1);
n=1E-4*randn(Len,1);
%d=d+n;
N=2;
mu=0.01;
[y,e,w] = Lms2(x,d,N,mu);    
figure
semilogy(e.^2),grid on;
figure
plot(w(1,:),w(2,:),'+');
xlabel("k---->");
ylabel("coefficient vector 2 ");

