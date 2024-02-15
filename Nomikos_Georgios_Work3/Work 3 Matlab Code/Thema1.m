%Georgios Nomikos

%Optimization Techniques | ECE Auth | 2023-24
%Work 3
%Thema 1
clc;
clear;

% Define the objective function f
syms x1 x2 
f(x1,x2) = (1/3) * (x1 ^ 2) + 3 * (x2 ^ 2);


df_dx1 = diff(f, x1); % Partial derivative with respect to x1
df_dx2 = diff(f, x2); % Partial derivative with respect to x2

%set the epsilon value
epsilon = 0.001;

%set the (x1_0, x2_0) starting point, except of (0,0) 
x1_0 = 10;
x2_0 = -10;

gamma_choice = 'Constant';

%set the gamma step values
ConstantGamma = [0.1, 0.3, 3, 5];

for i = 1:length(ConstantGamma)
    [x1_values, x2_values, k, f_values] = Steepest_Descent(f, epsilon, x1_0, x2_0, gamma_choice, df_dx1, df_dx2, x1, x2, ConstantGamma(i));  
    
    figure;
    plot(1:k,f_values,'-o','LineWidth',2);
    title(sprintf('Steepest Descent | Convergence of the Objective function for k iterations | x1_0 = %.1f, x2_0 = %.1f, gamma = %.1f',x1_0, x2_0, ConstantGamma(i)))
    xlabel('Iteration k');
    ylabel('f(x_1,x_2)');
    grid on

end
