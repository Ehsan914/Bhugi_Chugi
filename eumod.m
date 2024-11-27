%Euler Modified Method
clc;
f = input('Enter the function :');
x0 = input('Enter the initial value of x :');
x_end = input('Enter the final value of x :');
y0 = input('Enter the initial value of y :');
h = input('Enter the step size :');
x = x0:h:x_end;
y = zeros(1,length(x));
f1 = zeros(1,length(x));
y(1) = y0;
for i = 1:(length(x)-1)
    y_p = y(i) + h*f(x(i),y(i));
    y(i+1) = y(i) + (h/2)*(f(x(i),y(i)) + f(x(i+1),y_p));
    f1(i) = f(x(i),y(i));
end 
f1(end) = f(x(end),y(end));
X = x.';
Y = y.';
F1 = f1.';
T = table(X,Y,F1);
disp(T);
fprintf('The required solution is : %f \n',y(end));
figure;
plot(x,y,'-o','LineWidth',1.5);
xlabel('x');
ylabel('y');
title('Euler modified method');

   
