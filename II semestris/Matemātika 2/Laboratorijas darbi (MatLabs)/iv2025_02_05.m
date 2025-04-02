clc, clearvars, format short
%% 2.a

% % īsā forma
% format short
% atbilde_a=(787/9)+(453/13)
% % garā forma
% format long
% atbilde_a
% %25-zīmju forma
% atbilde_a=vpa(atbilde_a, 25)

%% 2.b
% atbilde_b = (1/5)+(1/7)+(1/9)
% atbilde_b = sym(atbilde_b)

%% Skaitliskās funkcijas
% y=@(x)x^(1/3) % kubsaknes funkcijas definējums
% y_vert_skaitl=y(9)
% y_vert_precizi=y(sym(9))

%% vektorfunkcijas

% y=@(x)x.^2
% A=[1 2;3,4]
% y=(A)

%% simboliskā funkcija

% syms x;
% y(x)=x^(1/3);
% y_vert_precizi = y(9)
% y_vert_skaitl = double(y(9))

%% 3

% syms x;
% f(x)=(atan(sqrt(x))^3)/(x^2) + (log(cot(5*x)))/(3*x*sqrt(x));
% x_0 = f(0.5)
% x_0prec = double(x_0)

%% 4

syms x;
f(x)=sqrt(cos(x)^2+x^(3/4));
x_vert=1:2:21;
vert=double(f(x_vert));
disp('x_vērtības   funkcijas_vērtības')
disp([x_vert' vert'])