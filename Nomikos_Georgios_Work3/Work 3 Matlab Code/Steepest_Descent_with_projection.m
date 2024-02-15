%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Steepest Descent

%In this script we implement the Steepest Descent method, so that we can use it for
%the 2nd part of this asignment. 


function [x1_values, x2_values, k, f_values] = Steepest_Descent_with_projection(f, epsilon, x1_0, x2_0, gamma_choice, df_dx1, df_dx2, x1, x2, ConstantGamma, sk, ax1, bx1, ax2, bx2)


    %Initialize an array to store the x1 and x2 for every step k
    x1_values = zeros(1500, 1);
    x2_values = zeros(1500, 1);

    x1_values(1) = x1_0;
    x2_values(1) = x2_0;

    %Initialize an array to store the x1_bar and x2_bar for every step k.
    %Note that x1_bar(k) is the projection of x1_values(k) + sk * d(k,1) to the feasible region 
    %and x2_bar(k) is the projection of x2_values(k) + sk * d(k,2) to the feasible region
    x1_bar = zeros(1500, 1);
    x2_bar = zeros(1500, 1);

    % Initialize an array to store the objective function values
    f_values = [];
    
    f_values(1) = double(f(x1_values(1), x2_values(1)));

    %Initialize an array to store the gamma values
    gamma = [];

    %Initialize an array to store the paprtial derivatives
    d = zeros(1500, 2);

    %set the k value
    k = 1;


    while norm(double([subs(df_dx1, [x1, x2], [x1_values(k), x2_values(k)]), subs(df_dx2, [x1, x2], [x1_values(k), x2_values(k)])])) >= epsilon
        
        d(k,1) = - (double(subs(df_dx1, [x1, x2], [x1_values(k), x2_values(k)])));
        d(k,2) = - (double(subs(df_dx2, [x1, x2], [x1_values(k), x2_values(k)])));
        
        if strcmp(gamma_choice, 'Constant')
            % Code for 'Constant' case
            gamma(k) = ConstantGamma;
            
        elseif strcmp(gamma_choice, 'Variable')
            % Code for 'Variable' case
            syms gamma_value
            g_function(gamma_value) = f(x1_values(k) + gamma_value * d(k,1), x2_values(k) + gamma_value * d(k,2));
            dg = diff(g_function,'gamma_value');
            gamma(k) = Minimizef(dg);
            
        elseif strcmp(gamma_choice, 'Armijo')
            % Code for 'Armijo' case
            gamma(k) = Armijo(x1_values(k), x2_values(k), d(k,1), d(k,2));
            
        else
            error('Invalid argument in "gamma_choice". Please use ''Constant'' or ''Variable'' or ''Armijo''.');
        end

        %Perform the projection to the feasible region
        %for x1
        if x1_values(k) + sk * d(k,1) >= ax1 && x1_values(k) + sk * d(k,1) <= bx1
            x1_bar(k) = x1_values(k) + sk * d(k,1);
        else
            if x1_values(k) + sk * d(k,1) < ax1
                x1_bar(k) = ax1;
            elseif x1_values(k) + sk * d(k,1) > bx1
                x1_bar(k) = bx1;
            end
        end

        %for x2
        if x2_values(k) + sk * d(k,2) >= ax2 && x2_values(k) + sk * d(k,2) <= bx2
            x2_bar(k) = x2_values(k) + sk * d(k,2);
        else
            if x2_values(k) + sk * d(k,2) < ax2
                x2_bar(k) = ax2;
            elseif x2_values(k) + sk * d(k,2) > bx2
                x2_bar(k) = bx2;
            end
        end
        %end of the projection


        %Update the x1 and x2 values
        x1_values(k+1) = x1_values(k) + gamma(k) * (x1_bar(k) - x1_values(k));
        x2_values(k+1) = x2_values(k) + gamma(k) * (x2_bar(k) - x2_values(k));

        f_values(k+1) = double(f(x1_values(k + 1), x2_values(k + 1)));
        disp(k)
        k = k + 1;
        
        %break an infinite loop in k = 500 iterations
        if k == 500
            break;
        end
        
    end
end