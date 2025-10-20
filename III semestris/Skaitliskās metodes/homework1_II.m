%% 1. uzdevums                   %%GA
clc, clearvars, format compact
A = [1,7,2,2;
    2,14,4,2;
    5,9,9,3];
syms x1 x2 x3 x4
X = [x1;x2;x3;x4];
B = [5;4;3];

Aaug = [A B];
sol = sym(rref(Aaug))

% slinkums noformēt, bet nolasot matricas datus var redzēt, ka x4=3
% (pēdējā rinda), bet x2 tiks reizināts ar x3 koeficientu ar pretējo zīmi,
% jo tas tiks pārvietots vienādojuma otrajā pusē ─ šajā gadījumā zīmi ir -
% šiem nosacījumiem atbilst tikai viens variants

%% 2. uzdevums                   %%HO
clc, clearvars, format compact

A = [4,1,3,-2;
    1,5,2,4;
    3,2,8,3;
    -2,4,3,12];
B = [-2;3;5;4];
L=chol(A, 'lower');
disp(L(3,3))

%% 3. uzdevums                   %%GA
clc, clearvars, format compact

A = [1,0.1,-1;
    3,0,2;
    4,-2,5];
syms x1 x2 x3;
X = [x1;x2;x3];
B = [-1;13;24];

Aaug = [A B];
C = sym(rref(Aaug));

% latex formātā pieraksts, kas apraksta funkcijas pārveidošanas secību
% \sqrt{1+x+x^2}y+\arctg(x^2+4)-(\cos^2x+e^{\sqrt x})y=\ln(1+x^3)\\
% \sqrt{1+x+x^2}y-(\cos^2x+e^{\sqrt x})y=\ln(1+x^3)-\arctg(x^2+4)\\
% y(\sqrt{1+x+x^2}-(\cos^2x+e^{\sqrt x}))=\ln(1+x^3)-\arctg(x^2+4)\\
% y=\frac{\sqrt{1+x+x^2}-(\cos^2x+e^{\sqrt x})}{\ln(1+x^3)-\arctg(x^2+4)}

y=@(x)((1+x+x^2)^0.5-(cos(x))^2+exp(x^0.5))/(log(1+x^3)-atan(x^2+4));
disp(double(y(C(1))))

%% 4. uzdevums                   %%LU
clc, clearvars, format compact
A = [-1,2,3,6;
    0,1,-6,2;
    4,6,5,0;
    9,-2,-3,4];
B=[3;4;-2;-1];

[L,U,P] = lu(A);

% L*U*x=P*B -> {L*y=P*B \land U*x=y

Y = L\(P*B);
disp(Y(4))

%% 5. uzdevums                   %%GA
clc, clearvars, format compact
A = [-3,1,3,1,5;
    6,1,1,3,1;
    0,2,1,-5,1];
syms x1 x2 x3 x4 x5;
X = [x1;x2;x3;x4;x5];
B = [3;2;1];

Aaug = [A B];
sol = sym(rref(Aaug));
x_gen=sol(:,6)-sol(:,5).*x5-sol(:,4).*x4;
x_part=subs(subs(x_gen, x4, -1.02), x5, 3.11);
x2=double(x_part(2))

