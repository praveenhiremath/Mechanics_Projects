%% Exercise 3
% This code was developed for teaching purposes at Lund University
% This code is not to be used by others for University submission.
% Author: Praveenkumar Hiremath
% Email: praveenkumar.hiremath@mek.lth.se (Email at the University)
%       praveenkumar.hiremath2911@gmail.com (Private email)

clc
clear all

%% a) If the initial velocity of the bullet is u = 400m/s, determine for which two different angles θ the rifle can be angled
% to hit the mountain at B and how long t it takes for the bullet to travel from A to B for these two cases. Also plot
% the path of the ball from A to B for both cases.

u = 400;  % ms^-1
g = 9.8;  % ms^-2

theta = 1:0.01:89; % shooting angles 
hori_dist = zeros(size(theta));
vert_dist = zeros(size(theta)); 

ax = 0;
ay = -g;

%using the given equations (1) and (2), create another equation quadratic in tan(theta)
%The equation is: (766.40625(tan^2(θ))) - (5000 tan(θ)) + 2266.40625

coeffs = [766.40625  -5000  2266.40625];
root_vals = roots(coeffs);
thetas_rad = atan(root_vals);
thetas_deg = rad2deg(thetas_rad);

%timetaken for θ1 and θ2
t1 = 5000/(400*cosd(thetas_deg(1)));
t2 = 5000/(400*cosd(thetas_deg(2)));

fprintf("For angle %0.4f degrees, the time taken t1 is: %0.4f\n", thetas_deg(1), t1);
fprintf("For angle %0.4f degrees, the time taken t2 is: %0.4f\n", thetas_deg(2), t2);

t = 0:0.1:79; % time interval t
theta1 = thetas_deg(1);
theta2 = thetas_deg(2);
x =@(angle) u*cosd(angle).*t;
y =@(angle) -0.5*g*t.^2 + 400* sind(angle).*t ;
plot(x(theta1),y(theta1),x(theta2), y(theta2))
txt_t1 = strcat('\theta_{1} = ', num2str(theta1),'°');
text(2300, 7500, txt_t1, 'FontSize',20);
vel = strcat('u = ', num2str(u),'m/s');
text(2300, 7200, vel, 'FontSize',20);
time1 = strcat('time taken = ', num2str(t1),' s');
text(2000, 6900, time1, 'FontSize',20);

txt_t2 = strcat('\theta_{2} = ', num2str(theta2),'°');
text(2300, 800, txt_t2, 'FontSize',20);
text(2300, 500, vel, 'FontSize',20);
time2 = strcat('time taken = ', num2str(t2),' s');
text(2000, 250, time2, 'FontSize',20);

set(gcf,'Position',[10 1000 1500 1000])
xlim([0,5000])
xlabel('X (m)','FontSize',20)
ylabel('Y (m)','FontSize',20)
title('Path from A to B for \theta_1, \theta_2 and u_{min}','FontSize',20)
hold on
%legend('\theta_1', '\theta_2')  

%% Task b
g=9.81;
thetas = 20:0.1:89;  %independent variable
u_t = 5000./(cosd(thetas).*sqrt(2*(5000.*tand(thetas)-1500)/g));  % dependent variable

der_u_t = diff(u_t);
sign_change_id = find(der_u_t>0,1);
u_min = u_t(sign_change_id);
theta_umin = thetas(sign_change_id);
fprintf("Minimum velocity of %0.4f ms^-1, should have shooting angle of: %0.4f\n", u_min, thetas(sign_change_id));

%time to reach B
t_B = 5000/(u_min*cosd(theta_umin));

t_umin = 0:0.1:t_B;
X_umin =@(angle,u) u*cosd(angle).*t_umin;
Y_umin =@(angle,u) -0.5*g*t_umin.^2 + u* sind(angle).*t_umin ;

plot(X_umin(theta_umin,u_min),Y_umin(theta_umin, u_min))
txt = strcat('Minimum velocity u_{min} = ',num2str(u_min),' m/s at \theta = ', num2str(theta_umin),'°');
text(1250, 2200, txt, 'FontSize',20);

legend('\theta_1', '\theta_2', 'u_{min}','FontSize',20)
saveas(gcf,'trajectory_ex3.png')
