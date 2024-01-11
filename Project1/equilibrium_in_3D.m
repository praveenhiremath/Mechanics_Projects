% Equilibrium in 3D

% This code was developed for teaching purposes at Lund University
% Author: Praveenkumar Hiremath
% Email: praveenkumar.hiremath@mek.lth.se (Email at the University)
%       praveenkumar.hiremath2911@gmail.com (Private email)



clc;
clear all;

%% a) Calculate and plot the amount (magnitude) of the moment at O, M0 = |M0| as a function of XB  (-15m ≤ XB ≤ 15m, för ZB = 9m)

% (XB,ZB) cartesion point
XB = -15:0.01:15;
%XB = 9;
ZB = 9; 

% T along AB
T = 10*([XB; -15* ones(size(XB)); ZB*ones(size(XB))]./(sqrt(XB.^2+ 15^2 + ZB^2)));

% Moment axis OA
r_oa = [ZB*ones(size(XB)); zeros(size(XB)); XB];

% Moment at O
M_o = cross(r_oa, T);

%M_mag = sqrt(M_o(1,:).^2  + M_o(2,:).^2 + M_o(3,:).^2);
M_mag = sqrt(M_o(1,:).^2  + M_o(3,:).^2);

plot(XB, M_mag)
xlabel('X_B [in units of m]')
ylabel('M_O [in units of kNm]')
title('M_o vs X_B','FontSize',20)
%set(gcf,'Position',[10 1000 1500 1000])
%saveas(gcf,'M_O_vs_XB.png')

%% b) Calculate for which values of XB where M0 <100 kNm.
XB_vals = XB(find(M_mag < 100));
%indicies = find(M_mag < 100);
%interval = XB(indicies)

%% c) For what value of XB the minimum M0 is achieved. Also enter the value of M0 in this mode.

[Mmin_val, Mmin_index] = min(M_mag);
XB_min = XB(Mmin_index);
fprintf("For XB= %0.4f, we have Minimum Mo= %0.4f\n", XB_min, Mmin_val);

txt_t1 = strcat('For X_B= ',num2str(XB_min),' we have minimum M_o= ', num2str(Mmin_val));
text(-5, 110, txt_t1, 'FontSize',20);

set(gcf,'Position',[10 1000 1500 1000])
saveas(gcf,'MO_vs_XB.png')
