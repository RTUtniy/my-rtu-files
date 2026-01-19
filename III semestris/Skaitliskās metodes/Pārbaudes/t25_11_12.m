%% 1. uzdevuns
clc, clearvars, format compact, close all
f = @(t)( (2+cos(t.^2+3)) ./ (1+sqrt(sin(3*t+2))) );
i = 0;
for x = 0.3:0.3:1.8
    i = i+1;
    t(i) = integral(f,0,x);
end

xpoints = (0.3:0.3:1.8)';
ypoints = t';

p = polyfit(xpoints,ypoints,2);
pol_ver = polyval(p,0.57)

%%
% 
% $${\tt pol\_ver}=0,3238\cdot0,1175i$$
% 

%% 2. uzdevums
clc, clearvars, format compact, close all
f = @(x)( atan(2+sin(x)+sin(2*x)) .* sqrt(2+log(x)) );
i = 0;
for x = 2:1:8
    i = i+1;
    t(i) = integral(f,0,x);
end

cspline = spline((2:1:8),t);
x_1 = 6.1;

f_approx = ppval(cspline,x_1);
approx_error = abs(f_approx - integral(f, 0, x_1));

%%
% 
% $${\tt approx\_error} = 0,0288$$
% 


%% 3. uzdevums
clc, clearvars, format compact, close all
f = @(x) 1 ./ ( 1 + x.^3 + sqrt(log(x+3)) );
i = 0;
for x = 1:0.2:2.8
    i = i+1;
    t(i) = integral(f,0,x);
end

xpoints = (1:0.2:2.8)';
ypoints = t';

p = polyfit(xpoints,ypoints,2);
x_0 = 1.32;
pol_ver = polyval(p,x_0);
f_ver = integral(f,0,x_0);
aproks_kluda = abs(pol_ver - f_ver);

%%
% 
% Aproksimācijas kļūda punktā $$x_0=1,32$$ ir 0,0047
% 

%% 4. uzdevums
clc, clearvars, format compact, close all
f = @(x) atan(1 + x + x.^3);
i = 0;
for x = 1:2:9
    i = i+1;
    t(i) = integral(f,0,x);
end

%% 5. uzdevums
clc, clearvars, format compact, close all
f = @(x)( atan(1 + x) .* log(3 + (1 + x.^2).^(1/3)) );
i = 0;
for x = 3:1:8
    i = i+1;
    t(i) = integral(f,0,x);
end