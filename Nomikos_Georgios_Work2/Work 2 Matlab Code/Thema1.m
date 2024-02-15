%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Thema 1
clc;
clear;

% Define the objective function f
syms x y 
f(x,y) = x^(3) * exp(-x^(2)-y^(4));

% Generate x and y
x_values = linspace(-4, 4, 200); 
y_values = linspace(-4, 4, 200);

[x, y] = meshgrid(x_values, y_values);

% Plot the 3D surface 
figure;
ezsurf(f, [-4, 4, -4, 4]); 
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('3D Surface Plot');

% Plot the 2D graph
figure
contourf(x, y, double(f(x, y)), 20);  
xlabel('x');
ylabel('y');
colorbar; 
c = colorbar;
c.Label.String = 'f(x,y)';
grid on
title('2D Contour Plot');

% Plot the projection in the yz plane
% Calculate the function for y = 0
for i = 1:length(x_values)
    z_values(i) = f(x_values(i), 0);
end

figure;
plot(x_values, z_values, 'LineWidth', 2);
xlabel('x');
ylabel('f(x, 0)');
title('Projection of f(x, y) to the xz plane (y = 0)');
grid on;

