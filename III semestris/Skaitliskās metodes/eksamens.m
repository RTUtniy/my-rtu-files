%% 1. LINEĀRU VIENĀDOJUMU SISTĒMAS
%{

  (a) TIEŠĀS METODES: rref / LU / chol / QR / trīsd faktorizācija
  (b) ITERĀCIJU METODES: vienkāršā iterācija (tau no eig) / Jakobi / minimālās nesaistes

%}
%% 1(a) GAUSA METODE (rref) — Ax=b, rangs, noteikta/nenoteikta/nesaderīga
clc, clearvars, format compact, close all

A = [  2  -3   4   2;     % <-- ieliec savu A
       3   5  -3   1;
       2   4   7   1;
       5   1  -3   4];
B = [2; 1; 3; 5];         % <-- ieliec savu B

Aaug = [A B];
rankA = rank(A)
rankAaug = rank(Aaug)
R = rref(Aaug)

% Ja rankA == rankAaug == n -> ir viens atrisinājums
% Ja rankA == rankAaug < n  -> bezgalīgi daudz (parametri)
% Ja rankA < rankAaug       -> nav atrisinājuma

%% 1(a) LU METODE (lu) — Ax=b (ar P)
clc, clearvars, format compact, close all

A = [ 2  1  1;             % <-- ieliec savu A
      1 -4  3;
      3  2  2];
B = [7; 2; 13];            % <-- ieliec savu B

if det(A)==0
    disp('Singulāra A -> LU neder'), return
end

[L,U,P] = lu(A);
Y = L\(P*B);
X = U\Y

res_norm2 = norm(B - A*X, 2)

%% 1(a) HOĻECKA (CHOLESKY) (chol) — Ax=b (A simetriska + pozitīvi definēta)
clc, clearvars, format compact, close all

A = [ 1  2  6;             % <-- ieliec savu A (parasti simetriska)
      2  7  3;
      6  3 64];
B = [7; 2; 13];            % <-- ieliec savu B

if ~isequal(A, A.')
    disp('A nav simetriska -> chol neder'), return
end

% (vienkārša PD pārbaude pēc galvenajiem minoriem)
ok = 1;
for i=1:size(A,1)
    if det(A(1:i,1:i)) <= 0
        ok = 0; break
    end
end
if ok==0
    disp('A nav pozitīvi definēta -> chol neder'), return
end

L = chol(A,'lower');
Y = L\B;
X = (L')\Y

res_norm2 = norm(B - A*X, 2)

%% 1(a) QR METODE (qr) — atrast R elementu / risināt Ax=b
clc, clearvars, format compact, close all

A = [ 4  5  1  6;          % <-- ieliec savu A
      3 -1  2  8;
      2  2  5  7;
     -2  4 -1  6];

[Q,R] = qr(A);

% (1) Ja prasa konkrētu elementu (piem., r22):
r22 = R(2,2)

% (2) Ja prasa risināt Ax=b ar QR:
b = [1;2;3;4];             % <-- ieliec savu b
x_qr = R\(Q'*b)

res_norm2 = norm(b - A*x_qr, 2)

%% 1(a) FAKTORIZĀCIJAS METODE trīsd diagonālai sistēmai (Thomas)
clc, clearvars, format compact, close all

n = 5;                     % <-- maini n
a = [0 1 1 1 1];            % apakšdiagonāle, a(1)=0
b = [3 3 3 3 3];            % diagonāle
c = [1 1 1 1 0];            % virsdiagonāle, c(n)=0
d = [1;1;1;1;1];            % labā puse

ksi = zeros(1,n+1);
eta = zeros(1,n+1);

for i = 1:n
    denom = b(i) - a(i)*ksi(i);
    ksi(i+1) = c(i)/denom;
    eta(i+1) = (a(i)*eta(i) - d(i))/denom;
end

X = zeros(n,1);
X(n) = eta(n+1);
for i = n-1:-1:1
    X(i) = ksi(i+1)*X(i+1) + eta(i+1);
end

disp(X)
res_norm2 = norm(d - (diag(b)+diag(c(1:end-1),1)+diag(a(2:end),-1))*X, 2)

%% 1(b) VIENKĀRŠĀ ITERĀCIJU METODE: x_{k+1} = x_k + \tau*(B - A x_k)
% tau parasti ņem no eig(A): tau = 2/(lam_min+lam_max) (SPD gadījumam)
clc, clearvars, format compact, close all

A = [ 5  5  7 10;          % <-- ieliec savu A
      5 11 10  2;
      7 10 121 8;
     10  2  8 33];
B = [9; 8; 1; 6];          % <-- ieliec savu B
x = zeros(size(B));        % <-- X(0)
iters = 14;                % <-- iterāciju skaits

e = eig(A);
tau = 2/(min(e) + max(e)); % <-- ja vajag, ieliec savu tau

for k = 1:iters
    x = x + tau*(B - A*x);
end

Xs = linsolve(A,B);
nesaistes_norma = norm(Xs - x, 2)

%% 1(b) JAKOBI METODE: x^{k+1} = D^{-1}(B - (A-D)x^k)
clc, clearvars, format compact, close all

A = [ 2 -3  4  2;          % <-- ieliec savu A
      3  5 -3  1;
      2  4  7  1;
      5  1 -3  4];
B = [2;1;3;5];             % <-- ieliec savu B
x = [-2;1;1;-1];           % <-- X(0)
iters = 11;                % <-- iterāciju skaits

D = diag(diag(A));
R = A - D;

for k = 1:iters
    x = D\(B - R*x);
end

disp(x)
res_norm2 = norm(B - A*x, 2)

%% 1(b) MINIMĀLĀS NESAISTES METODE: x_{k+1} = x_k + \tau_k \cdot r_k, r_k = B - A \cdot x_k
% tau_k = ( (A r_k, r_k) ) / ||A r_k||^2
clc, clearvars, format compact, close all

A = [5 6 8;                % <-- ieliec savu A
     6 25 4;
     8 4 30];
B = [-1; -2; 7];           % <-- ieliec savu B
x = zeros(size(B));        % <-- X(0)
iters = 12;                % <-- iterāciju skaits

for k = 1:iters
    r = B - A*x;
    Ar = A*r;
    tau = (Ar'*r) / (norm(Ar)^2);
    x = x + tau*r;
end

% Ja prasa konkrētu komponenti (piem., x3):
% x3 = x(3)
res_norm2 = norm(B - A*x, 2)

%% 2. INTERPOLĀCIJA
%{
 (a) Polinomi: Ņūtons (dalītās starpības), Lagrange (nav vajadzīgs, bet vari)
 (b) Splaini: interp1 (linear/spline/pchip)
%}

%% 2(a) ŅŪTONA INTERPOLĀCIJA (dalītās starpības) + p_n(x0)
clc, clearvars, format compact, close all

xnodes = 2.4:0.2:3.2;      % <-- ieliec savus mezglus
ynodes = [1 2 3 4 5];      % <-- ieliec savas vērtības (jābūt tādam pašam garumam)

x0 = 2.96;                 % <-- kur jāaprēķina p_n(x0)

n = numel(xnodes);
dd = ynodes(:);
coef = zeros(n,1);
coef(1) = dd(1);

for j = 2:n
    dd = (dd(2:end) - dd(1:end-1)) ./ (xnodes(j:end)' - xnodes(1:end-j+1)');
    coef(j) = dd(1);
end

pn = coef(1);
prodterm = 1;
for j = 2:n
    prodterm = prodterm * (x0 - xnodes(j-1));
    pn = pn + coef(j)*prodterm;
end

pn = round(pn,4)

%% 2(b) SPLAINI interp1 (linear / spline / pchip) + vērtība y(x0)
clc, clearvars, format compact, close all

xnodes = 2.4:0.2:3.2;      % <-- ieliec mezglus
ynodes = [1 2 3 4 5];      % <-- ieliec vērtības
x0 = 2.96;                 % <-- punkts

y_linear = interp1(xnodes, ynodes, x0, 'linear');
y_spline = interp1(xnodes, ynodes, x0, 'spline');
y_pchip  = interp1(xnodes, ynodes, x0, 'pchip');

y_linear = round(y_linear,4)
y_spline = round(y_spline,4)
y_pchip  = round(y_pchip,4)

%% 3. APROKSIMĀCIJA (fit / fittype)
%{ 
 (a) Polinoms (polyfit vai fit('polyN'))
 (b) Citas funkcijas: a + b*x + c*sin(x), exp, u.c.
%}

%% 3(a) APROKSIMĀCIJA AR POLINOMU (polyfit) + kļūda punktā x0
clc, clearvars, format compact, close all

xpoints = (0.5:0.2:2.7)';   % <-- dati x
ypoints = [1;2;3;4;5;6;7;8;9;10;11;12]; % <-- dati y (garumiem jāatbilst)

deg = 2;                    % <-- polinoma pakāpe
p = polyfit(xpoints, ypoints, deg)

x0 = 1.33;                  % <-- punkts kļūdai
y_ap = polyval(p, x0)

% ja ir "īstā" funkcija f(x), ieliec:
f = @(x) x;                  % <-- nomaini uz īsto f(x), ja vajag
err = abs(y_ap - f(x0))

%% 3(a) APROKSIMĀCIJA AR fit('polyN') (ja gribi tieši fit)
clc, clearvars, format compact, close all

xpoints = (0.5:0.2:2.7)';    % <-- dati x
ypoints = [1;2;3;4;5;6;7;8;9;10;11;12]; % <-- dati y

deg = 2;                     % <-- pakāpe
p = polyfit(xpoints, ypoints, deg)

%% 3(b) APROKSIMĀCIJA: y = a + b*x + c*sin(x)
clc, clearvars, format compact, close all

xpoints = (0.5:0.2:2.7)';    % <-- dati x
ypoints = [1;2;3;4;5;6;7;8;9;10;11;12]; % <-- dati y

% Dizaina matrica (bāzes funkcijas)
Phi = [ ...
    ones(size(xpoints)), ...   % 1
    xpoints, ...               % x
    sin(xpoints) ...           % sin(x)
];

% Mazāko kvadrātu metode: Phi * c ≈ y
coeffs = Phi \ ypoints;

a = coeffs(1)
b = coeffs(2)
c = coeffs(3)

% Aprēķins punktā x0
x0 = 1.33;
y0 = a + b*x0 + c*sin(x0)

%% 4. SKAITLISKĀ INTEGRĒŠANA (integral)

%% NOTEIKTS INTEGRĀLIS integral + vienādojums ar integrāli (f(b)=0)
clc, clearvars, format compact, close all

g = @(x) log(1 + x.*sqrt(x) + sin(x));   % <-- integrands
a = 1.5;                                 % <-- apakšrobeža
b = 2.0;                                 % <-- augšrobeža (vai mainīgais)

I = integral(g, a, b)
I = round(I, 6)

% Ja vajag atrast b: integral(a,b) = C  => f(b)= integral(...) - C
C = 0.5;                                  % <-- konstante
f = @(bb) integral(g, a, bb) - C;

%% 5. NELINEĀRU VIENĀDOJUMU UN SISTĒMU RISINĀŠANA
%{
 (a) Ņūtona metode (1 mainīgais)
 (b) Sekantu metode (1 mainīgais)
 (c) Ņūtona metode sistēmai (2 mainīgie) (vispārīgs šablons)
%}

%% 5(a) ŅŪTONA METODE (vienādojumam f(x)=0)
clc, clearvars, format compact, close all

f  = @(x) x.^3 - 2*x - 5;     % <-- nomaini f(x)
df = @(x) 3*x.^2 - 2;         % <-- nomaini f'(x)

x = 2;                        % <-- x(0)
iters = 10;                   % <-- iterācijas
epsi = 1e-4;                  % <-- precizitāte

for k = 1:iters
    x_new = x - f(x)/df(x);
    if abs(x_new - x) < epsi
        x = x_new; break
    end
    x = x_new;
end

x = round(x,4)

%% 5(b) SEKANTU METODE (hordu metode) f(x)=0
clc, clearvars, format compact, close all

f = @(x) x.^3 - 2*x - 5;      % <-- nomaini f(x)
x0 = 1;                       % <-- 1. sākumpunkts
x1 = 3;                       % <-- 2. sākumpunkts
epsi = 1e-4;
iters = 200;

f0 = f(x0); f1 = f(x1);
for k = 1:iters
    x2 = x1 - f1*(x1 - x0)/(f1 - f0);
    if abs(x2 - x1) < epsi
        break
    end
    x0 = x1; f0 = f1;
    x1 = x2; f1 = f(x1);
end

x2 = round(x2,4)

%% 5(c) ŅŪTONA METODE SISTĒMAI (2 mainīgie) — 2 iterācijas / eps
clc, clearvars, format compact, close all

% Ieliec F(x,y) un J(x,y)
% Piemērs:
% F1 = x^5 + y^5 + 10 = 0
% F2 = x^2/4 + y^2/6 - 1 = 0

x = 1.5;                      % <-- x(0)
y = -1.5;                     % <-- y(0)
iters = 2;                    % <-- iterāciju skaits (vai līdz eps)

for k = 1:iters
    F = [x^5 + y^5 + 10;
         x^2/4 + y^2/6 - 1];

    J = [5*x^4, 5*y^4;
         x/2,   y/3];

    delta = J\F;
    x = x - delta(1);
    y = y - delta(2);
end

x = round(x,4)
y = round(y,4)

%% 6. KOŠĪ PROBLĒMA (ODE) — ode45
%{
 (a) 1. kārtas ODE: y' = f(x,y)
 (b) 1. kārtas sistēma: Y' = F(x,Y)
 (c) 2. kārtas ODE: y'' + p(x)y' + q(x)y = r(x)
 (d) 3. kārtas ODE: y'' + p(x)y' + q(x)y = r(x)
%}

%% 6(a) 1. KĀRTAS ODE: y' = f(x,y), y(x0)=y0, atrast y(x*)
clc, clearvars, format compact, close all

f = @(x,y) x - y;             % <-- nomaini uz savu y' = f(x,y)
xspan = [0 2];                % <-- intervāls
y0 = 1;                       % <-- sākuma nosacījums y(x0)

opts = odeset('RelTol',1e-9,'AbsTol',1e-12);
sol = ode45(@(x,y) f(x,y), xspan, y0, opts);

xstar = 1.45;                 % <-- punkts
y_star = deval(sol, xstar);
y_star = round(y_star(1),4)

%% 6(b) 1. KĀRTAS SISTĒMA: Y' = F(x,Y), Y(x0)=Y0, atrast Y(x*)
clc, clearvars, format compact, close all

F = @(x,Y) [ Y(2);
            -Y(1) + x];       % <-- nomaini uz savu sistēmu
xspan = [0 2];
Y0 = [1; 0];                  % <-- sākuma vektors

opts = odeset('RelTol',1e-9,'AbsTol',1e-12);
sol = ode45(F, xspan, Y0, opts);

xstar = 1.45;
Ystar = deval(sol, xstar);
Ystar = round(Ystar,4)

%% 6(c) 2. KĀRTAS ODE: y'' + p(x)*y' + q(x)*y = r(x), y(x0)=y0, y'(x0)=v0
clc, clearvars, format compact, close all

p = @(x) 3 + cos(1 + x.^2);          % <-- p(x)
q = @(x) log(1 + x + x.^2);          % <-- q(x)
r = @(x) (1 - x)./(1 + x.^2);        % <-- r(x)

F = @(x,Y) [ Y(2);
             r(x) - p(x).*Y(2) - q(x).*Y(1) ];

xspan = [2 5];                        % <-- intervāls
Y0 = [7; 11];                         % <-- [y(x0); y'(x0)]

opts = odeset('RelTol',1e-7,'AbsTol',1e-9);
sol = ode45(F, xspan, Y0, opts);

xstar = 4.15;                          % <-- punkts
Ystar = deval(sol, xstar);
y_star = round(Ystar(1),4)
yprime_star = round(Ystar(2),4)

%% 6(d) 2. KĀRTAS ODE: y''' + p(x)*y'' + q(x)*y' + r(x)y = z(x), y(x0)=y0, y'(x0)=v0, y''(x0)=w0
clc, clearvars, format compact, close all

p = @(x) 2 + x + x.^3;               % <-- p(x)
q = @(x) 3 + atan(sqrt(x));          % <-- q(x)
r = @(x) log(4+x);                   % <-- r(x)
z = @(x) 1+x.^2;                     % <-- z(x)

F = @(x,Y) [ Y(3);
             Y(2);
             z(x) - p(x).*Y(3) - q(x).*Y(2) - r(x).*Y(1) ];

interval = [0 6];                        % <-- intervāls
Y0 = [1; 2; 5];                          % <-- [y(x0); y'(x0); y''(x0)]

epsi = 1e-4;                             % epsilons, precizitāte
opts = odeset('AbsTol', epsi);
sol = ode45(F, interval, Y0, opts);

xstar = 4.38;                          % <-- punkts
Ystar = deval(sol, xstar);
y_star = round(Ystar(1),4)
yprime_star = round(Ystar(2),4)

%% * "Noteikt reālo sakņu skaitu" sistēmai: praktiskais skenēšanas šablons
% Ideja: izsaki y no 2. vienādojuma (ja var) vai parametrize (piem. aplis),
% tad atrod saknes 1D funkcijai un saskaiti.
clc, clearvars, format compact, close all

% Piemērs: { x^2/9 + y^2 = 3
%            cos(3x) + y = 1 }
y_of_x = @(x) 1 - cos(3*x);
F = @(x) x.^2/9 + (y_of_x(x)).^2 - 3;

xmin = -sqrt(27);
xmax =  sqrt(27);

N = 50000;
xs = linspace(xmin, xmax, N);
fs = F(xs);

roots_x = [];
for i = 1:(N-1)
    f1 = fs(i); f2 = fs(i+1);
    if ~isfinite(f1) || ~isfinite(f2), continue, end
    if f1 == 0
        roots_x(end+1,1) = xs(i); %#ok<AGROW>
    elseif f1*f2 < 0
        xr = fzero(F, [xs(i) xs(i+1)]);
        roots_x(end+1,1) = xr; %#ok<AGROW>
    end
end

roots_x = sort(roots_x);
tol = 1e-6;
uniq = [];
for i = 1:numel(roots_x)
    if isempty(uniq) || abs(roots_x(i)-uniq(end)) > tol
        uniq(end+1,1) = roots_x(i); %#ok<AGROW>
    end
end

Atbilde = numel(uniq)   % reālo sakņu skaits

%% FAKTORIZĀCIJAS METODE (trīsdiaģonāla sistēma)
% JA uzdevumā rakstīts:
% “Atrisināt lineāru vienādojumu sistēmu ar faktorizācijas metodi”
% un dota sistēma ar 3 diagonālēm
clc, clearvars, format compact, close all

% -----------------------------
% Sistēmas koeficienti:
% a_i * x_{i-1} + b_i * x_i + c_i * x_{i+1} = d_i
% -----------------------------

a = [0  1  1  1  1];      % apakšdiagonāle (a1 = 0!)
b = [4  4  4  4  4];      % galvenā diagonāle
c = [1  1  1  1  0];      % virsdiagonāle (c_n = 0!)
d = [5; 6; 6; 6; 5];      % labā puse

n = length(b);

% -----------------------------
% Tiešais gājiens (forward sweep)
% -----------------------------
ksi = zeros(n+1,1);
eta = zeros(n+1,1);

for i = 1:n
    denom = b(i) - a(i)*ksi(i);
    ksi(i+1) = c(i)/denom;
    eta(i+1) = (a(i)*eta(i) - d(i))/denom;
end

% -----------------------------
% Atpakaļgājiens (back substitution)
% -----------------------------
x = zeros(n,1);
x(n) = eta(n+1);

for i = n-1:-1:1
    x(i) = ksi(i+1)*x(i+1) + eta(i+1);
end

x   % atrisinājums

% -----------------------------
% (Pēc izvēles) pārbaude
% -----------------------------
A = diag(b) + diag(c(1:end-1),1) + diag(a(2:end),-1);
res_norm2 = norm(d - A*x, 2)

