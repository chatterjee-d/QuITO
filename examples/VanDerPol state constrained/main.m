% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Van der Pol state constrained optimal control problem 
% -------------------------------------------------------------------------
% Primary Contributors: 
% - Nakul Randad, Indian Institute of Technology Bombay
% - Siddhartha Ganguly, Indian Institute of Technology Bombay
% Refer the article: S. Ganguly, N. Randad, D. Chatterjee, and R. Banavar
% Constrained optimal trajectory synthesis driven by quasi-interpolation.
% IEEE Control Systems Letters.
% -------------------------------------------------------------------------
clear all;close all;

%% Set-up and solve problem

problem = VanDerPol;          % Fetch the problem definition
options = options(50, 2);        % Get options and solver settings 
solution = solveProblem(problem, options);

%% Post-processing

postProcess(solution, problem, options)
