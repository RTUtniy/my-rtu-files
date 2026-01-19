%% 4.2.
clc, clearvars,format compact, close all                 % notīra komandu logu, izdzēš visas mainīgās, kompaktāks izvads, aizver visas figūras

xpoints=[0:0.25:2];                                      % x vērtības ar soli 0.25 (datu punkti)
ypoints=[20.00 51.58 68.73 75.46 74.36 67.09 54.73 37.98 17.28]; % y vērtības (funkcijas vērtības tabulā)

plot(xpoints,ypoints,'or','LineWidth',3)                 % uzzīmē sākotnējos datu punktus (sarkani aplīši)
grid on                                                  % ieslēdz režģi
title('Datu punkti')                                     % grafika virsraksts

p = polyfit(xpoints,ypoints,1)                           % atrod 1. kārtas (lineārā) polinoma koeficientus
xapprox = 0:0.01:2; yapprox = polyval(p,xapprox);         % izveido blīvu x režģi un aprēķina polinoma vērtības

figure                                                   % atver jaunu figūru
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % uzzīmē datu punktus un lineāro aproksimāciju
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar pirmās kārtas polinomu'),grid on % virsraksts un režģis
fun_prob1(p)                                             % izdrukā polinomu pēc atrastajiem koeficientiem

% ----- Aproksimācija ar 2. kārtas polinomu -----
p = polyfit(xpoints,ypoints,2), yapprox = polyval(p,xapprox); % atrod 2. kārtas polinomu un tā vērtības
figure                                                   % jauna figūra
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % datu punkti un kvadrātiskais polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar otrās kārtas polinomu')          % virsraksts
grid on                                                  % režģis
fun_prob1(p)                                             % izdrukā 2. kārtas polinomu

p = polyfit(xpoints,ypoints,3)                           % atrod 3. kārtas polinomu
xapprox = 0:0.01:2; yapprox = polyval(p,xapprox);         % aprēķina polinoma vērtības jaunajā režģī
figure                                                   % jauna figūra
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % datu punkti un kubiskais polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar 3.kārtas polinomu'),grid on      % virsraksts un režģis
fun_prob1(p)                                             % izdrukā 3. kārtas polinomu

p = polyfit(xpoints,ypoints,4)                           % atrod 4. kārtas polinomu
xapprox = 0:0.01:2; yapprox = polyval(p,xapprox);         % aprēķina 4. kārtas polinomu
figure                                                   % jauna figūra
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % datu punkti un 4. kārtas polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar 4.kārtas polinomu'),grid on      % virsraksts un režģis
fun_prob1(p)                                             % izdrukā 4. kārtas polinomu

%% 4.3
clc, clearvars,format compact, close all                 % notīra komandu logu, izdzēš mainīgos, kompaktāks izvads, aizver figūras

xpoints=[1.0, 2.8, 4.2, 5.6, 7.1, 8.5, 10.2, 11.7];       % x vērtības no tabulas
ypoints=[- 0.85, 2.9, 3.5, 1.78, 3.07, 7.08, 8.52, 6.95];  % y vērtības no tabulas

plot(xpoints,ypoints,'or','LineWidth',3)                 % uzzīmē datu punktus (sarkani aplīši)
grid on                                                  % ieslēdz režģi
title('Datu punkti')                                     % grafika virsraksts

p = polyfit(xpoints,ypoints,1)                           % atrod 1. kārtas polinomu (lineārā aproksimācija)
xapprox = 1:0.01:11.7; yapprox = polyval(p,xapprox);     % izveido blīvu x režģi un aprēķina polinoma vērtības

figure                                                   % jauna figūra
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % dati + lineārā aproksimācija
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar pirmās kārtas polinomu'),grid on % virsraksts + režģis
fun_prob1(p)                                             % izdrukā pirmās kārtas polinomu

% --- Aproksimācija ar 2. kārtas polinomu ---
p = polyfit(xpoints,ypoints,2),                          % aprēķina 2. kārtas polinoma koeficientus
xapprox = 1:0.01:11.7; yapprox = polyval(p,xapprox);     % polinoma vērtības blīvā režģī
figure
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % dati + 2. kārtas polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar otrās kārtas polinomu')          % virsraksts
grid on                                                  % režģis
fun_prob1(p)                                             % izdrukā 2. kārtas polinomu

% --- Aproksimācija ar 3. kārtas polinomu ---
p = polyfit(xpoints,ypoints,3)                           % aprēķina 3. kārtas polinomu
xapprox =  1:0.01:11.7; yapprox = polyval(p,xapprox);    % vērtības blīvā režģī
figure
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % datu punkti + kubiskais polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar 3.kārtas polinomu'),grid on      % virsraksts un režģis
fun_prob1(p)                                             % izdrukā 3. kārtas polinomu

% --- Aproksimācija ar 4. kārtas polinomu ---
p = polyfit(xpoints,ypoints,4)                           % aprēķina 4. kārtas polinomu
xapprox =  1:0.01:11.7; yapprox = polyval(p,xapprox);    % vērtības blīvā režģī
figure
plot(xpoints,ypoints,'or',xapprox,yapprox,'k','LineWidth',3) % dati + 4. kārtas polinoms
legend('datu punkti','polinoms')                         % leģenda
title('Aproksimācija ar 4.kārtas polinomu'),grid on      % virsraksts un režģis
fun_prob1(p)                                             % izdrukā 4. kārtas polinomu

%% 4.5.
clc, clearvars,format compact, close all                 % notīra komandu logu, mainīgos; kompaktāks izvads; aizver visas figūras

xpoints = [3.3,3.8,4.5,5.4,6.1,6.8,7.5,8.2]';            % x punkti (kolonvektors, ' — transponēšana)
ypoints = [3.42,3.37,2.59,1.88,1.63,2.30,3.9,5.7]';      % y punkti (kolonvektors)

plot(xpoints,ypoints,'or','LineWidth',3)                 % uzzīmē datu punktus (sarkani aplīši)
grid on                                                  % ieslēdz režģi
title('Datu punkti')                                     % grafika virsraksts

% --- Aproksimācija ar trigonometrisko funkciju: y = a + b*sin(x) + c*cos(x)
ft = fittype({'1','sin(x)','cos(x)'});                   % definē bāzes funkciju tipu (1, sin x, cos x)
[p,reg] = fit(xpoints,ypoints,ft)                        % pielāgo parametrus (a,b,c); reg satur statistiku (piem., R^2)
figure                                                   
plot(p,xpoints,ypoints), grid on                         % parāda pielāgoto līkni kopā ar datiem
title('Aproksimācija ar trig. funkciju y = a + b*sinx + c*cosx') % virsraksts

% --- Aproksimācija ar paplašinātu funkciju: y = a + b*sin(x) + c*cos(x) + d*sin(2x)
ft = fittype({'1','sin(x)','cos(x)','sin(2*x)'});        % pievieno papildu bāzi sin(2x)
[p,reg] = fit(xpoints,ypoints,ft)                        % pielāgo parametrus (a,b,c,d); atjauno reg statistiku
figure
plot(p,xpoints,ypoints), grid on                         % parāda jauno pielāgoto līkni
title(['Aproksimācija ar trig. funkciju ', ...
       'y = a + b*sinx + c*cosx + d*sin2x'])             % virsraksts ar formulu

%% 4.9
clc, clearvars,format compact, close all                 % notīra logu, izdzēš mainīgos, aizver figūras

% Definējam funkciju f(x) (dotā formula uzdevumā)
f = @(x)(x.^3 + log(x.^2 + 2)) ./ (x.^3 + sqrt(x.*5 + 7) + 6);

xpoints = (0.2:0.3:2.9)'                                 % x vērtības intervālā [0.2; 2.9] ar soli 0.3
ypoints = f(xpoints)                                     % aprēķinām tabulas y vērtības

% Aproksimācijas funkcija: y = a + b*x + c*cos(x) + d*sin(2x)
ft = fittype({'1','x','cos(x)','sin(2*x)'});             % definē bāzes funkcijas aproksimācijai

[y,reg] = fit(xpoints,ypoints,ft)                        % atrod koeficientus (a, b, c, d) un regresijas statistiku

figure
plot(y,xpoints,ypoints)                                  % uzzīmē aproksimācijas līkni kopā ar punktiem
grid on
title('Aproksimācija ')                                  % virsraksts

% Aprēķina aproksimācijas kļūdu punktā x0 = 2.22
% (kā |y(x0) - f(x0)|)
x0 = 2.22;
apr_error = abs(y(x0) - f(x0))                           % absolūtā kļūda aproksimācijas punktā

%% 5.4.
clc, clearvars,format compact, close all                 % notīra komandu logu, izdzēš mainīgos, kompaktāks izvads, aizver figūras

syms t, y = @(t)(sqrt(1+t.^4));                          % simboliskais t (nav obligāts) un anonīmā funkcija y(t)=sqrt(1+t^4)
i = 0;                                                   % indeksa inicializācija tabulas veidošanai
for x = 0:0.25:3                                         % ejam cauri x no 0 līdz 3 ar soli 0.25
    i = i+1;                                             % palielinām rindu skaitītāju
    f(i) = integral(y,0,x);                              % aprēķinām f(x)=∫_0^x sqrt(1+t^4) dt (skaitliska integrācija)
end

xpoints = (0.0:0.25:3)';                                 % x vērtību kolonna
ypoints = f';                                            % atbilstošo f(x) vērtību kolonna

[p,reg] = fit(xpoints,ypoints,'poly2')                   % pielāgo 2. kārtas polinomu: p(x)=p1*x^2+p2*x+p3 (reg – statistika)
plot(p,xpoints,ypoints),grid on                          % uzzīmē polinomu kopā ar punktiem; ieslēdz režģi
title('Aproksimācija ar otrās kārtas polinomu')          % grafika virsraksts
% -> Ja vajag koeficientu pie x^2 (pēc jautājuma punktā 1.), tas ir p.p1   %

% 5.7. piemēra turpinājums (novērtējums dotajā punktā un kļūda)
pol_ver = p(1.65);                                       % polinoma vērtība x0=1.65
f_ver = integral(y,0,1.65);                              % īstās funkcijas f(x)=∫_0^x ... vērtība punktā x0=1.65
aproks_kluda = abs(pol_ver - f_ver)                      % aproksimācijas kļūda |p(x0) - f(x0)|

%% 5.5.
clc, clearvars,format compact, close all                 % notīra komandu logu, izdzēš mainīgos, aizver figūras

% Dotā funkcija f(x) = ∫_0^x (t + t^2) / (1 + t + sqrt(cos(t^2) + 3)) dt
syms t, y = @(t)( (t + t.^2) ./ (1 + t + sqrt(cos(t.^2) + 3)) );   % definē anonīmo funkciju integrandam

i = 0;                                                   % indeksa inicializēšana
for x = 0.2:0.15:1.7                                     % x vērtības intervālā [0.2; 1.7] ar soli 0.15
    i = i+1;                                             % rindas skaitītāja palielināšana
    f(i) = integral(y,0,x);                              % aprēķina f(x) kā noteikto integrāli no 0 līdz x
end

xpoints = (0.2:0.15:1.7)';                               % x vērtību kolonna
ypoints = f';                                            % f(x) vērtību kolonna

p = polyfit(xpoints,ypoints,3)                           % aproksimē datus ar 3. kārtas polinomu; atgriež koeficientus p
                                                         % p = [a b c d], kur polinoms ir a*x^3 + b*x^2 + c*x + d

pol_ver = polyval(p,1.32)                                % polinoma vērtība dotajā punktā x₁ = 1.32

%% Papildus funkcijas
% ===== Funkcija polinoma izdrukāšanai =====
function fun_prob1(koef)
m = length(koef);                                        % koeficientu skaits (polinoma kārta + 1)
fprintf('\n Atbilde. %.0f.kārtas polinoms: \n ',m-1)     % virsraksts: polinoma kārta
n = m-1;                                                 % sākam ar augstāko pakāpi
for i = 1:m                                              % iterācija cauri visiem koeficientiem
    if koef(i) < 0                                       % negatīvs koeficients – mīnuss jau ir klāt
        fprintf(' %.4fx^%.0f',koef(i),n)                 % izdrukā terminu ar negatīvu koeficientu
    else                                                 % pozitīvs koeficients
        fprintf(' +')                                    % izvada plusa zīmi
        fprintf('%.4fx^%.0f',koef(i),n)                  % izdrukā terminu
    end
    n = n-1;                                             % samazina pakāpi par 1
end
fprintf('\n')                                            % jauna rinda
end