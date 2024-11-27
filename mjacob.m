function mother_Jacobi()
format long;
a=input('Enter a co-efficient Matrix A (eg,[10 3 1;3 10 2; 1 2 10]): ');
b=input('Enter right side Matrix B (eg, [19;29;35]): ');
xold=input('Enter initial Guess matrix X_0 (eg, [0;0;0]): ');
tol=input('Enter tolerance (eg, 1e-5): ');

[tab1,soln1]=jacobi(a,b,xold,tol);

disp(tab1);

fprintf('Solution in Jacobi method\n');
disp(soln1);

figure (1)
hold on
plot(tab1(:,1)', tab1(:,end)','r-*');
plot(tab2(:,1)', tab2(:,end)','b-*');
plot(tab3(:,1)', tab3(:,end)','g-*');
legend('Jacobi Iterative Method','Gauss Seidel Method','SOR Method');
xlabel('Iteration');
ylabel('Error');
hold off


figure (2)
surf(soln1)

end

function [tab,soln]=jacobi(A,B,xold,tol)
n=size(A,1);
x=xold;
err=Inf;
k=0;
while any (err>tol)
    k=k+1;
    iteration(k)=k;
    xold=x;
    for i=1:n
        sum=0;
        for j=1:n
            if j~=i
                sum=sum+A(i,j)*xold(j);
            end
        end
        x(i)=(1/A(i,i))*(B(i)-sum);
    end
    table(k,:)=x;
    err=abs(xold-x);
    error(k)=max(abs(xold-x));
end
tab=[iteration' table error'];
soln=x';
end
