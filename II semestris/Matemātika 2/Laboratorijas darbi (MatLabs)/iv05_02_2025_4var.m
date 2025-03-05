% 4. variants
%% 1. uzdevums
clc, clearvars, close all

y=@(x)(1+tan(x+2/x))^(1/4)+x.^(4)*(1+sin(3*x)^2)
x_0=1.25;

pirma_ua = y(x_0)

%% 2. uzdevums
clc, clearvars, close all

y=@(x)log(2*tan(pi*x) + x.^2);
Dk = 1:1.2:13;
Vk=y(Dk);
disp('x interv.  y vert.')
disp([Dk' Vk'])

%% 3. uzdevums
clc, clearvars, close all

y=@(x)x.^3*exp(cos(5*x))-x^(4/7);
x_start=0;
x_end=3;
fplot(y, [x_start x_end])

%% 4. uzdevums
clc, clearvars, close all

y_1=@(x)atan(x)^3-3;
y_2=@(x)atan(x-3)^3;
x_start = -2;
x_end = 2;

fplot(y_1, [x_start x_end], "--k", "LineWidth", 1), hold on
fplot(y_2, [x_start x_end], ":r", "LineWidth", 1.5), hold off
legend('y_1', 'y_2')

%% 5. uzdevums
clc, clearvars, close all

syms t;
x(t)=cos(t)^4
y(t)=t*sin(2*t)
t_start = 0;
t_end = 2*pi;

fplot(x(t), y(t), [t_start t_end], "--m"), hold on

y=@(x)(3*x^2+1)/(2-cos(x))
x_start = 0;
x_end = 2;

fplot(y, [x_start x_end], ":k"), hold off
title("2 funkciju grafiki");
xlabel('x-ass');
ylabel('y-ass');