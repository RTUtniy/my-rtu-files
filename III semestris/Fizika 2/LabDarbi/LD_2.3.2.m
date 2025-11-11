%% 2. uzdevums
t = [35 41 47 53 59 65 71]; % Celsija grādi
T = t(:) + 273.15;          % Kelvini
delta_t = 0.5;

R_sild = [339 328 316 304 289 276 262];
R_dzes = [342 331 321 310 298 285 270];
delta_R = 0.01;

X = 1 ./ T;
Y_sild = log(1 ./ R_sild);
Y_dzes = log(1 ./ R_dzes);

figure;
plot(X, Y_sild, 'ko-', ...
    'LineWidth', 1.5, ...
    'MarkerSize', 8);

title('ln(R^{-1}) atkarība no 1/T_{sild}');
xlabel('Apgrieztā temperatūra, 1/T (K^{-1})');
ylabel('El. pretestības naturāllogaritms, ln(R^{-1}) (ln(S))');
grid on;

figure;

plot(X, Y_dzes, 'ko-', ...
    'LineWidth', 1.5, ...
    'MarkerSize', 8);

title('ln(R^{-1}) atkarība no 1/T_{sild}');
xlabel('Apgrieztā temperatūra, 1/T (K^{-1})');
ylabel('El. pretestības naturāllogaritms, ln(R^{-1}) (ln(S))');
grid on;

lnGamma_p_dzes = [0.003 -5.7138];
lnGamma_p_sild = [0.0031 -5.7311];

%% 3. uzdevums
% Vidējā aktivācijas enerģija dzesēšanas posmam
BoltsmanConst = 1.38*10^(-23);
activationEnergies = zeros(6, 1);
for i = 1:1:length(R_dzes)-1
    activationEnergies(i) = 2 * BoltsmanConst * ...
        ( log(1/R_dzes(i+1)) - log(1/R_dzes(i)) ) / ...
        ( 1/T(i) - 1/T(i+1) );
end
disp('Aktivācijas enerģijas dzesēšanas posmam =')
disp(activationEnergies)

avgActivationEnergy = mean(activationEnergies);
disp('Vidējā aktivācijas enerģija dzesēšanas posmam =');
disp(avgActivationEnergy);

clear activationEnergies

%%
% 
% $$\overline{\Delta E}_\searrow=1,9527\cdot10^{-20}~\mathrm{J/K}$$
% 

%% 4. uzdevums, kļūdu aprēķini
% Kvadrātsakne no kvadrātu summas - hipotenūzas funkcijas paplašinājums
function res = hyp(vect)
    res = 0;
    for i = 1:1:length(vect)
        res = res + vect(i)^2;
    end
    res = sqrt(res);
end

%%
% Temperatūras kļūdas aprēķins (Tiešo mērījumu kļūda)

avg_t = mean(t);
fprintf("Vidējā temperatūra (Celsija grādi) = %.4f\n", avg_t);

S_t = std(t)/sqrt(length(t));
fprintf("Vidējā kvadrātiskā kļūda = %.4f\n", S_t);

Delta_t_s = delta_t/3 * 1.96;
fprintf("Sistemātiskā kļūda temperatūras mērījumiem = %.4f\n", Delta_t_s);

Delta_t_g = S_t * 2.45;
fprintf("Gadījuma kļūda temperatūras mērījumiem = %.4f\n", Delta_t_g);

Delta_t = hyp([Delta_t_s, Delta_t_g]);
fprintf("Kopējā kļūda temperatūras mērījumiem = %.4f\n", Delta_t);

epsilon_t = Delta_t / avg_t;
fprintf("Relatīvā kļūda temperatūras mērījumiem = %.4f%%\n\n", epsilon_t * 100);

clear S_t Delta_t_s Delta_t_g

%%
% 
% $$t=(53\pm12,0069)$$°C pie $$\beta=0,95$$ un $$\varepsilon_t=22,6546\%$$
% 


%%
% Pretestības kļūdas aprēķins (Tiešo mērījumu kļūda)

avg_R_sild = mean(R_sild);
avg_R_dzes = mean(R_dzes);
fprintf("Vidējā pretestība sildīšanas posmam = %.4f\n", avg_R_sild);
fprintf("Vidējā pretestība dzesēšanas posmam = %.4f\n", avg_R_dzes);

S_R_sild = std(R_sild)/sqrt(length(R_sild));
S_R_dzes = std(R_dzes) / sqrt(length(R_dzes));
fprintf("Vidējā kvadrātiskā kļūda sildīšanas posmam = %.4f\n", S_R_sild);
fprintf("Vidējā kvadrātiskā kļūda dzesēšanas posmam = %.4f\n", S_R_dzes);

Delta_R_sild_g = S_R_sild * 2.45;
Delta_R_dzes_g = S_R_dzes * 2.45;
fprintf("Gadījuma kļūda sildīšanas posmam = %.4f\n", Delta_R_sild_g);
fprintf("Gadījuma kļūda dzesēšanas posmam = %.4f\n", Delta_R_dzes_g);

Delta_R_s = delta_R / 3 * 1.96;
fprintf("Sistemātiskā kļūda pretestības mērījumiem = %.4f\n", Delta_R_s)

Delta_R_sild = hyp([Delta_R_s, Delta_R_sild_g]);
Delta_R_dzes = hyp([Delta_R_s, Delta_R_dzes_g]);
fprintf("Kopējā kļūda sildīšanas posmam = %.4f\n", Delta_R_sild);
fprintf("Kopējā kļūda dzesēšanas posmam = %.4f\n", Delta_R_dzes);

fprintf("Relatīvā kļūda sildīšanas posmam = %.4f%%\n", (Delta_R_sild / avg_R_sild) * 100);
fprintf("Relatīvā kļūda dzesēšanas posmam = %.4f%%\n", (Delta_R_dzes / avg_R_dzes) * 100); 

clear S_R_sild S_R_dzes Delta_R_sild_g Delta_R_dzes_g

%%
% 
% $$R_{\mathrm{sild.}}=(302\pm25,8898)$$Ω pie $$\beta=0,95$$ un
% $$\varepsilon_{R_{\mathrm{sild.}}}=8,5728\%$$
%%
% 
% $$R_{\mathrm{dzes.}}=(308,1429\pm23,7020)$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{R_{\mathrm{dzes.}}}=7,6919\%$$
% 

%%
% Īpaši atrastā R_p kļūda (Tiešo mērījumu kļūda)

Delta_R_p = Delta_R_s;
fprintf("R_p sildīšanas posmam = %.4f Ω\n", 1/exp(lnGamma_p_sild(2)))
fprintf("R_p dzesēšanas posmam = %.4f Ω\n", 1/exp(lnGamma_p_dzes(2)))
fprintf("Kopējā R_p kļūda = %.4f\n", Delta_R_p);
fprintf("R_p Relatīvā kļūda sildīšanas posmam = %.4f%%\n", (Delta_R_p * exp(lnGamma_p_sild(2))) * 100);
fprintf("R_p Relatīvā kļūda dzesēšanas posmam = %.4f%%\n", (Delta_R_p * exp(lnGamma_p_dzes(2))) * 100);

clear Delta_R_s

%%
% 
% $$R_{p\,\mathrm{dzes.}}=(308,3082\pm0,0065)$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{R_{p\,\mathrm{dzes.}}}=0,0021\%$$
% 

%%
% 
% $$R_{p\,\mathrm{dzes.}}=(303,0204\pm0,0065)$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{R_{p\,\mathrm{dzes.}}}=0,0022\%$$
% 

%%
% Aktivācijas enerģijas kļūdas aprēķins (Netiešo mērījumu kļūda)

syms R_1 R_2 T_1 T_2;

activationEnergyFormula = 2 * BoltsmanConst * ...
    (log(1/R_2) - log(1/R_1)) / (1/T_1 - 1/T_2);

activationEnergyDerivativeByR_1 = diff(activationEnergyFormula, 1, R_1);
activationEnergyDerivativeByR_2 = diff(activationEnergyFormula, 1, R_2);
activationEnergyDerivativeByT_1 = diff(activationEnergyFormula, 1, T_1);
activationEnergyDerivativeByT_2 = diff(activationEnergyFormula, 1, T_2);

activationEnergySubFrom = [R_1, R_2, T_1, T_2];
activationEnergy1SubTo = [R_sild(1), 1/exp(lnGamma_p_sild(2)), T(1), 1/lnGamma_p_sild(1)];
activationEnergy2SubTo = [1/exp(lnGamma_p_sild(2)), R_sild(7), 1/lnGamma_p_sild(1), T(7)];
activationEnergy3SubTo = [R_dzes(1), 1/exp(lnGamma_p_dzes(2)), T(1), 1/lnGamma_p_dzes(1)];
activationEnergy4SubTo = [1/exp(lnGamma_p_dzes(2)), R_dzes(7), 1/lnGamma_p_dzes(1), T(7)];

activationEnergy1 = double(subs(activationEnergyFormula, ...
    activationEnergySubFrom, activationEnergy1SubTo));

Delta_activationEnergy1 = double(hyp([ ...
    subs(activationEnergyDerivativeByR_1, activationEnergySubFrom, activationEnergy1SubTo) * Delta_R_sild, ...
    subs(activationEnergyDerivativeByR_2, activationEnergySubFrom, activationEnergy1SubTo) * Delta_R_p, ...
    subs(activationEnergyDerivativeByT_1, activationEnergySubFrom, activationEnergy1SubTo) * Delta_t, ...
    subs(activationEnergyDerivativeByT_2, activationEnergySubFrom, activationEnergy1SubTo) * Delta_t ...
]));

fprintf("Aktivācijas enerģija sildīšanas posma sākumam = %E\n", activationEnergy1);
fprintf("Aktivācijas enerģijas kopējā kļūda sildīšanas posma sākumam = %E\n", Delta_activationEnergy1);
fprintf("Aktivācijas enerģijas relatīvā kļūda sildīšanas posma sākumam = %.4f%%\n", abs(Delta_activationEnergy1 / activationEnergy1) * 100);

activationEnergy2 = double(subs(activationEnergyFormula, ...
    activationEnergySubFrom, activationEnergy2SubTo));

Delta_activationEnergy2 = double(hyp([ ...
    subs(activationEnergyDerivativeByR_1, activationEnergySubFrom, activationEnergy2SubTo) * Delta_R_p, ...
    subs(activationEnergyDerivativeByR_2, activationEnergySubFrom, activationEnergy2SubTo) * Delta_R_sild, ...
    subs(activationEnergyDerivativeByT_1, activationEnergySubFrom, activationEnergy2SubTo) * Delta_t, ...
    subs(activationEnergyDerivativeByT_2, activationEnergySubFrom, activationEnergy2SubTo) * Delta_t ...
]));

fprintf("Aktivācijas enerģija sildīšanas posma beigām = %E\n", activationEnergy2);
fprintf("Aktivācijas enerģijas kopējā kļūda sildīšanas posma beigām = %E\n", Delta_activationEnergy2);
fprintf("Aktivācijas enerģijas relatīvā kļūda sildīšanas posma beigām = %.4f%%\n", abs(Delta_activationEnergy2 / activationEnergy2) * 100);

activationEnergy3 = double(subs(activationEnergyFormula, ...
    activationEnergySubFrom, activationEnergy3SubTo));

Delta_activationEnergy3 = double(hyp([ ...
    subs(activationEnergyDerivativeByR_1, activationEnergySubFrom, activationEnergy3SubTo) * Delta_R_dzes, ...
    subs(activationEnergyDerivativeByR_2, activationEnergySubFrom, activationEnergy3SubTo) * Delta_R_p, ...
    subs(activationEnergyDerivativeByT_1, activationEnergySubFrom, activationEnergy3SubTo) * Delta_t, ...
    subs(activationEnergyDerivativeByT_2, activationEnergySubFrom, activationEnergy3SubTo) * Delta_t ...
]));

fprintf("Aktivācijas enerģija dzesēšanas posma sākumam = %E\n", activationEnergy3);
fprintf("Aktivācijas enerģijas kopējā kļūda dzesēšanas posma sākumam = %E\n", Delta_activationEnergy3);
fprintf("Aktivācijas enerģijas relatīvā kļūda dzesēšanas posma sākumam = %.4f%%\n", abs(Delta_activationEnergy3 / activationEnergy3) * 100);

activationEnergy4 = double(subs(activationEnergyFormula, ...
    activationEnergySubFrom, activationEnergy4SubTo));

Delta_activationEnergy4 = double(hyp([ ...
    subs(activationEnergyDerivativeByR_1, activationEnergySubFrom, activationEnergy4SubTo) * Delta_R_p, ...
    subs(activationEnergyDerivativeByR_2, activationEnergySubFrom, activationEnergy4SubTo) * Delta_R_dzes, ...
    subs(activationEnergyDerivativeByT_1, activationEnergySubFrom, activationEnergy4SubTo) * Delta_t, ...
    subs(activationEnergyDerivativeByT_2, activationEnergySubFrom, activationEnergy4SubTo) * Delta_t ...
]));

fprintf("Aktivācijas enerģija dzesēšanas posma beigām = %E\n", activationEnergy4);
fprintf("Aktivācijas enerģijas kopējā kļūda dzesēšanas posma beigām = %E\n", Delta_activationEnergy4);
fprintf("Aktivācijas enerģijas relatīvā kļūda dzesēšanas posma beigām = %.4f%%\n", abs(Delta_activationEnergy4 / activationEnergy4) * 100);

clear activationEnergyDerivativeByR_1 activationEnergyDerivativeByR_2 activationEnergyDerivativeByT_1 activationEnergyDerivativeByT_2 ...
    activationEnergySubFrom activationEnergy1SubTo activationEnergy2SubTo activationEnergy3SubTo activationEnergy4SubTo
%%
% 
% $$\Delta E_1=(1,8042\pm2,5757)\cdot10^{-20}~\mathrm{J/K}$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{\Delta E_1}=142,7594\%$$
%%
% 
% $$\Delta E_2=(2,312\pm2,3046)\cdot10^{-20}~\mathrm{J/K}$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{\Delta E_1}=99,6784\%$$
%%
% 
% $$\Delta E_3=(1,3623\pm1,2095)\cdot10^{-20}~\mathrm{J/K}$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{\Delta E_1}=88,7841\%$$
%%
% 
% $$\Delta E_4=(3,3773\pm5,8965)\cdot10^{-20}~\mathrm{J/K}$$Ω pie $$\beta=0,95$$ un 
% $$\varepsilon_{\Delta E_1}=174,5938\%$$
% 