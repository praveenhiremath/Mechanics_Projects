function [M, N_A, N_B] = solve_eqs(mu_s, theta)
% This code was developed for teaching purposes at Lund University
% Author: Praveenkumar Hiremath
% Email: praveenkumar.hiremath@mek.lth.se (Email at the University)
%       praveenkumar.hiremath2911@gmail.com (Private email)

% so we have a 3 unknowns and 3 equations
theta = deg2rad(theta);
M = zeros(length(mu_s), length(theta));
N_A = zeros(length(mu_s), length(theta));
N_B = zeros(length(mu_s), length(theta));

for j = 1:length(mu_s)
    for i = 1:length(theta)
        matrix = [1 -0.2*mu_s(j) -mu_s(j)*0.2; 0 -1 sin(theta(i))+mu_s(j)*cos(theta(i)); 0 mu_s(j) cos(theta(i))-mu_s(j)*sin(theta(i))];
        % X = [M N_A N_B];
        X = matrix \ [0 ; 0 ; 30*9.81];
        inv(matrix);
        X2 = inv(matrix)*[0 ; 0 ; 30*9.81];
        M(j,i) = X(1);
        N_A(j,i) = X(2);
        N_B(j,i) = X(3);
    end
end
end
