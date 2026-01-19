%% Parasto diferenciālvienādojumu un diferenciālvienādojumu sistēmu 
% risināšanas metodes 
%              192. - 207.lpp.
%  Augstāku kārtu diferenciālvienādojumu risināšanas metodes
%              208. - 218.lpp.

%% Visu uzdevumu numerācija sakrīt ar uzdevumu numerāciju
% mācību grāmatā V.Koliškina, A.Koliškins. 
% Skaitliskās metodes ar Matlab. RTU izdevniecība,2023.

%% Parasto diferenciālvienādojumu un diferenciālvienādojumu sistēmu 
%  skaitliskās risināšanas metodes "
%              192. - 207.lpp.

%% 7.4.piemērs grāmatā – 200.lpp. Košī problema
% Pirmās kārtas diferenciālvienādojums 
clc, clearvars, format compact 
x_int = [0,2];   % intervāls
y1 = 1;          % sākuma nosacījums
% uzdevuma skaitliskā risināšana ar komandu ode45
sol = ode45(@fun_prob4,x_int,y1)

% turpinājums 
sol_x =sol.x'
sol_y =sol.y'

% turpinājums 
x = (0:0.01:2);   % x vērtību vektors
y = deval(sol,x); % y vērtību vektors
plot(x,y,'r','LineWidth',3), xlabel('x'), ylabel('y')
title('Funkcijas y(x) grafiks'),grid on

%% 7.5.piemērs grāmatā – 201.lpp. Košī problēma.
% Pirmās kārtas diferenciālvienādojums
clc, clearvars, format compact 
% definēsim diferenciālvienādojuma labo pusi:
fun_prob5 = @(x,y)x+y;  % function handle
x_int = [0 1];            % intervāls
y1 = 0;                 % sākuma nosacījums
% uzdevuma skaitliskā risināšana ar komandu ode45
sol = ode45(fun_prob5,x_int,y1) 

% turpinājums 
sol_x =sol.x'
sol_y =sol.y'

% turpinājums 
y_02 = deval(sol,0.2)   % y vērtība punktā 0.2
x = (0:0.01:1);         % x vērtību vektors
y = deval(sol,x);       % y vērtību vektors
plot(x,y,'r','LineWidth',3), xlabel('x'), ylabel('y')
title('Funkcijas y(x) grafiks'),grid on

% turpinājums 
disp('Atbilde:')
fprintf(' funkcijas vērtība punktā(0.2) = %.4f \n ',y_02)

%% 7.6.piemērs grāmatā – 204.lpp. Košī problēma.
% Pirmās kārtas diferenciālvienādojumu sistēma.
clc, clearvars, format compact 
x_int = [0,12];        % intervāls
y1 = [0;1;1];          % sākuma nosacījums
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(@fun_prob6,x_int,y1)

% turpinājums 
sol_x =sol.x'
sol_y =sol.y'

% turpinājums 
x = (0:0.01:12);       % x vērtību vektors
y = deval(sol,x);      % y1, y2 un y3 vērtību vektori
plot(x,y(1,:),'r', x,y(2,:),'g', x,y(3,:),'b','LineWidth',3)
legend('y1(x)','y2(x)','y3(x)'),xlabel('x'),ylabel('y')
title('Funkciju y1(x),y2(x) un y3(x) grafiki'),grid on

%% 7.7.piemērs grāmatā – 206.lpp. Košī problēma.
% Pirmās kārtas diferenciālvienādojumu sistēma.
clc, clearvars, format compact 
% definēsim diferenciālvienādojumu sistēmas labo pusi:  
dxy_dt = @(t,y) [-y(2)-y(1).^2; 2*y(1)-y(2)];     % function handle
t_int = [0,10];       % intervāls
y1 = [1;1];           % sākuma nosacījums
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(dxy_dt,t_int,y1)

% turpinājums 
sol_t = sol.x'
sol_xy = sol.y'

% turpinājums 
t = (0:0.01:10);       % t vērtību vektors
xy = deval(sol,t);     % x un y vērtību vektors
plot(t,xy(1,:),'r', t,xy(2,:),'g','LineWidth',3)
title('Funkciju x(t)un y(t) grafiki'),grid on
legend('x(t)','y(t)'),xlabel('t'),ylabel('x(t),y(t)')

% turpinājums
xy_2_7 = deval(sol,2.7)

% turpinājums 
fprintf('Atbilde. Funkciju vērtības punktā(2.7)  \n ')
fprintf('   x(2.7) = %.5f,   y(2.7) = %.5f \n',xy_2_7(:))

%%  Augstāku kārtu diferenciālvienādojumu risināšanas metodes
%              208. - 218.lpp.

%% 7.8.piemērs grāmatā – 209.lpp. Augstāku kārtu diferenciālvienādojumi 
clc, clearvars, format compact, close all 
x_int = [0 10];           % intervāls
y1 = [1;0;0];             % sākuma nosacījumi
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(@fun_prob8,x_int,y1) 

% turpinājums 
sol_x = sol.x'
sol_y = sol.y'

% turpinājums 
x = (0:0.01:10);         % x vērtību vektors
y = deval(sol,x);        % y,y' un y'' vērtību vektors
plot(x,y(1,:),'r', 'LineWidth',3)
xlabel('x'),ylabel('y(x)')
title('Funkcijas y(x) grafiks'),grid on

% turpinājums 
figure
plot(x,y(2,:),'g',x,y(3,:),'b','LineWidth',3)
legend('y''(x)','y''''(x)'),xlabel('x'),ylabel('y''(x), y''''(x)')
title('Funkciju y''(x) un y''''(x) grafiki'),grid on

%% 7.9.piemērs grāmatā – 211.lpp. Augstāku kārtu diferenciālvienādojumi 
clc, clearvars, format compact, close all 
x_int = [1 4];           % intervāls
y1 = [5/4;3/4;11/2];     % sākuma nosacījumi
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(@fun_prob9,x_int,y1) 

% turpinājums
sol_x = sol.x'
sol_y = sol.y'

% turpinājums 
x = (1:0.01:4);         % x vērtību vektors
y = deval(sol,x);       % y vērtību vektors
plot(x,y(1,:),'r',x,y(2,:),'g',x,y(3,:),'b','LineWidth',3)
legend('y(x)','y''(x)','y''''(x)')
xlabel('x'),ylabel('y(x), y''(x), y''''(x)')
title('Funkciju y(x), y''(x) un y''''(x) grafiki'),grid on

% turpinājums
y_value = deval(sol,1.87)

% turpinājums 
fprintf('Atbilde. Funkciju vērtības punktā(1.87)\n ')
fprintf('   y(1.87) = %.4f\n   y''(1.87) = %.4f\n',y_value(1:2))  
fprintf('  y''''(1.87) = %.4f \n',y_value(3))

%% Uzdevumi patstāvīgai risināšanai
% 7.1. - 7.9.uzdevumi ( 214. - 218.lpp.)

%% 7.1.
clc, clearvars, format compact 
x_int = [0,5];   % intervāls
y1 = 1;          % sākuma nosacījums
% uzdevuma skaitliskā risināšana ar komandu ode45
sol = ode45(@fun_prob10,x_int,y1);

% turpinājums 
sol_x =sol.x';
sol_y =sol.y';

% turpinājums 
y_02 = deval(sol,2);    % y vērtība punktā 0.2
x = (0:0.01:5);         % x vērtību vektors
y = deval(sol,x);       % y vērtību vektors
plot(x,y,'r','LineWidth',3), xlabel('x'), ylabel('y')
title('Funkcijas y(x) grafiks'),grid on

% turpinājums 
disp('Atbilde:')
fprintf('funkcijas vērtība punktā(2) = %.4f \n',y_02)

%% 7.2.
clc, clearvars, format compact 
x_int = [0,.8];   % intervāls
y1 = 1;          % sākuma nosacījums
% uzdevuma skaitliskā risināšana ar komandu ode45
sol = ode45(@fun_prob11,x_int,y1);

% turpinājums 
sol_x =sol.x';
sol_y =sol.y';

% turpinājums 
y_02 = deval(sol,0.5);    % y vērtība punktā 0.5
x = (0:0.01:0.8);         % x vērtību vektors
y = deval(sol,x);       % y vērtību vektors
yp = x.^2+y.^2;
hold on
plot(x, y,'r','LineWidth',3, 'Color', 'red')
plot(x, yp,'r','LineWidth',3, 'Color', 'blue')
xlabel('x'), ylabel('y'), grid on
title('Funkciju y(x) un y''(x) grafiks')
hold off
legend('y', 'y''')
% turpinājums 
disp('Atbilde:')
fprintf('funkcijas vērtība punktā(2) = %.4f \n',y_02)

%% 7.3.
clc, clearvars, format compact 
% definēsim diferenciālvienādojumu sistēmas labo pusi:  
dxy_dt = @(t,y) [y(2); 10*y(2)+11*y(1)];     % function handle
t_int = [0,2];       % intervāls
y1 = [1;-1];         % sākuma nosacījums
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(dxy_dt,t_int,y1);

% turpinājums 
sol_t = sol.x';
sol_xy = sol.y';

% turpinājums 
t = (0:0.01:2);        % t vērtību vektors
xy = deval(sol,t);     % x un y vērtību vektors
plot(t,xy(1,:),'r', t,xy(2,:),'g','LineWidth',3)
title('Funkciju x(t) un y(t) grafiki'), grid on
legend('x(t)','y(t)'),xlabel('t'),ylabel('x(t),y(t)')

% turpinājums
xy_0_7 = deval(sol,0.7);

% turpinājums 
fprintf('Atbilde. Funkciju vērtības punktā(0.7)\n')
fprintf('x(0.7) = %.5f, y(0.7) = %.5f\n',xy_0_7(:))

%% 7.4.
clc, clearvars, format compact 
x_int = [0,1];        % intervāls
y1 = [1;1];         % sākuma nosacījums
% uzdevuma skaitliskā atrisināšana ar komandu ode45
sol = ode45(@fun_prob12,x_int,y1);

% turpinājums 
sol_x =sol.x';
sol_y =sol.y';

% turpinājums 
x = (0:0.01:1);        % x vērtību vektors
y = deval(sol,x);      % y1, y2 un y3 vērtību vektori
plot(x,y(1,:),'r', ...
     x,y(2,:),'b', ...
     'LineWidth', 3)
legend('y1(x)','y2(x)'),xlabel('x'),ylabel('y')
title('Funkciju y1(x) un y2(x) grafiki'),grid on

y_0_3 = deval(sol,0.3);

% turpinājums 
fprintf('Atbilde. Funkciju vērtības punktā(0.3)\n')
fprintf('y1(0.3) = %.5f, y2(0.3) = %.5f\n', y_0_3(:))
fprintf('y1_max = %.4f, y2_max = %.4f\n', max(y(1,:)), max(y(2,:)))

%% 7.5.
clc, clearvars, format compact 
x_int = [0,1.5];   % intervāls
y1 = [0;1];        % sākuma nosacījums
asked_x = 0.7;     % x kuram meklēt vērtības
% uzdevuma skaitliskā risināšana ar komandu ode45
sol = ode45(@fun_prob13,x_int,y1);

% turpinājums 
sol_x = sol.x';
sol_y = sol.y';

% turpinājums 
x = (0:0.01:1.5);         % x vērtību vektors
y = deval(sol,x);         % y,y' un y'' vērtību vektors
plot(x,y(1,:),'r', 'LineWidth',3)
xlabel('x'),ylabel('y(x)')
title('Funkcijas y(x) grafiks'),grid on

y_0_7 = deval(sol,asked_x);

fprintf('y(0.7) = %.5f, y''(0.7) = %.5f\n', y_0_7)

%% 7.6.
%tas pats kas 7.9

%% ārējas funkcijas %%  ārējas funkcijas  %%   ārējas funkcijas %%%%%%%%%%
% pamatprogrammas beigas

% ārēja funkcija ( 7.4.piemērs ).
% definēsim diferenciālvienādojuma labo pusi.
function dydx = fun_prob4(x,y)
      dydx = y.*sin(x)+2*sin(2*x);
end

% ārēja funkcija ( 7.6.piemērs ).
% definēsim diferenciālvienādojumu sistēmas labo pusi.
function dy_dx = fun_prob6(x,y)
   dy_dx = zeros(3,1);
   dy_dx(1) = y(2).*y(3);
   dy_dx(2) = -y(1).*y(3);
   dy_dx(3) = -0.5*y(1).*y(2);
end

% ārēja funkcija ( 7.8.piemērs ).
% definēsim diferenciālvienādojumu sistēmas labo pusi.
function dy_dx = fun_prob8(x,y)
   dy_dx = zeros(3,1);
   dy_dx(1) = y(2);
   dy_dx(2) = y(3);
   dy_dx(3) = -y(3)-y(2)-y(1).^4;
end

% ārēja funkcija ( 7.9.piemērs ).
% definēsim diferenciālvienādojumu sistēmas labo pusi.
function dy_dx = fun_prob9(x,y)
   dy_dx = zeros(3,1);
   dy_dx(1) = y(2);
   dy_dx(2) = y(3);
   dy_dx(3) = y(3)./x-2*y(2)./x.^2+2*y(1)./x.^3+1;
end

function dy_dx = fun_prob10(x,y)
    dy_dx = sin(x)*cos(x)-y.*cos(x);
end

function dy_dx = fun_prob11(x,y)
    dy_dx = x.^2+y.^2;
end

function dy_dx = fun_prob12(x,y)
   dy_dx = zeros(2,1);
   dy_dx(1) = 2*y(1)-0.01*y(1).*y(2);
   dy_dx(2) = -y(2)+0.01*y(1).*y(2);
end

function dy_dx = fun_prob13(x,y)
   dy_dx = zeros(2,1);
   dy_dx(1) = y(2);
   dy_dx(2) = -y(1)/(x.^2 - 4);
end