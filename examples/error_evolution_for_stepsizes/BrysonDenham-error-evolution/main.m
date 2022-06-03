% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Bryson Denham problem by parameterizing only control for multiple
% stepsizes
% -------------------------------------------------------------------------
% Primary Contributor: Nakul Randad, Indian Institute of Technology Bombay
% -------------------------------------------------------------------------
clear all;close all;

%% Set-up and solve problem

problem = BrysonDenham;          % Fetch the problem definition

hs = [6, 10, 20, 50, 100, 150];
for i = 1:length(hs)
    disp(["Number of steps set to", num2str(hs(i))]);
    iter(i).opt = options(hs(i), 5);        % Get options and solver settings
    iter(i).sol = solveProblem(problem, iter(i).opt);
    iter(i).h = hs(i);
end


%% Post-processing
postProcess(iter, problem)
