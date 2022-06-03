% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Bryson Denham problem by parameterizing only control
% -------------------------------------------------------------------------
% Primary Contributor: Nakul Randad, Indian Institute of Technology Bombay
% -------------------------------------------------------------------------
clear all;close all;

%% Set-up and solve problem

problem = BrysonDenham;          % Fetch the problem definition
options = options(10, 5);        % Get options and solver settings 
solution = solveProblem(problem, options);

%% Post-processing

postProcess(solution, problem, options)
