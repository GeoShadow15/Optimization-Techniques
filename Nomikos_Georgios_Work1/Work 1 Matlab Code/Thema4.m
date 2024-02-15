%Georgios Nomikos
%Optimization Techniques | ECE Auth | 2023-24
%Work 1
%Thema 4

clc;
clear all;

%in this script, we use the syms function to define x as a symbolic
%variable and we define the 3 mathematical functions
syms x;
f1(x) = (x - 1)^3 + (x - 4)^2 * cos(x);
f2(x) = exp(-2*x) + (x - 2)^2;
f3(x) = x^2 * log(0.5*x) + sin((0.2 * x)^2);

%Calculate the derivatives of these functions
df1 = diff(f1,'x');
df2 = diff(f2,'x');
df3 = diff(f3,'x');

%-----------------
%Using f1 function
%-----------------

%In this parth we plot the objective function calculations required for the
%different l values
l = 0.01:0.005:0.2;

%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l),1);
k_needed_idx = 1;

%Set the initial [a1,b1] interval
a1 = 0;
b1 = 3;

for l = 0.01:0.005:0.2
    [a, b, k] = Bisection_with_Derivatives(df1, l, a1, b1);
    k_needed(k_needed_idx) = k;
    k_needed_idx = k_needed_idx + 1;

end


%For each k, we perform one calculation of the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f1 Calculations')
xlabel('l value')
title('Calculations performed for f1 function in Bisection with derivatives method')

%In this part we will plot the [a,b] intervals, with respect to the k
%values, for 3 l values.
%We choose the same l values as in the bisection, the Golden section
%and the Fibonacci methods.
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
    
    % Call Bisection_with_Derivatives
    [a, b, k] = Bisection_with_Derivatives(df1, l, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+1, a, 'r-o', 1:k+1, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 1: Bisection with derivatives Method for three different l values');


%-----------------
%Using f2 function
%-----------------

%In this parth we plot the objective function calculations required for the
%different l values
l = 0.01:0.005:0.2;

%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l),1);
k_needed_idx = 1;

%Set the initial [a1,b1] interval
a1 = 0;
b1 = 3;

for l = 0.01:0.005:0.2
    [a, b, k] = Bisection_with_Derivatives(df2, l, a1, b1);
    k_needed(k_needed_idx) = k;
    k_needed_idx = k_needed_idx + 1;

end


%For each k, we perform one calculation of the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f2 Calculations')
xlabel('l value')
title('Calculations performed for f2 function in Bisection with derivatives method')

%In this part we will plot the [a,b] intervals, with respect to the k
%values, for 3 l values.
%We choose the same l values as in the bisection, the Golden section
%and the Fibonacci methods.
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
    
    % Call Bisection_with_Derivatives
    [a, b, k] = Bisection_with_Derivatives(df2, l, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+1, a, 'r-o', 1:k+1, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 2: Bisection with derivatives Method for three different l values');


%-----------------
%Using f3 function
%-----------------

%In this parth we plot the objective function calculations required for the
%different l values
l = 0.01:0.005:0.2;

%Initialize an array to save the k iterations for each l value
k_needed = zeros(length(l),1);
k_needed_idx = 1;

%Set the initial [a1,b1] interval
a1 = 0;
b1 = 3;

for l = 0.01:0.005:0.2
    [a, b, k] = Bisection_with_Derivatives(df3, l, a1, b1);
    k_needed(k_needed_idx) = k;
    k_needed_idx = k_needed_idx + 1;

end


%For each k, we perform one calculation of the objective function
figure
l = 0.01:0.005:0.2;
plot(l,k_needed,'ro','linewidth',2)
ylabel('f3 Calculations')
xlabel('l value')
title('Calculations performed for f3 function in Bisection with derivatives method')

%In this part we will plot the [a,b] intervals, with respect to the k
%values, for 3 l values.
%We choose the same l values as in the bisection, the Golden section
%and the Fibonacci methods.
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
    
    % Call Bisection_with_Derivatives
    [a, b, k] = Bisection_with_Derivatives(df3, l, a1, b1);
    
    % Store the results
    a_results{subplot_idx} = a;
    b_results{subplot_idx} = b;
    
    % Create a subplot for each l value
    subplot(1, 3, subplot_idx);
    plot(1:k+1, a, 'r-o', 1:k+1, b, 'b-o', 'LineWidth', 2);
    title(['l = ', num2str(l)]);
    xlabel('k');
    ylabel('[a, b] Intervals');
    legend('a', 'b','Location','best');
    
end

sgtitle('Function 3: Bisection with derivatives Method for three different l values');