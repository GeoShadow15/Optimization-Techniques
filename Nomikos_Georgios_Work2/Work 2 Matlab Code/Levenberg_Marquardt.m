%Georgios Nomikos
%AEM: 9857
%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Levenberg-Marquardt Method

%In this script we implement the Levenberg-Marquardt Method, so that we can 
%use it for the 4th part of this asignment. 

function[x_values, k, f_values] = Levenberg_Marquardt(f, epsilon, x0, gamma_choice, df, x, y, ConstantGamma)
    
    %Calculate the hessian matrix of the objective function
    hessian_of_f = hessian(f,[x,y]);

    %Initialize step k
    k = 1;

    %Initialize an array to store the x, y and f(x,y) for every step k
    x_values = zeros(1500, 2);
    f_values = [];
    
    %set x_values(1,1) and x_values(1,2)
    x_values(1, :) = x0;

    %Initialize and array to store the search of minimum direction values
    d = zeros(1500, 2);

    d_commulative = zeros(2,1);

    %Initialize an array to store the gamma values
    gamma = [];
    
    %Initialize an array to store the m values 
    m_selected = [];

    while 1

        if norm(subs(df, [x, y], x_values(k,:))) < epsilon
            break;
      
        else
            
            hessian_k = double(subs(hessian_of_f,[x,y], x_values(k,:)));
            
            %Calculate the eigenvalues of the hessian matrix for the xk
            %point
            eigenvalues = eig(hessian_k);
       
            % Check if all eigenvalues are positive
            if ~all(eigenvalues > 0)
                disp("The Hessian matrix is not positive-definite matrix.")
            end

            % Find m(k) to make the Hessian matrix positive definite
            m_values = linspace(1, 1, 1000);  
            found_positive_definite = false;
        
            for m = m_values
                New_hessian = subs(hessian_of_f, [x, y], x_values(k,:)) + m * eye(2);
        
                % Check if all eigenvalues are positive
                if all(eig(New_hessian) > 0)
                    found_positive_definite = true;
                    m_selected(k) = m;
                    break;
                end
            end
        
            if ~found_positive_definite
                disp('Could not find m(k) to make the Hessian matrix positive definite.');
            end

            %Step 3 of the Algorithm
            %System of equations in the 'linsolve' function format
            A = subs(hessian_of_f, [x, y], x_values(k,:)) + m_selected(k) * eye(2);  
            b = -subs(df, [x, y], x_values(k,:))';  %Right-hand side of the equation
            
            % Solve the system using linsolve function
            d(k,:) = linsolve(A, b);
              
            f_values(k) = f(x_values(k,1), x_values(k,2));

            
            %Set the gamma value
            if strcmp(gamma_choice, 'Constant')
                % Code for 'Constant' case
                gamma(k) = ConstantGamma;
                
            elseif strcmp(gamma_choice, 'Variable')
                % Code for 'Variable' case
                syms gamma_value
                g_function(gamma_value) = f(x_values(k,1) + gamma_value * d(k,1), x_values(k,2) + gamma_value * d(k,2));
                dg = diff(g_function,'gamma_value');
                gamma(k) = Minimizef(dg);
                
            elseif strcmp(gamma_choice, 'Armijo')
                % Code for 'Armijo' case
                gamma(k) = Armijo(x_values(k,1), x_values(k,2), d(k,1), d(k,2));
                
            else
                error('Invalid argument in "gamma_choice". Please use ''Constant'' or ''Variable'' or ''Armijo''.');
            end
    
            x_values(k+1,:) = x_values(k,:) + gamma(k) * d(k,:);
            
            k = k + 1; 
        end
    end

    f_values(k) = f(x_values(k,1), x_values(k,2));

end