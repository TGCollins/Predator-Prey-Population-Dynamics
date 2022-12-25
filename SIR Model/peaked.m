% ============================================
% SIR Model
% ============================================
close all; clear all; clc;
% --------------------------------------------
% parameters
% --------------------------------------------

beta = 5;      % rate of infection
gamma = 2;     % rate of recovery
N = 1.2;        % Total population (S + I + R)
I0 = 0.2;      % Initial number of infected
  
% --------------------------------------------
% time span
% --------------------------------------------

T = 4;         % Time
dt = 0.05;     % Time intervals

% --------------------------------------------
% Calculation of model
% --------------------------------------------

[S,I,R] = sir_model(beta,gamma,N,I0,T,dt);

% --------------------------------------------
% plotting graph
% --------------------------------------------
  
tt = 0:dt:T-dt;
plot(tt,S,'b',tt,I,'r',tt,R,'g','LineWidth',2); grid on;
xlabel('Time'); ylabel('population density');
legend('S(t)','I(t)','R(t)');
hold off

% --------------------------------------------
% function
% --------------------------------------------
  
function [S,I,R] = sir_model(beta,gamma,N,I0,T,dt)
  % if delta = 0 we assume a model without immunity loss
  S = zeros(1,T/dt);
  S(1) = N - I0;
  I = zeros(1,T/dt);
  I(1) = I0;
  R =  = zeros(1,T/dt);
  for tt = 1:(T/dt)-1
    % Equation of model
    dS = (-beta*I(tt)*S(tt)) * dt;
    dI = (beta*I(tt)*S(tt) - gamma*I(tt) * dt);
    dR = (gamma*I(tt) * dt);
    S(tt+1) = S(tt) + dS;
    I(tt+1) = I(tt) + dI;
    R(tt+1) = R(tt) + dR;
  end
end
