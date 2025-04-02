%% plot funkcijas iespēju testēšana
syms x;
y(x) = x^3;
x_0 = -2;
x_1 = 2;
fplot(y, [x_0 x_1])

%% UPR 1.
clc, clearvars, format compact, close all

syms x;
y = @(x)2*atan(2*x+3)^2;
x_0 = -2*pi;
x_1 = pi;
fplot(y, [x_0 x_1])

%% UPR 2.
clc, clearvars, format compact, close all

syms t;
x = @(t)2*cos(3*t);
y = @(t)3*sin(2*t);
t_0 = -1*pi;
t_1 = pi;
fplot(x, y, [t_0 t_1])

%% UPR 3.
clc, clearvars, format compact, close all

syms x;
y = @(x)3*cos(2*x.^2);
z = @(x)3*cos(2*x)^2;
x_0 = -4;
x_1 = 4;
fplot(y, [x_0 x_1]), hold on
fplot(z, [x_0 x_1]), hold off

%% UPR 4.
clc, clearvars, format compact, close all
syms x;
y = @(x)cos(2.^x);
x_0 = -2*pi;
x_1 =  2*pi;
fplot(y, [x_0 x_1], '-rx', 'LineWidth', 2)

%% UPR 6.
clc, clearvars, format compact, close all

syms t;
x1 = @(t)2*cos(t)^2+cos(t);
y1 = @(t)sin(2*t)+sin(t);

x2 = @(t)-1*cos(t)-2*cos(0.5*t);
y2 = @(t)-1*sin(t)+2*sin(0.5*t);

t_0 = -1*pi;
t_1 =    pi;

fplot(x1, y1, [t_0 t_1], '-g', 'LineWidth', 3), hold on
fplot(x2, y2, [t_0 t_1], '-b', 'LineWidth', 4), hold off
grid on
title('Divu parametriski doto funkciju grafiki')
legend('x1(t) y1(t)', 'x2(t) y2(t)')
xlabel('x-ass')
ylabel('y-ass')
%% UPR 7.

clc, clearvars, format compact, close all

syms x;
f1(x) = sqrt(sin(x+2*x.^2)^3 + (3*x.^5)^(1/3));
f2(x) = log(x.^2 + 1)+sqrt(x);

x_0 = 2;
x_1 = 12;
x_mezgli = x_0:1:x_1;
y_mezgli = double(f1(x_mezgli));
disp('x_mezgli   y_mezgli')
disp([x_mezgli' y_mezgli'])

fplot(f1(x_mezgli), [x_0 x_1], 'ko', 'LineWidth', 3), hold on
fplot(f2, [x_0 x_1], '-r', 'LineWidth', 3), hold off
grid on
legend('y=f_1(x)', 'y=f_2(x)')
%% UPR 10.