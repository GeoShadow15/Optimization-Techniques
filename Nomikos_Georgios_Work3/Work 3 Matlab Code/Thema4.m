%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 3
%Thema 4
clc;
clear;

% Define the objective function f
syms x1 x2 
f(x1,x2) = (1/3) * (x1 ^ 2) + 3 * x2 ^ 2;


df_dx1 = diff(f, x1); % Partial derivative with respect to x1
df_dx2 = diff(f, x2); % Partial derivative with respect to x2


%set the epsilon value
epsilon = 0.01;

%set the (x1_0, x2_0) starting point so that (x1_0 != 0) and (x2_0 != 0)
x1_0 = 8;
x2_0 = -10;

gamma_choice = 'Constant';

%set the gamma step value
ConstantGamma = 0.05;

%set sk
sk = 0.1;

%set the boundaries of the x1 and x2 values range 
ax1 = -10;
bx1 = 5;

ax2 = -8;
bx2 = 12;

%Call the Steepest_Descent_with_projection function
[x1_values, x2_values, k, f_values] = Steepest_Descent_with_projection(f, epsilon, x1_0, x2_0, gamma_choice, df_dx1, df_dx2, x1, x2, ConstantGamma, sk, ax1, bx1, ax2, bx2);  

%Create the algorithm's convergence plot
figure;
plot(1:k,f_values,'-o','LineWidth',2);
title(sprintf('Steepest Descent with projection | Convergence of the Objective function for k iterations | x1_0 = %.1f, x2_0 = %.1f, gamma = %.1f, sk = %.1f',x1_0, x2_0, ConstantGamma,sk))
xlabel('Iteration k');
ylabel('f(x_1,x_2)');
grid on
