% =========================================================
%  Rosenzweig_MacArthur_extinction_of_super_predator.m
% =========================================================
close all; clear all; clc;

%===================================
% parameters
%===================================

r = 0.65;
a1 = 0.9;
g1 = 0.25;
d1 = 0.4;
a2 = 0.15;
g2 = 0.15;
d2 = 0.4;

params = [r; a1; g1; d1; a2; g2; d2];

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

plot(t,y(:,1),'g',t,y(:2),'b',t,y(:3),'r','LineWidth',1.2); grid on;
xlabel('Time'), ylabel('Population Desnity');
legend('E(t)','M(t)','F(t)','location','best')
hold off

%===================================
% Function
%===================================

function dy = RMModelv3(t,y,params)
  
  r = params(1);
  a1 = params(2);
  a2 = params(3);
  g1 = params(4);
  g2 = params(5);
  d1 = params(6);
  d2 = params(7);

  K = 1.9; b1 = 0.6; b2 = 0.8;
  
  E = y(1);
  M = y(2);
  F = y(3)
  
  dy = zeros(3,1);

  dy(1) = (r.*(1-E./K) - (a1.*M)./(b1+E)).*E;
  dy(2) = ((g1.*a1.*E)./(b1+E) - d1 - F./(b2+M)).*M;
  dy(3) = ((g2.*a2.*E)./(b2+M) - d2).*F;

end
