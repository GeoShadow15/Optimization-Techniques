%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 3

%In this script, we perform a visualization of the given mathematical function 
clc;
clear;

% Define the objective function f
syms x1 x2 
f(x1,x2) = (1/3) * (x1 ^ 2) + 3 * x2 ^ 2;

% Generate x and y
x1_values = linspace(-12, 12, 200); 
x2_values = linspace(-12, 12, 200);

[x1, x2] = meshgrid(x1_values, x2_values);

% Plot the 3D surface 
figure;
ezsurf(f, [-12, 12, -12, 12]); 
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
title('3D Surface Plot');

% Plot the 2D graph
figure
contourf(x1, x2, double(f(x1, x2)), 20);  
xlabel('x1');
ylabel('x2');
colorbar; 
c = colorbar;
c.Label.String = 'f(x1,x2)';
grid on
title('2D Contour Plot');


% Plot the 2D graph with the feasible region
figure
contourf(x1, x2, double(f(x1, x2)), 20);
xlabel('x1');
ylabel('x2');
colorbar;
c = colorbar;
c.Label.String = 'f(x1,x2)';
grid on
title('2D Contour Plot with the Feasible region');
% Draw the feasible region
hold on;
feasibleRegion = fill([5, 5, -10, -10], [12, -8, -8, 12], 'g', 'FaceAlpha', 0.3);
hold off;
legend(feasibleRegion, 'Feasible Region');



