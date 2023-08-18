function y=Lms1(x,d,N,mu)
iter=length(x);
y=zeros(iter,1);

w=0;    %all zero column vector of length N (implemented by us)


for i=1:iter
% output signal y
y(i)=x(i)*w;
% error signal  e has to be obtained
e=d(i)-y(i);
%update filter coefficients
w=w+mu*e*x(i);
end
