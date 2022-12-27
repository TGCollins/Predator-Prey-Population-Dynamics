% =========================================
% Yodzis_Innes_model.m
% =========================================
close all; clear all; clc;
% =========================================

% -----------------------------------------
% parameters
% -----------------------------------------
  
xn = 0.4;
yn = 2.009;
xp = 0.08;
yp = 2.876;
R0 = 0.12;
N0 = 0.5;

params = [xn, yn, xp, yp, R0, N0]

% -----------------------------------------
% Initial Conditions
% -----------------------------------------
  
y0 = [1;0.75;0.5];

% -----------------------------------------
% Time Span
% -----------------------------------------

tend = 400;
N = 1000;
tspan = linspace(0,tend,N+1)';
  
% -----------------------------------------
% Solving the system using ODE45
% -----------------------------------------
  
[t,y] = ode45(@(t,y)YodzisInnes(t,y,params),tspan,y0);

% -----------------------------------------
% Plotting Graph
% -----------------------------------------
  
plot(t,y(:1),'g',t,y(:2),'b',t,y(:3),'r','LineWidth',1.2); grid on;
xlabel('Time'), ylabel('Population Density');
legend('R(t)','N(t)','P(t)')
hold off

% -----------------------------------------
% Function
% -----------------------------------------
  
function dy = YodzisInnes(t,y,params)
  
  xn = params(1);
  yn = params(2);
  xp = params(3);
  yp = params(4);
  R0 = params(5);
  N0 = params(6);

  R = y(1);
  N = y(2);
  P = y(3);

  dy = zeros(3,1);

  dy(1) = R * (1 - R) - (xn * yn) * [ (N*R) / (R + R0) ];
  dy(2) = (xn * N) * [-1 + (yn * R) / (R + R0)] - (xp * yp * P * N) / (N + N0);
  dy(3) = (xp * P) * [-1 + (yp * N) / (N + N0)];

end
