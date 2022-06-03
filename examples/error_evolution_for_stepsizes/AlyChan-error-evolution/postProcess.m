function postProcess(iter, problem)
% postProcess - Show all the the required plots and process the solution
%
% Syntax:  postProcess(iter, problem)
%
% Output:
%    returns none

%------------- BEGIN CODE --------------
times = [];
costs = [];
max_errors = [];
hs = [];

for i = 1:length(iter)
    hs = [hs; iter(i).h];
    solution = iter(i).sol;
    options = iter(i).opt;
    
    num_of_steps = options.nodes;
    U_app = solution.U_app;
    opti = solution.output;
    tau = solution.tau;
    
    times = [times, solution.time_taken];
    costs = [costs, solution.cost];
    
    % Extract optimal values
    X_out = zeros(problem.nx, num_of_steps);
    U_out = zeros(problem.nu, num_of_steps - 1); % last value of control not useful
    U_opt = zeros(1, num_of_steps - 1);
    for i = 1 : num_of_steps
        U_out(:, i) = opti.value(U_app(:, i));
        U_opt(:, i) = optimalControl(tau(i));
    end

    max_error = max(abs(U_out(:, i) - U_opt(:, i)));
    max_errors = [max_errors, max_error];
end

figure
plot(hs, max_errors,'b','LineWidth',1);
grid on;
ylabel("Max absolute error");
xlabel("Number of steps");

figure
loglog(hs, max_errors,'b','LineWidth',1);
grid on;
xlabel("Number of steps");
ylabel("Max absolute error");

%-------------- END CODE ---------------
end

% Analytial Solution
function u = optimalControl(t)
    u = -sin(t);
end