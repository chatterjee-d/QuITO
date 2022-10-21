% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Rayleigh problem with constrained control
% -------------------------------------------------------------------------
% Primary Contributors: 
% - Nakul Randad, Indian Institute of Technology Bombay
% - Siddhartha Ganguly, Indian Institute of Technology Bombay
% Refer the article: S. Ganguly, N. Randad, D. Chatterjee, and R. Banavar
% Constrained optimal trajectory synthesis driven by quasi-interpolation.
% IEEE Control Systems Letters.
% -------------------------------------------------------------------------
clear all;
close all;

%% Set-up and solve problem

problem = RayleighProblemControlConstraints;          % Fetch the problem definition
opts = options(100, 5);        % Get options and solver settings (h, D)
solution = solveProblem(problem, opts);

%% Post-processing

postProcess(solution, problem, opts)
