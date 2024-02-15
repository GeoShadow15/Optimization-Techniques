%Georgios Nomikos

%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Newton Method

%In this script we implement the Newton Method, so that we can use it for
%the 3rd part of this asignment. 

function[x_values, y_values, k, f_values] = Newton_method(f, epsilon, x0, y0, gamma_choice, df_dx, df_dy, x, y, ConstantGamma)
    
    hessian_of_f = hessian(f,[x,y]);

    %Initialize step k
    k = 1;

    %Initialize an array to store the x, y and f(x,y) for every step k
    x_values = [];
    y_values = [];
    f_values = [];

    x_values(1) = x0;
    y_values(1) = y0;

    d = zeros(1500, 2);

    d_commulative = zeros(2,1);

    %Initialize an array to store the gamma values
    gamma = [];

    while 1

        if norm([subs(df_dx, [x, y], [x_values(k), y_values(k)]), subs(df_dy, [x, y], [x_values(k), y_values(k)])]) < epsilon
            break;
      
        else
            
            hessian_k = double(subs(hessian_of_f,[x,y],[x_values(k),y_values(k)]));
            eigenvalues = eig(hessian_k);
       
            % Check if all eigenvalues are positive
            if ~all(eigenvalues > 0)
                disp("The Hessian matrix is not positive-definite matrix.")
                break;
            end
   
            
            f_values(k) = f(x_values(k), y_values(k));

            grad_k = [double(subs(df_dx,[x,y],[x_values(k), y_values(k)])); double(subs(df_dy,[x,y],[x_values(k), y_values(k)]))];
            
            d_commulative = -inv(hessian_k) * grad_k;
            
            d(k,1) = d_commulative(1);
            d(k,2) = d_commulative(2);

            
            %Set the gamma value
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
    
            x_values(k+1) = x_values(k) + gamma * d(k,1);
            y_values(k+1) = y_values(k) + gamma * d(k,2);
            
            k = k + 1; 
        end
    end

    f_values(k) = f(x_values(k), y_values(k));

end
