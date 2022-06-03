% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Template problem by parameterizing only control
% -------------------------------------------------------------------------
% Primary Contributors: 
% Nakul Randad, Indian Institute of Technology Bombay
% Siddhartha Ganguly, Indian Institute of Technology Bombay
% -------------------------------------------------------------------------
clear all;
close all;

%% Set-up and solve problem

problem = TemplateProblem;          % Fetch the problem definition
opts = options(200, 5);        % Get options and solver settings (h, D)
solution = solveProblem(problem, opts);

%% Post-processing

postProcess(solution, problem, opts)
