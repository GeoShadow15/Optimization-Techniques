%Georgios Nomikos
%Optimization Techniques | ECE Auth | 2023-24
%Work 1
%Fibonacci Method (thema 3)

function [a, b, k] = Fibonacci_method(f, l, epsilon, a1, b1)
    % We should find the appropriate n value, considering that Fn > (b1-a1)/l
    n = 1;
    while fibonacci(n) <= (b1 - a1) / l
        n = n + 1;
    end
    
    % Create a, b, x1, x2, fx1, fx2 arrays based on the value of n
    a = zeros(1, n);
    b = zeros(1, n);
    x1 = zeros(1, n);
    x2 = zeros(1, n);
    fx1 = zeros(1, n);
    fx2 = zeros(1, n);
    
    % Set a(1) and b(1)
    a(1) = a1;
    b(1) = b1;
    
    % Set the x1(1) and x2(1) values
    x1(1) = a(1) + (fibonacci(n-2) / fibonacci(n)) * (b(1) - a(1));
    x2(1) = a(1) + (fibonacci(n-1) / fibonacci(n)) * (b(1) - a(1));
    
    % Set fx1(1) and fx2(1)
    fx1(1) = f(x1(1));
    fx2(1) = f(x2(1));
    
    % Initialize k
    k = 1;
    
    while 1
        if b(k) - a(k) <= l
            break;
        end
        
        if fx1(k) > fx2(k)
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + (fibonacci(n-k) / fibonacci(n-k+1)) * (b(k+1) - a(k+1));
            
            if k == n - 2
                x1(n) = x1(n-1);
                x2(n) = x1(n-1) + epsilon;
                fx1(n) = f(x1(n));
                fx2(n) = f(x2(n));

                if fx1(n) > fx2(n)
                    a(n) = x1(n);
                    b(n) = b(n-1);
                else
                    a(n) = a(n-1);
                    b(n) = x2(n);
                end
                break;
            else
                fx1(k+1) = f(x1(k+1));
                fx2(k+1) = f(x2(k+1));
                k = k + 1;
            end
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (fibonacci(n-k-1) / fibonacci(n-k+1)) * (b(k+1) - a(k+1));
            
            if k == n - 2
                x1(n) = x1(n-1);
                x2(n) = x1(n-1) + epsilon;
                fx1(n) = f(x1(n));
                fx2(n) = f(x2(n));

                if fx1(n) > fx2(n)
                    a(n) = x1(n);
                    b(n) = b(n-1);
                else
                    a(n) = a(n-1);
                    b(n) = x2(n);
                end
                break;
            else
                fx1(k+1) = f(x1(k+1));
                fx2(k+1) = f(x2(k+1));
                k = k + 1;
            end
        end
    end

end