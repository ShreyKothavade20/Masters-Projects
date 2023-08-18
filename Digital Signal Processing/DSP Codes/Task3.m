close all
clear
load 08_task3_x_d.mat
N=3;
mu=0.0001;
[y,e,w] = Lms2(x,d,N,mu); 

%w=w_mat(:,end)
%plot the learning curve
figure(1)
semilogy(e.^2),grid on;
figure
plot(w(1,:),w(2,:),'+')
xlabel("k \rightarrow");
ylabel("e^2[k] \rightarrow ");
%show final filter coefficient
h=w(:,end)

