%Georgios Nomikos

%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Steepest Descent

%In this script we implement the Steepest Descent method, so that we can use it for
%the 2nd part of this asignment. 


function [x_values, y_values, k, f_values] = Steepest_Descent(f, epsilon, x0, y0, gamma_choice, df_dx, df_dy, x, y, ConstantGamma)


    %Initialize an array to store the x and y for every step k
    x_values = [];
    y_values = [];

    x_values(1) = x0;
    y_values(1) = y0;

    % Initialize an array to store the objective function values
    f_values = [];
    
    f_values(1) = double(f(x_values(1), y_values(1)));

    %Initialize an array to store the gamma values
    gamma = [];

    %Initialize an array to store the paprtial derivatives
    d = zeros(1500, 2);

    %set the k value
    k = 1;


    while (norm(double([subs(df_dx, [x, y], [x_values(k), y_values(k)]), subs(df_dy, [x, y], [x_values(k), y_values(k)])])) >= epsilon)
        

        d(k,1) = - double(subs(df_dx, [x, y], [x_values(k), y_values(k)]));
        d(k,2) = - double(subs(df_dy, [x, y], [x_values(k), y_values(k)]));
        
        if strcmp(gamma_choice, 'Constant')
            % Code for 'Constant' case
            gamma(k) = ConstantGamma;
            
        elseif strcmp(gamma_choice, 'Variable')
            % Code for 'Variable' case
            syms gamma_value
            g_function(gamma_value) = f(x_values(k) + gamma_value * d(k,1), y_values(k) + gamma_value * d(k,2));
            dg = diff(g_function,'gamma_value');
            gamma(k) = Minimizef(dg);
            
        elseif strcmp(gamma_choice, 'Armijo')
            % Code for 'Armijo' case
            gamma(k) = Armijo(x_values(k), y_values(k), d(k,1), d(k,2));
            
        else
            error('Invalid argument in "gamma_choice". Please use ''Constant'' or ''Variable'' or ''Armijo''.');
        end

        x_values(k+1) = x_values(k) + gamma(k) *  d(k,1);
        y_values(k+1) = y_values(k) + gamma(k) *  d(k,2);
        
        f_values(k+1) = double(f(x_values(k + 1), y_values(k + 1)));
        
        k = k + 1;
        
    end

end
