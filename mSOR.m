function mother_SOR()
format long;
a=input('Enter a co-efficient Matrix A (eg,[10 3 1;3 10 2; 1 2 10]): ');
b=input('Enter right side Matrix B (eg, [19;29;35]): ');
xold=input('Enter initial Guess matrix X_0 (eg, [0;0;0]): ');
tol=input('Enter tolerance (eg, 1e-5): ');
w=input('Enter parameter for SOR method, w (eg, 1.25): ');

[tab3,soln3]=sor(a,b,xold,tol,w);

disp(tab3);

fprintf('Solution in SOR method\n');
disp(soln3);

figure (1)
hold on
plot(tab3(:,1)', tab3(:,end)','g-*');
legend('SOR Method');
xlabel('Iteration');
ylabel('Error');
hold off
end

function [tab,soln]=sor(A,B,xold,tol,w)
n=size(A,1);
x=zeros(n,1);
k=1;
err=Inf;
while err>tol
    for i=1:n
        fs=0;
        ss=0;
        for j=1:i-1
            fs=fs+A(i,j)*x(j);
        end
        for j=i+1:n
            ss=ss+A(i,j)*xold(j);
        end
        x(i)=(1-w)*xold(i)+(1/A(i,i))*(w*(-fs-ss+B(i)));
    end
    iteration(k)=k;
    temp(k,:)=xold;
    err=abs(xold-x);
    error(k)=max(err);
    xold=x;
    k=k+1;
end
tab=[iteration' temp error'];
soln=xold';
end
