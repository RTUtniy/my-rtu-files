%% 6.6. uzd
clc, clearvars, close all
syms x y z;

izteiksme = x+x^2*y^2+x*z+x^2*y-x^2*y*z+y*z;

izteiksme_sagrupeta = collect(izteiksme, x)
f(x) = subs(izteiksme_sagrupeta, [y,z], [3,2])
fplot(f(x), [-12 12], '--g', 'LineWidth', 3)

%% Kraukļa 1. uzdevums
clc, clearvars, close all
format rational

A=[2/3,3/4,4/5,5/6];
disp(kr1(A))

%% 7.4. uzd
clc, clearvars, close all
syms x;

y = exp(-5*x)*(cos(2*x)-3*sin(2*x))

yppp = simplify(diff(y, 3))

%% 7.8. uzd
clc, clearvars, close all
syms x;

izt = x/((x+4)^(1/4));
kr_r = -3;
lab_r = 12;

disp(int(izt, x, kr_r, lab_r))                   % analītiski
disp(integral(matlabFunction(izt), kr_r, lab_r)) % skaitliski

%% 7.10. uzd
% RJIB!
clc, clearvars, close all

syms y(x)
Dy = diff(y, x);
diffur = Dy*(1-x^2)^(1/2)+y == asin(x);
y_part = dsolve(diffur, y(0)==0)
fplot(y_part)

%% 7.11. uzd
clc, clearvars, close all

syms y(x)
Dy  = diff(y, x);
D2y = diff(y, 2, x);
diffur = D2y-2*Dy == exp(x)*(x^2+x-3);
y_part = dsolve(diffur, y(0)==2, Dy(0)==2)
ypp(x) = diff(y_part, 2, x);
disp(ypp(3))
disp(double(ypp(3)))