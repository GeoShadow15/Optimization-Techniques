%Georgios Nomikos
%Optimization Techniques | ECE Auth | 2023-24
%Work 1
%Thema 3

%This script is is divided into 3 parts,
%one for every one of the three available mathematical functions.
%We implement the fibonacci search method of finding the interval
%in which the minimum value of the objective function exists.
%We call the Fibonacci_method function that exists in the project folder.

clc;
clear all;

%Define the 3 mathematical functions 
f1 = @(x) (x-1)^3 + (x-4)^2 * cos(x);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) x^2 * log(0.5*x) + sin((0.2 * x)^2);

%set the epsilon parameter
epsilon = 0.001;

%-----------------
%Using f1 function
%-----------------

%We choose the same l values as in the bisection and the Golden section
%methods
l_values = 0.01:0.005:0.2;
a1 = 0;
b1 = 3;

% Initialize arrays to store results
a_results = cell(3, 1);
b_results = cell(3, 1);

l_indices = [1, 25, 35];

% Initialize the figure for plotting
figure;

for subplot_idx = 1:3
    l_idx = l_indices(subplot_idx);
    l = l_values(l_idx);
    
    % Call Fibonacci_method
    [a, b, k] = Fibonacci_method(f1, l, epsilon, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+2, a, 'r-o', 1:k+2, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 1: Fibonacci Search Method for three different l values');

%In this parth we plot the objective function calculations required for the
%different l values
%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l_values),1);
k_needed_idx = 1;

for l = 0.01:0.005:0.2
    [a, b, k] = Fibonacci_method(f1, l, epsilon, a1, b1);
    k_needed(k_needed_idx) = k+1;
    k_needed_idx = k_needed_idx + 1;
end

%For each k, we perform one calculation of the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f1 Calculations')
xlabel('l value')
title('Calculations performed for f1 function in Fibonacci method')

%-----------------
%Using f2 function
%-----------------

%We choose the same l values as in the bisection and the Golden section
%methods
l_values = 0.01:0.005:0.2;
a1 = 0;
b1 = 3;

% Initialize arrays to store results
a_results = cell(3, 1);
b_results = cell(3, 1);

l_indices = [1, 25, 35];

% Initialize the figure for plotting
figure;

for subplot_idx = 1:3
    l_idx = l_indices(subplot_idx);
    l = l_values(l_idx);
    
    % Call Fibonacci_method
    [a, b, k] = Fibonacci_method(f2, l, epsilon, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+2, a, 'r-o', 1:k+2, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 2: Fibonacci Search Method for three different l values');

%In this parth we plot the objective function calculations required for the
%different l values
%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l_values),1);
k_needed_idx = 1;

for l = 0.01:0.005:0.2
    [a, b, k] = Fibonacci_method(f2, l, epsilon, a1, b1);
    k_needed(k_needed_idx) = k+1;
    k_needed_idx = k_needed_idx + 1;
end

%For each k, we perform one calculation oof the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f2 Calculations')
xlabel('l value')
title('Calculations performed for f2 function in Fibonacci method')


%-----------------
%Using f3 function
%-----------------

%We choose the same l values as in the bisection and the Golden section
%methods
l_values = 0.01:0.005:0.2;
a1 = 0;
b1 = 3;

% Initialize arrays to store results
a_results = cell(3, 1);
b_results = cell(3, 1);

l_indices = [1, 25, 35];

% Initialize the figure for plotting
figure;

for subplot_idx = 1:3
    l_idx = l_indices(subplot_idx);
    l = l_values(l_idx);
    
    % Call Fibonacci_method
    [a, b, k] = Fibonacci_method(f3, l, epsilon, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+2, a, 'r-o', 1:k+2, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 3: Fibonacci Search Method for three different l values');

%In this parth we plot the objective function calculations required for the
%different l values
%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l_values),1);
k_needed_idx = 1;

for l = 0.01:0.005:0.2
    [a, b, k] = Fibonacci_method(f3, l, epsilon, a1, b1);
    k_needed(k_needed_idx) = k+1;
    k_needed_idx = k_needed_idx + 1;
end

%For each k, we perform one calculation oof the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f3 Calculations')
xlabel('l value')
title('Calculations performed for f3 function in Fibonacci method')






