% Script to solve the Optimal Control Problem. Run this file.
% Formulate the problem and settings in the other two function files.
%
% Aly Chan problem by parameterizing only control for multiple stepsizes
% -------------------------------------------------------------------------
% Primary Contributor: Nakul Randad, Indian Institute of Technology Bombay
% -------------------------------------------------------------------------
clear all;
close all;

%% Set-up and solve problem

problem = AlyChan;          % Fetch the problem definition

hs = [10, 20, 50, 80, 100, 150, 200, 300];
for i = 1:length(hs)
    disp(["Number of steps set to", num2str(hs(i))]);
    iter(i).opt = options(hs(i), 10);        % Get options and solver settings
    iter(i).sol = solveProblem(problem, iter(i).opt);
    iter(i).h = hs(i);
end


%% Post-processing
postProcess(iter, problem)
