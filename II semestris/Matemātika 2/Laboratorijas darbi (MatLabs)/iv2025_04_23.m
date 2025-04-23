%% 1. uzdevums
clc, clearvars, close all

syms x;
izteiksme = (x-1)^3*(x^2+1)^2;
disp(expand(izteiksme))

%% 2. uzdevums
clc, clearvars, close all

syms a;
izteiksme = ((a^0.5 + a)/(a^0.5 + 1) - 2*a^0.5 - 1)*(1-a^0.5);
disp(simplify(izteiksme))

%% 4. uzdevums
clc, clearvars, close all

syms x y z;
[x, y, z] = solve(2*(x+y)==x*y*z, 6*(y+z)==5*x*y*z, 3*(x+z)==2*x*y*z);
disp([x y z])

%% 5. uzdevums
clc, clearvars, close all

syms x y z;
izteiksme = x + x*y + x*z + x^2*y - x^2*y*z + x*y*z;
x_kol = collect(izteiksme, x)
y_kol = collect(izteiksme, y)
xy_kol = collect(izteiksme, [x,y])

%% 7. uzdevums
clc, clearvars, close all

syms x;
izteiksme = x^6-7*x^2-6*x^4+6*x^3+60+45*x-3*x^5;
sadal = factor(izteiksme)
reiz = 1;
for n=1:1:size(sadal)
    reiz = reiz * sadal(n);
end
disp(reiz)
