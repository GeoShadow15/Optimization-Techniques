%Georgios Nomikos

%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Armijo rule

function gamma = Armijo(xk, yk, dkx, dky)
    
    %Objective Function
    syms x y 
    f(x,y) = x^(3) * exp(-x^(2)-y^(4));
    
    df_dx = diff(f, x); % Partial derivative with respect to x
    df_dy = diff(f, y); % Partial derivative with respect to y

    %Set the parameters used in the Armijo rule
    a=0.001; 
    b=0.2;
    s=1; 
    m=0;

    %Using the above parameters, we calculate an initial gamma value
    gamma = s * b ^ m;
    
    df_dx_k = double(subs(df_dx, [x, y], [xk, yk]));
    df_dy_k = double(subs(df_dy, [x, y], [xk, yk]));

    while f(xk, yk) - f(xk + gamma *  dkx, yk + gamma *  dky) < (-a * (b^m) * s * [dkx, dky] * [df_dx_k; df_dy_k])
        
        m = m + 1; %add 1 to the m parameter, so that we can achieve the smallest 
                   %non negative integer that satisfies the condition of
                   %the while loop

        gamma = s * b ^ m; %Update the gamma value
    end
    
end
