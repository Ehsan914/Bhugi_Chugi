function mother_Gauss()
format long;
a=input('Enter a co-efficient Matrix A (eg,[10 3 1;3 10 2; 1 2 10]): ');
b=input('Enter right side Matrix B (eg, [19;29;35]): ');
xold=input('Enter initial Guess matrix X_0 (eg, [0;0;0]): ');
tol=input('Enter tolerance (eg, 1e-5): ');

[tab2,soln2]=gaussSeidel(a,b,xold,tol);

disp(tab2);

fprintf('Solution in Gauss Seidel method\n');
disp(soln2);

figure (1)
hold on
plot(tab2(:,1)', tab2(:,end)','b-*');
legend('Gauss Seidel Method');
xlabel('Iteration');
ylabel('Error');
hold off
end

function [tab,soln]=gaussSeidel(A,B,xold,tol)
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
        x(i)=(1/A(i,i))*(-fs-ss+B(i));
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
