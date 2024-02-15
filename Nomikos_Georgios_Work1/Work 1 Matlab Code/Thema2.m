%Georgios Nomikos
%Optimization Techniques | ECE Auth | 2023-24
%Work 1
%Thema 2

%This script is is divided into 3 parts,
%one for every one of the three available mathematical functions.
%We implement the golden-section search method of finding the interval
%in which the minimum value of the objective function exists.

clc;
clear all;

%Define the 3 mathematical functions 
f1 = @(x) (x-1)^3 + (x-4)^2 * cos(x);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) x^2 * log(0.5*x) + sin((0.2 * x)^2);

%set the gamma parameter
gamma = 0.618;

%-----------------
%Using f1 function
%-----------------

%Here we will store the [a,b] intervals, so that we can use them later for
%plotting.
a_results = zeros(100,38);
b_results = zeros(100,38);

%initialize an array to store the number of the performed calculations, so
%that we can use that values for plotting
Calculations_performed = [];

%Useful variable "l_step" that will increase for every change of the l value 
l_step = 1;

%initialize an array to store the l values that are produced by the 
% 'for loop' below
l_values = [];

%An array that will contain the k required for the Golden section method to find
%the final interval[a,b] for each l
k_needed = [];

for l = 0.01:0.005:0.2

    %initialize k for each l value
    k = 1;

    % Initialize a and b for the current l value
    a = [];
    b = [];
    a(1) = 0;
    b(1) = 3;

    %initialize the x1 and x2 arrays
    x1 = [];
    x2 = [];

    a_results(1,l_step) = a(1);
    b_results(1,l_step) = b(1);

    x1(1) = a(1) + (1 - gamma) * (b(1) - a(1));
    x2(1) = a(1) + gamma * (b(1) - a(1));

    l_values(l_step) = l; 
    
    while b(k) - a(k) >= l
    
        if f1(x1(k)) > f1(x2(k))

            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + gamma * (b(k+1) - a(k+1));
            x1(k+1) = x2(k);
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1-gamma) * (b(k+1) - a(k+1));
        end
        
        %Save the [a,b] intervals
        a_results(k+1,l_step) = a(k+1);
        b_results(k+1,l_step) = b(k+1);

        k = k + 1;
    
    end

    k_needed(l_step) = k-1;
    
    %For every k, we perform two calculations of the objective function!
    Calculations_performed(l_step) = 2 * (k-1);

    l_step = l_step + 1;

end

figure
plot(l_values,Calculations_performed,'ro','linewidth',2)
grid on
xlabel('l value')
ylabel('f1 Calculations')
title('Calculations performed for f1 function in Golden section method')

figure
plot(1:k_needed(1), a_results(1:k_needed(1),1),'-o')
hold on
plot(1:k_needed(1), b_results(1:k_needed(1),1),'-o')

hold on
plot(1:k_needed(25), a_results(1:k_needed(25),25),'-o')
hold on
plot(1:k_needed(25), b_results(1:k_needed(25),25),'-o')

hold on
plot(1:k_needed(35), a_results(1:k_needed(35),35),'-o')
hold on
plot(1:k_needed(35), b_results(1:k_needed(35),35),'-o')

legend( ...
    sprintf('ak for 𝑙=%f', l_values(1)), sprintf('bk for 𝑙=%f', l_values(1)), ...
    sprintf('ak for 𝑙=%f', l_values(25)), sprintf('bk for 𝑙=%f', l_values(25)), ...
    sprintf('ak for 𝑙=%f', l_values(35)), sprintf('bk for 𝑙=%f', l_values(35)), 'location','best' ...
    );
title('Golden section method-Function 1: [ak,bk] intervals for each k, for 3 different l values')
xlabel('k')
ylabel('[ak,bk] Interval')



%-----------------
%Using f2 function
%-----------------

%Here we will store the [a,b] intervals, so that we can use them later for
%plotting.
a_results = zeros(100,38);
b_results = zeros(100,38);

%initialize an array to store the number of the performed calculations, so
%that we can use that values for plotting
Calculations_performed = [];

%Useful variable "l_step" that will increase for every change of the l value 
l_step = 1;

%initialize an array to store the l values that are produced by the 
% 'for loop' below
l_values = [];

%An array that will contain the k required for the Golden section method to find
%the final interval[a,b] for each l
k_needed = [];

for l = 0.01:0.005:0.2

    %initialize k for each l value
    k = 1;

    % Initialize a and b for the current l value
    a = [];
    b = [];
    a(1) = 0;
    b(1) = 3;

    %initialize the x1 and x2 arrays
    x1 = [];
    x2 = [];

    a_results(1,l_step) = a(1);
    b_results(1,l_step) = b(1);

    x1(1) = a(1) + (1 - gamma) * (b(1) - a(1));
    x2(1) = a(1) + gamma * (b(1) - a(1));

    l_values(l_step) = l; 
    
    while b(k) - a(k) >= l
    
        if f2(x1(k)) > f2(x2(k))

            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + gamma * (b(k+1) - a(k+1));
            x1(k+1) = x2(k);
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1-gamma) * (b(k+1) - a(k+1));
        end
        
        %Save the [a,b] intervals
        a_results(k+1,l_step) = a(k+1);
        b_results(k+1,l_step) = b(k+1);

        k = k + 1;
    
    end

    k_needed(l_step) = k-1;
    
    %For every k, we perform two calculations of the objective function!
    Calculations_performed(l_step) = 2 * (k-1);

    l_step = l_step + 1;

end

figure
plot(l_values,Calculations_performed,'ro','linewidth',2)
grid on
xlabel('l value')
ylabel('f2 Calculations')
title('Calculations performed for f2 function in Golden section method')

figure
plot(1:k_needed(1), a_results(1:k_needed(1),1),'-o')
hold on
plot(1:k_needed(1), b_results(1:k_needed(1),1),'-o')

hold on
plot(1:k_needed(25), a_results(1:k_needed(25),25),'-o')
hold on
plot(1:k_needed(25), b_results(1:k_needed(25),25),'-o')

hold on
plot(1:k_needed(35), a_results(1:k_needed(35),35),'-o')
hold on
plot(1:k_needed(35), b_results(1:k_needed(35),35),'-o')

legend( ...
    sprintf('ak for 𝑙=%f', l_values(1)), sprintf('bk for 𝑙=%f', l_values(1)), ...
    sprintf('ak for 𝑙=%f', l_values(25)), sprintf('bk for 𝑙=%f', l_values(25)), ...
    sprintf('ak for 𝑙=%f', l_values(35)), sprintf('bk for 𝑙=%f', l_values(35)), 'location','best' ...
    );
title('Golden section method-Function 2: [ak,bk] intervals for each k, for 3 different l values')
xlabel('k')
ylabel('[ak,bk] Interval')


%-----------------
%Using f3 function
%-----------------

%Here we will store the [a,b] intervals, so that we can use them later for
%plotting.
a_results = zeros(100,38);
b_results = zeros(100,38);

%initialize an array to store the number of the performed calculations, so
%that we can use that values for plotting
Calculations_performed = [];

%Useful variable "l_step" that will increase for every change of the l value 
l_step = 1;

%initialize an array to store the l values that are produced by the 
% 'for loop' below
l_values = [];

%An array that will contain the k required for the Golden section method to find
%the final interval[a,b] for each l
k_needed = [];

for l = 0.01:0.005:0.2

    %initialize k for each l value
    k = 1;

    % Initialize a and b for the current l value
    a = [];
    b = [];
    a(1) = 0;
    b(1) = 3;

    %initialize the x1 and x2 arrays
    x1 = [];
    x2 = [];

    a_results(1,l_step) = a(1);
    b_results(1,l_step) = b(1);

    x1(1) = a(1) + (1 - gamma) * (b(1) - a(1));
    x2(1) = a(1) + gamma * (b(1) - a(1));

    l_values(l_step) = l; 
    
    while b(k) - a(k) >= l
    
        if f3(x1(k)) > f3(x2(k))

            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + gamma * (b(k+1) - a(k+1));
            x1(k+1) = x2(k);
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1-gamma) * (b(k+1) - a(k+1));
        end
        
        %Save the [a,b] intervals
        a_results(k+1,l_step) = a(k+1);
        b_results(k+1,l_step) = b(k+1);

        k = k + 1;
    
    end

    k_needed(l_step) = k-1;
    
    %For every k, we perform two calculations of the objective function!
    Calculations_performed(l_step) = 2 * (k-1);

    l_step = l_step + 1;

end

figure
plot(l_values,Calculations_performed,'ro','linewidth',2)
grid on
xlabel('l value')
ylabel('f3 Calculations')
title('Calculations performed for f3 function in Golden section method')

figure
plot(1:k_needed(1), a_results(1:k_needed(1),1),'-o')
hold on
plot(1:k_needed(1), b_results(1:k_needed(1),1),'-o')

hold on
plot(1:k_needed(25), a_results(1:k_needed(25),25),'-o')
hold on
plot(1:k_needed(25), b_results(1:k_needed(25),25),'-o')

hold on
plot(1:k_needed(35), a_results(1:k_needed(35),35),'-o')
hold on
plot(1:k_needed(35), b_results(1:k_needed(35),35),'-o')

legend( ...
    sprintf('ak for 𝑙=%f', l_values(1)), sprintf('bk for 𝑙=%f', l_values(1)), ...
    sprintf('ak for 𝑙=%f', l_values(25)), sprintf('bk for 𝑙=%f', l_values(25)), ...
    sprintf('ak for 𝑙=%f', l_values(35)), sprintf('bk for 𝑙=%f', l_values(35)), 'location','best' ...
    );
title('Golden section method-Function 3: [ak,bk] intervals for each k, for 3 different l values')
xlabel('k')
ylabel('[ak,bk] Interval')