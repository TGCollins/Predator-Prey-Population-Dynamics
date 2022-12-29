test
% ===================================================
% two_ODEs_dir_field_trajectories.m
% ===================================================
close all; clear all; clc;

% produces a direction field for 2-ODE autonomous system dU/dt = f(t,U)
% and overlays phase plane trajectories for a number of initial conditions

% ---------------------------------------------------
% parameters
% ---------------------------------------------------

beta = 1.1;
delta = 1;
aD = 0.4;
aW = 0.1;

% ---------------------------------------------------
% Initial Conditions
% ---------------------------------------------------

U1_0 = [1, 2, 3, 4, 5];
U2_0 = [0.2, 0.25, 0.3, 0.35, 0.4];

% ---------------------------------------------------
% Time span
% ---------------------------------------------------

tend = 50;
N = 1000;
tspan = linspace(0,tend,N+1)
  
% ---------------------------------------------------
% X and Y grids for direction fields
% ---------------------------------------------------

U1var = 'D';
U2var = 'W';
U1vec = linspace(0,65,40);
U2vec = linspace(0,17,40);

% ---------------------------------------------------
% ODE system
% ---------------------------------------------------

dUdt = @(U) [beta * U(1) - aD*U(1).* U(2); % dU1/dt
              -delta * U(2) + aW * U(1).* U(2); dU2/dt

% ---------------------------------------------------
% plotting the graph
% ---------------------------------------------------

title_params = ('beta','delta','aD','aW');
set_title_details;
clf

two_ODEs_dir_field_fn(dUdt,U1vec,U2vec,U1var,U2var,title_details)
hold on
[t,U] = two_ODEs_phaseplane_fn(@(t,U) dUdt(U), tspan,[U1_0,U2_0],U1var,U2var,title_details);
hold off             
