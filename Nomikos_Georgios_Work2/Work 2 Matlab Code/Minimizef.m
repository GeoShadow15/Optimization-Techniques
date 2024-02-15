%Georgios Nomikos

%Optimization Techniques | ECE Auth | 2023-24
%Work 2
%Minimize a function (using bisection with derivatives method)

function gamma = Minimizef(f)

    %In order to minimize f and find the gamma value, we will use the bisection with
    %derivatives method

    %set the l parameter for the minimization method
    l = 0.001;
    
    %initialize k
    k = 1;

    a = [];
    b = [];
    
    a(1) = 0;
    b(1) = 10;

    x = [];
    
    %find the n value. Follow the rule: (1/2) ^ n <= l/(b1-a1)
    n = 1;
    while ((1/2) ^ n) > (l/(b(1)-a(1)))
        n = n + 1;
    end

    while 1

        x(k) = (a(k) + b(k)) / 2;

        if b(k) - a(k) <= l
            
            break;
        end

        if subs(f,x(k)) == 0
            break;
        
        elseif subs(f,x(k)) > 0
            a(k+1) = a(k);
            b(k+1) = x(k);


        elseif subs(f,x(k)) < 0
            a(k+1) = x(k);
            b(k+1) = b(k);
                   
        end
        
        if k == n 
            break;
        
        else
        
            k = k + 1;
        end
    end

    gamma = (a(k) + b(k)) / 2;
    disp(gamma);


end
