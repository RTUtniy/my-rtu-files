%% Levickas ievads

% Jakoba metode - svarīga štelle
% Kontroldarbā būs 3 Gausa, 2 Jakobi uzdevumi
% ChatGPT izmantošana ir ok, izņemot kontroldarbu laikā

%% Uzdevumi patstāvīgai risināšanai
% 2.1. - 2.5.uzdevumi ( 64. - 68.lpp.)

%% 2.3. uzdevums                   %%JA
clc, clearvars, format long
A = [13,10,13;10,8,10;13,10,14];  B = [2;22;3];
if det(A) == 0
    disp('Matrica A ir singulārā ')
    disp('Atbilde: Jakobi metodi nedrīkst izmantot'), return
end
disp('Matrica A ir nesingulārā')
fun_prob3(A)  % pârbaude: Jakobi metode konverģē

x_app = zeros(3,1);  % sākuma tuvinājums 
iter = 0;            % iterāciju skaits
itermax = 25;        % maksimālais iterāciju skaits
epsi = 0.001;        % epsi=10^(-3) (aprēķinu precizitāte)
errnorm = 1;         % kļūdas norma
prnorm = zeros(1,2); % datu masīvs rezultātu saglabāšanai
k = 1;

while errnorm > epsi && iter < itermax 
    k = k+1;  iter  = iter+1;
    for rowIndex = 1:3
      res_sum = 0;
      for columnIndex = 1:3
         if columnIndex~=rowIndex
           res_sum =res_sum+x_app(columnIndex,k-1)*A(rowIndex,columnIndex);
         end
      end
      x_app(rowIndex,k) = (B(rowIndex,1)-res_sum)/A(rowIndex,rowIndex);
    end
    errnorm  =norm(x_app(:,k)-x_app(:,k-1));
    prnorm(iter,:) =[iter,errnorm];
end

table(prnorm, 'VariableNames', "Iter.numurs      Kļūda")
x_approx = x_app(:,k)
x_sol = linsolve(A,B)

[row,col] = size(prnorm);
disp('Atbilde:')
fprintf(' iterāciju skaits = %.0f\n',prnorm(row,1)) 
fprintf(' kļūda = %.6f\n' ,prnorm(row,2))
fprintf(' x_tuvinājumi : { %.4f , %.4f, %.4f }\n',x_approx(:)')
disp(" Jakobi metode diverģē")

%% 2.4. uzdevums                   %%JA
clc, clearvars, format long
A = [2,14,10;
     14,2,8;
     10,8,2];
B = [8;
     6;
     2];

if det(A) == 0
    disp('Matrica A ir singulārā ')
    disp('Atbilde: Jakobi metodi nedrīkst izmantot'), return
end
disp('Matrica A ir nesingulārā')
fun_prob3(A)  % pârbaude: Jakobi metode konverģē

x_app = zeros(3,1);  % sākuma tuvinājums 
iter = 0;            % iterāciju skaits
itermax = 13;        % maksimālais iterāciju skaits
epsi = 0.001;        % epsi=10^(-3) (aprēķinu precizitāte)
errnorm = 1;         % kļūdas norma
prnorm = zeros(1,2); % datu masīvs rezultātu saglabāšanai
k = 1;

% uzdevuma jautājumi
normepsilon_11 = 0;
normepsilon_10 = 0;
normepsilon_13 = 0;

while errnorm > epsi && iter < itermax 
    k = k+1; iter = iter+1;
    for rowIndex = 1:3
      res_sum = 0;
      for columnIndex = 1:3 % sigma
         if columnIndex~=rowIndex
           res_sum = res_sum + x_app(columnIndex, k-1) * A(rowIndex, columnIndex);
         end
      end
      x_app(rowIndex,k) = (B(rowIndex,1) - res_sum)/A(rowIndex,rowIndex); % x_i^(n)
    end
    errnorm = norm(x_app(:,k) - x_app(:,k-1));
    if k == 11
        normepsilon_11 = errnorm
    end
    if k == 10
        normepsilon_10 = errnorm
    end
    if k == 13
        normepsilon_13 = errnorm
    end
    prnorm(iter,:) = [iter,errnorm];
end

disp(table(prnorm, 'VariableNames', "Iter.numurs      Kļūda"))

x_approx = x_app(:,k)
x_sol = linsolve(A, B)
fprintf("norm(x_sol-x^10) = %.4f\n", norm(x_sol - x_app(:, 10)))

[row,col] = size(prnorm);
disp(prnorm)
disp('Atbilde:')
fprintf(' iterāciju skaits = %.0f --> kļūda = %.6f\n',prnorm(row,1),prnorm(row,2)) 
fprintf(' iterāciju skaits = %.0f --> kļūda = %.6f\n',prnorm(row-2,1),prnorm(row-2,2))
fprintf(' x_tuvinājumi : { %.4f , %.4f, %.4f }\n',x_approx(:)')
%% 2.5. uzdevums                   %%JA
clc, clearvars, format long
A= [14,3,8;
    3,12,7;
    8,7,17];
B= [5;
    2;
    6];

if det(A) == 0
    disp('Matrica A ir singulārā ')
    disp('Atbilde: Jakobi metodi nedrīkst izmantot'), return
end
disp('Matrica A ir nesingulārā')
fun_prob3(A)  % pârbaude: Jakobi metode konverģē

x_app = zeros(3,1);  % sākuma tuvinājums 
iter = 0;            % iterāciju skaits
itermax = 9;        % maksimālais iterāciju skaits
epsi = 0.001;        % epsi=10^(-3) (aprēķinu precizitāte)
errnorm = 1;         % kļūdas norma
prnorm = zeros(1,2); % datu masīvs rezultātu saglabāšanai
k = 1;

% uzdevuma jautājumi
epsilon_6 = 0;
epsilon_5 = 0;
epsilon_9 = 0;


% turpinâjums
while errnorm > epsi && iter < itermax 
    k = k+1;  iter  = iter+1;
    for rowIndex = 1:3
      res_sum = 0;
      for columnIndex = 1:3
         if columnIndex~=rowIndex
           res_sum =res_sum+x_app(columnIndex,k-1)*A(rowIndex,columnIndex);
         end
      end
      x_app(rowIndex,k) =(B(rowIndex,1)-res_sum)/A(rowIndex,rowIndex);
    end
    errnorm  =norm(x_app(:,k)-x_app(:,k-1));
    prnorm(iter,:) =[iter,errnorm];
end
%disp('Iter.numurs  Kļūda')

table(prnorm, 'VariableNames', ["Iter.numurs      Kļūda"])         % Ctrl+Enter
x_approx = x_app(:,k)
x_sol = linsolve(A,B) % Ctrl+Enter

[row,col] = size(prnorm);
disp('Atbilde:')
fprintf(' iterāciju skaits = %.0f\n',prnorm(row,1)) 
fprintf(' kļūda = %.6f\n' ,prnorm(row,2))
fprintf(' x_tuvinājumi : { %.4f , %.4f, %.4f }\n',x_approx(:)')

%% ārējās funkcijas
% pamatprogrammas beigas


% ārējā funkcija ( 1.16. piemērs ). Faktorizācijas  metode
function fun_prob16(a_el,b_el,c_el)
   n = length(a_el);
   for i = 1:n
      if abs(b_el(i)) < ( abs(a_el(i))+abs(c_el(i)) )
         disp(' Faktorizācijas metode nav stabila'), return
      end
    end
    disp(' Faktorizâcijas metode ir stabila')  
end

% ārējā funkcija ( 2.3. piemērs ). Jakobi metode
% pārbaude: vai Jakobi metode koverģē?
function fun_prob3(A_mat)
 [row,col] = size(A_mat);
 for i = 1:row
    sum =0;
    for j = 1:col
        if i~=j
            sum = sum+abs(A_mat(i,j));
        end
    end
    if abs(A_mat(i,i)) <= sum
      disp(' Neizpildās konverģences pietiekamais nosacījums')
      fprintf(' rindas numurs %.0f: --> %.0f < %.0f \n', i,A_mat(i,i),sum ) 
      return
    end
 end
 disp(' Izpildās konver.pietiekamais nosacījums - Jakobi metode koverģē')
end