clear;
close all;
Len=1000;
x=ones(Len,1)*2;
d=ones(Len,1);
n=1E-4*randn(Len,1);
d=d+n;
N=2;
mu=0.01;
[y,e,w] = lms2(x,d,N,mu);
figure
semilogy(e.^2),grid on;

figure
plot(w(1,:),w(2,:),'+');
xlabel("coefficient vector 1");
ylabel("coefficient vector 2 ");
function [y,e,w]=lms2(x,d,N,mu)
iter=length(x);
y=zeros(iter,1);
e=zeros(iter,1);
w=zeros(N,iter+1);
x_w=zeros(N,1);        %input signal vector

for i=1:iter
% output signal y
x_w=[x(i);x_w(1:end-1)];
y(i)=w(:,i).'*x_w;
%error signal
e(i)=d(i)-y(i);
%filter coefficient update
w(:,i+1)=w(:,i)+mu*e(i)*x_w;
end