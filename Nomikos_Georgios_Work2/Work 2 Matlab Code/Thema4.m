%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Thema 4

%In this script we will use the Levenberg-Marquardt method to find the minimmum of our
%objective function.

clc;
clear;

%Define the objective function f
syms x y 
f(x,y) = x^(3) * exp(-x^(2)-y^(4));

%Calculate the partial derivatives with repsect to x and y
df = jacobian(f, [x, y]);


%-----------------------x0 = 0 and y0 = 0-------------------------------
% x0 = 0 and y0 = 0
%gamma step = constant 

epsilon = 0.005;
x0 = [0, 0]; %This array contains both xo and yo

gamma_choice = 'Constant';
ConstantGamma = 0.5:2.5:8;

for i = 1:length(ConstantGamma)
    [x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y, ConstantGamma(i));
    
    figure;
    plot(1:k,f_values,'-o','LineWidth',2);
    title(sprintf('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 0, y0 = 0, gamma = %f',ConstantGamma(i)))
    xlabel('Iteration k');
    ylabel('f(x,y)');
    grid on
end

% x0 = 0 and y0 = 0
%gamma step = Variable that minimizes the f(xk+gk*dk)

epsilon = 0.005;
x0 = [0, 0]; %This array contains both xo and yo

gamma_choice = 'Variable';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-or','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 0, y0 = 0, gamma = Variable')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on

% x0 = 0 and y0 = 0
%gamma step satisfies the Armijo rule

epsilon = 0.005;
x0 = [0, 0]; %This array contains both xo and yo

gamma_choice = 'Armijo';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-og','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 0, y0 = 0, gamma = Armijo')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on


%-----------------------x0 = -1 and y0 = -1-------------------------------

% x0 = -1 and y0 = -1
%gamma step = constant 

epsilon = 0.005;
x0 = [-1, -1]; %This array contains both xo and yo

gamma_choice = 'Constant';
ConstantGamma = 0.5:2.5:8;

for i = 1:length(ConstantGamma)
    [x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y, ConstantGamma(i));
    
    figure;
    plot(1:k,f_values,'-o','LineWidth',2);
    title(sprintf('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = -1, y0 = -1, gamma = %f', ConstantGamma(i)))
    xlabel('Iteration k');
    ylabel('f(x,y)');
    grid on
end

% x0 = -1 and y0 = -1
%gamma step = Variable that minimizes the f(xk+gk*dk)

epsilon = 0.005;
x0 = [-1, -1]; %This array contains both xo and yo

gamma_choice = 'Variable';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-or','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = -1, y0 = -1, gamma = Variable')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on


% x0 = -1 and y0 = -1
%gamma step satisfies the Armijo rule

epsilon = 0.005;
x0 = [-1, -1]; %This array contains both xo and yo

gamma_choice = 'Armijo';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-og','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = -1, y0 = -1, gamma = Armijo')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on


%-----------------------x0 = 1 and y0 = 1-------------------------------

% x0 = 1 and y0 = 1
%gamma step = constant 

epsilon = 0.005;
x0 = [1, 1]; %This array contains both xo and yo

gamma_choice = 'Constant';
ConstantGamma = 0.5:2.5:8;

for i = 1:length(ConstantGamma)
    [x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y, ConstantGamma(i));
    
    figure;
    plot(1:k,f_values,'-o','LineWidth',2);
    title(sprintf('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 1, y0 = 1, gamma = %f', ConstantGamma(i)))
    xlabel('Iteration k');
    ylabel('f(x,y)');
    grid on
end

% x0 = 1 and y0 = 1
%gamma step = Variable that minimizes the f(xk+gk*dk)

epsilon = 0.005;
x0 = [1, 1]; %This array contains both xo and yo

gamma_choice = 'Variable';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-or','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 1, y0 = 1, gamma = Variable')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on


% x0 = 1 and y0 = 1
%gamma step satisfies the Armijo rule

epsilon = 0.005;
x0 = [1, 1]; %This array contains both xo and yo

gamma_choice = 'Armijo';

[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y);

figure;
plot(1:k,f_values,'-og','LineWidth',2);
title('Levenberg Marquardt | Convergence of the Objective function against the iteration number k | x0 = 1, y0 = 1, gamma = Armijo')
xlabel('Iteration k');
ylabel('f(x,y)');
grid on
