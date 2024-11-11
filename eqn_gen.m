function [dert,derxx,xzero,xone,tzero] = eqn_gen(k,lim)
    h = 0.05;
    D = 1.5;
    h2 = 0.2;
    
    m = lim/h;
    m2 = lim/h2;
    m2 = m2 + 1;
    m = m+1;
    
    alpha = sym('alpha',[1 m*m2]);
    x = sym('x',[1 2]);
    combinations = generateCombinations(m,m2,k);
    disp(combinations{1});
    disp(combinations{2});
    evaluatedCurrent = cell(size(combinations));
    atxzero = cell(size(combinations));
    atxone = cell(size(combinations));
    attzero = cell(size(combinations));
    doubxx = cell(size(combinations));
    doubt = cell(size(combinations));
    %%%%%%%%%%%%%%%At time t = 0%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i = 1:length(combinations)
        evaluatedCurrent{i} = subs(combinations{i}, sym('x', 1), 0);
    end
    %%%%%%%%%%%%%At x = 0%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i = 1:length(combinations)
        atxzero{i} = subs(combinations{i}, sym('x2'), 0);
    end
    %%%%%%%%%%%%%At x = 1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i = 1:length(combinations)
        atxone{i} = subs(combinations{i}, sym('x2'), 1);
    end
    for i = 1:length(combinations)
        attzero{i} = subs(combinations{i}, sym('x1'), 0);
    end
    for i = 1:length(combinations)
        doubxx{i} = diff(combinations{i},sym('x2'));
        doubxx{i} = diff(doubxx{i},sym('x2'));
    end
    for i = 1: length(combinations)
        doubt{i} = diff(combinations{i},sym('x1'));
    end
    
    
    
            dert = dot(alpha,doubt);
            derxx = dot(alpha,doubxx);
            xzero = dot(alpha,atxzero);
            xone = dot(alpha,atxone);
            tzero = dot(alpha,attzero);
   
    
end


function combinations = generateCombinations(m,m2,k)
    % Initialize an empty cell array to store the combinations for each degree
    combinations = cell(length(m*m2), 1);
    h = 0.05;
    D = 1.5;
    h2 = 0.2;
    % Create a symbolic vector x of the specified dimensionality
    x = sym('x',[1 k]);
    
    % Loop through each target degree in the degreeArray
    for i = 0:m-1
        for j = 0:m2-1
            combinations{m2*i+j+1} = (exp(-1*((x(1)-h*i)^2/(h*h) + (x(2)-h2*j)^2/(h2*h2))/(D)));
            
        end
    end
    
end