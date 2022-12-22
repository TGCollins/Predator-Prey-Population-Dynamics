%===================================
% Lotka_Volterra.m
%===================================
close all; clear all; clc;
%===================================
  
% We look to model the Lotka-Volterra System.

%===================================
% parameters
%===================================

beta = 1.1;
alphad = 0.4;
delta = 1.5;
alphaw = 0.1;

params = [beta; alphad; delta; alphaw];

%===================================
% Initial Values
%===================================

y0 = [12; 2];

%===================================
% time span
%===================================

tend=30;
N=1000;
tspan=linspace(0,tend,N+1)';
  
%===================================
% Solving the system using ode45
%===================================

[t, y] = ode45(@(t,y)LotkaVolterra(t,y,params), tspan, y0);

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

  
