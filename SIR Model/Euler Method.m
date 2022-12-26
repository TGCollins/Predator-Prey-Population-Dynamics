% ==============================================
% SIR Model with Euler Method
% ==============================================
close all; clear all; clc;
% ----------------------------------------------
% parameters
% ----------------------------------------------

beta = 5;     % rate of infection
gamma = 0.5;  % rate of recovery
  
% ----------------------------------------------
% Number of iterations
% ----------------------------------------------

N = 20;

% ----------------------------------------------
% Initial Conditions
% ----------------------------------------------
S = zeros(1,N);
I = zeros(1,N);
R = zeros(1,N);
S(1) = 997;   % Initial number of susceptibles
I(1) = 3;     % Initial number of infected
R(1) = 0;     % Initial number of recovered/removed population

% Recurrences

for n = 2:N
  S(n) = S(n-1) - 0.0016683*S(n-1)*I(n-1);
  I(n) = I(n-1) - 0.5*I(n-1) + 0.0016683*S(n-1)*I(n-1);
  R(n) = R(n-1) + 0.5*I(n-1);
end

% ----------------------------------------------
% Plotting Graph
% ----------------------------------------------
  
Xvals = 1:N;
plot(Xvals,S,'b',Xvals,I,'r',Xvals,R,'g','LineWidth',2); grid on;
xlabel('Time'); ylabel('Population Density');
legend('S(t)','I(t)','R(t)')
end
