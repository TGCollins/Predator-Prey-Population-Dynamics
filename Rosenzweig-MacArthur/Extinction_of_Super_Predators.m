% =========================================================
%  Rosenzweig_MacArthur_extinction_of_super_predator.m
% =========================================================
close all; clear all; clc;

%===================================
% parameters
%===================================

r = 0.65;
a1 = 0.9;
a2 = 0.25;
g1 = 0.4;
g2 = 0.15;
d1 = 0.15;
d2 = 0.4;

params = [r; a1; a2; g1; g2; d1; d2];

%===================================
% Initial Values
%===================================

y0 = [2; 1; 0.6];

%===================================
% time span
%===================================

tend=600;
N=1000;
tspan=linspace(0,tend,N+1)';
  
%===================================
% Solving the system using ode45
%===================================

[t, y] = ode45(@(t,y)RMModelv3(t,y,params, tspan, y0);

%===================================
% Plotting graph
%===================================

r0=12; w0=2;
title_params={'r0','w0','beta','alphad','delta','alphaw'};
plot(t,y(:,1), 'b',t,y(:,2),'r','LineWidth',2); grid on;
xlabel('Time'), ylabel('Population Density');
legend('D(t)','W(t)','location','best')
hold off

%===================================
% Function
%===================================

function dy = LotkaVolterra(t,y,params)
  
  beta = params(1);
  alphad = params(2);
  delta = params(3);
  alphaw = params(4);

  D = y(1);
  W = y(2);

  dy = zeros(2,1);

  dy(1) = beta * D - alphad * D * W;
  dy(2) = alphaw * D * W - delta * W;

end
