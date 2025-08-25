% This script performs parameter optimization using a Genetic Algorithm (GA)
% The objective is to minimize the squared norm of Euclidean distance residuals.
clc; clear; close all;
%% -------------------- System Matrix Definition --------------------
% Compute dependent variable
% System matrix A
%A = [  a11,  a12,  a13,  a14;
%        a12,  a11,  a14,  a13;
%       -a31,    0, -a33,    0;
%          0, -a31,    0, -a33 ];
%a11= -Beta*(m*d^2*r^2+4*J*d^2+4*I*r^2)/((2*J*d^2+4*I*r^2)*(m*r^2+2*J))
%a12= -Beta*r^2*(4*I-m*d^2)/((2*J*d^2+4*I*r^2)*(m*r^2+2*J))
%a13= Km*(m*d^2*r^2+4*J*d^2+4*I*r^2)/((2*J*d^2+4*I*r^2)*(m*r^2+2*J))
%a14 = (a12 * a13) / a11;
%a31=Km/L
%a33=R/L
% ##initial guess for the main robot parameters##
%Robot Mass (m)=1.67; Robot Inertia (I)=0.003; Motor Internal Resitance (R)=5 ;
%Wheel's Radius (r) = 0.0335 ; % Distance between the two Wheels (d) = 0.181 ; Motor Constant (Km) = 0.3012;
%Rotaionoal Friction coefficient (Beta) = 0.002 ; Motor Inductance (L) = 0.004; Wheel's Inertia (J)=0.001;
%% ------------------------ Initial Setup -------------------------------
% Initial guess for the variables to be optimized
% x0 = [a11, a12, a13, a31, a33, ain]
x0 = [ -0.001345749179267; 0.000313266633062; 0.202669826397573; ...
        0.0753; 1.25; 0.25 ] * 1.0e+03;
x0 = x0';  % Convert to row vector for population matrix
nvars = 6;  % Number of variables

%% ---------------------------- Bounds -----------------------------------
lb = [-1e4, 0, 0, 0, 0, 0];   % Lower bounds
ub = [0, 1e4, 1e4, 1e4, 1e4, 1e4];  % Upper bounds

%% ---------------------- Initial Population -----------------------------
popSize = 600;

% Randomly generate initial population within bounds
initialPopulation = repmat(lb, popSize, 1) + ...
                    rand(popSize, nvars) .* repmat(ub - lb, popSize, 1);

% Seed the first individual with the initial guess
initialPopulation(1, :) = x0;

%% ---------------------- Objective Function ------------------------------
% Squared norm of Euclidean distance residuals
objectiveFcn = @(x) norm(EuclideanDistance(x))^2;

%% --------------------------- GA Options ---------------------------------
options = gaoptimset('Display', 'iter', ...
                     'PopulationSize', popSize, ...
                     'InitialPopulation', initialPopulation, ...
                     'Generations', 3000, ...
                     'StallGenLimit', 100, ...
                     'TolFun', 1e-8, ...
                     'PlotFcn', {@gaCustomizedVisualizer});

%% --------------------- Run Genetic Algorithm -----------------------------
[xOpt, fvalOpt, exitFlag, output] = ga(objectiveFcn, nvars, ...
                                       [], [], [], [], lb, ub, [], options);

%% ------------------------- Display Results -------------------------------
fprintf('\nOptimized Solution:\n');
disp(xOpt);
fprintf('Residual Norm (Sum of Squares): %.6f\n', fvalOpt);
fprintf('GA Exit Flag: %d\n', exitFlag);
fprintf('Number of Generations: %d\n', output.generations);
