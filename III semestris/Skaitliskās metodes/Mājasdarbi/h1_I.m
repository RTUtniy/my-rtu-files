%% 1. uzdevums                   %%LU
clc, clearvars, format compact
A=[4,1,3,-2;1,5,2,4;3,2,8,3;-2,4,3,12];
B=[-2;3;5;4];
syms x;
f(x)=(x^3+log(3*x+2))/(x^2+(3*x+5)^0.5+x);
L=chol(A, 'lower');
disp(L)
disp(L(2,2))
disp(double(f(L(2,2))))

%% 2. uzdevums                   %%LU
clc, clearvars, format compact
A=[-2,4,7,1;1,0,-4,6;2,7,1,9;0,4,3,5];
[L,U,P] = lu(A);
disp(L(3,2))

%% 3. uzdevums                   %%GA
clc, clearvars, format compact
A = [1,2, 1,-3;
    -1,1, 3, 0;
     3,4,-1, 6;
     4,3,-4, 6];
B = [7;4;5;1];
Aaug = [A B]; sol=sym(rref(Aaug))
syms x_4; 
x_gen=sol(1,5)-sol(1,4).*x_4-sol(:,3)
x_part=subs(x_gen,x_4,1.27)
x1=x_part(1);
disp(double(x1))

%% 4. uzdevums                   %%GA
clc, clearvars, format compact
A = [1,1,-2, 1,1;
     1,2,-2, 4,2;
     1,2,-2,-1,3];
B = [6;3;2];
Aaug = [A B]; sol=sym(rref(Aaug))
syms x_5; syms x_3;
x_gen=sol(:,6)-sol(:,5)*x_5-sol(:,3).*x_3

%% 5. uzdevums                   %%GA
clc, clearvars, format compact
A = [1,2,3,0;
     0,1,3,1;
     4,1,1,1;
     1,1,0,5];
B = [8;15;11;23];
Aaug = [A B]; sol=rref(Aaug)