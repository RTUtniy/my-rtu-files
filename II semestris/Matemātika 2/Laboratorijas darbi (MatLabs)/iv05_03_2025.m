%% 3. uzdevums
clc, clearvars, close all
syms t;
a=0.3;
x=(cos(t))/((1+a^2*t^2)^(1/2))
y=(sin(t))/((1+a^2*t^2)^(1/2))
z=(a*t)/((1+a^2*t^2)^(1/2))

t_start = -12*pi;
t_end = 12*pi;

fplot3(x, y, z, [t_start t_end], "-r", "LineWidth", 2)
title("3D Līnija");
xlabel('x-ass');
ylabel('y-ass');
zlabel('z-ass');


%% 4. uzdevums
clc, clearvars, close all

[x,y] = meshgrid(-10:0.1:10, -10:0.1:10);
z = sin((x.^2 + y.^2 + 4).^(1/2))./ (x.^2 + y.^2 + 4).^(1/2)
mesh(x,y,z)
title('Caurspīdīga virsma')
xlabel('x-ass')
ylabel('y-ass')
zlabel('z-ass')

%% 5. uzdevums

clc, clearvars, close all

[t,u] = meshgrid(0:0.1:2*pi, -0.5*pi:0.1:0.5*pi);
x = 5*cos(t).*cos(u)
y = 3*sin(t).*cos(u)
z = 7*sin(u)
surf(x,y,z)
title('Necaurspīdīga virsma')
xlabel('x')
ylabel('y')
zlabel('z')
view([1 -1 3])