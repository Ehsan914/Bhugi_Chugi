%Euler Method 
clc;
f = input('Enter the function :');
x0 = input('Enter the initial value of x :');
x_end = input('Enter the final value of x :');
y0 = input('Enter the initial value of y :');
h = input('Enter the step size :');
x = x0:h:x_end;
y = zeros(1,length(x));
new_y = zeros(1,length(x));
y(1) = y0;
f1 = zeros(1,length(x));
for i = 1 : length(x)
    if i < length(x)
        y(i+1) = y(i) + h*f(x(i),y(i));
        new_y(i) = y(i+1);
    else
        new_y(i) = y(i) + h*f(x(i),y(i));
    end 
    f1(i) =  f(x(i),y(i));
end
X = x.';
Y = y.';
F1 = f1.';
New_Y = new_y.';
T = table(X,Y,F1,New_Y);
disp(T);
figure;
plot(x , y , '-o','LineWidth',1.5);
xlabel('x');
ylabel('y');
title('Euler Method');
grid on;
