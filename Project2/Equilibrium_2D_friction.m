%  Equilibrium in 2D - friction.
%% Equilibrium In 2D, friction.
% This code was developed for teaching purposes at Lund University
% Author: Praveenkumar Hiremath
% Email: praveenkumar.hiremath@mek.lth.se (Email at the University)
%       praveenkumar.hiremath2911@gmail.com (Private email)

clc
clear all

%% a) Write a self-defined function that solves the system of equations below. The input to the function should be
% μ-s and θ and the output should be the moment M and the normal forces NA and NB. ---> Function "solve_eqs.m"

%% b) Use your self-defined function to plot the normal forces NA and NB as a function of θ for 0 ≤ θ ≤ 45° for the
% case μ-s = 0.3. Both curves must be in the same figure.

m = 30; % 30kg
r = 0.2; % 200 mm
mu_s = 0.3;
theta = 0:0.1:45;  %45;

[M, N_A, N_B] = solve_eqs(mu_s, theta);

plot(theta, N_A, theta, N_B)
legend('N_A', 'N_B', 'Location','southeast')  %'northwest'
xlabel('\theta [in units of °]')
ylabel('Normal force [in units of N]')
title('Normal forces vs \theta')
%xlim([0,45])


%% c) Plot the moment M as a function of θ for 0 ≤ θ ≤ 45° for the cases μ-s = 0.2, 0.5 and 0.8. All three
% the curves must be in the same figure.

theta = 0:0.1:45;
mu_s = [0.2, 0.5, 0.8];

[M, N_A, N_B] = solve_eqs(mu_s, theta);

set(gca, 'FontSize', 24)
plot(theta, M(1,:), theta, M(2,:), theta, M(3,:))
%xlim([0,45])
legend('\mu_s = 0.2', '\mu_s = 0.5', '\mu_s = 0.8', 'Location','north')
xlabel('\theta [in units of °]')
ylabel('Normal force [in units of N]')
title('Normal forces vs \theta for \mu = [0.2, 0.5, 0.8]')

set(gcf,'Position',[10 1000 1500 1000])
saveas(gcf,'Normal_forces_vs_theta_for_diff_mus.png')


%% d) Plot the moment M as a function of μ-s for 0 ≤ μ-s ≤ 1 for θ = 15°, 30° and 45°


theta = [15,30,45];
mu_s = 0:0.01:1;

%[M, N_A, N_B] = arrayfun(@friction, mu'.* ones(size(theta)), theta.*ones(size(mu))');
[M, N_A, N_B] = solve_eqs(mu_s, theta);

plot(mu, M(:,1), mu,M(:,2), mu, M(:, 3))
legend('\theta = 15°', '\theta = 30°', '\theta = 45°', 'Location', 'north')
xlabel('\mu_s ')
ylabel('M_o [in units of N-m]')
title('M_o vs \theta for \theta = [15°, 30°, 45°]')

set(gcf,'Position',[10 1000 1500 1000])
saveas(gcf,'Normal_forces_vs_mus_for_diff_thetas.png')

