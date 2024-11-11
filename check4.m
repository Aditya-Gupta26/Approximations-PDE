function modified_expr = check4(input_expr)
    % Create a map for replacements from alpha30 to alpha39
    % alpha_replacements = containers.Map({'alpha30', 'alpha31', 'alpha32', 'alpha33', 'alpha34', 'alpha35', 'alpha36', 'alpha37', 'alpha38', 'alpha39'}, ...
    %                                     {'alpha(30)', 'alpha(31)', 'alpha(32)', 'alpha(33)', 'alpha(34)', 'alpha(35)', 'alpha(36)', 'alpha(37)', 'alpha(38)', 'alpha(39)'});
    % 
    % x_replacements = containers.Map({'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}, ...
    %                                 {'x(1)', 'x(2)', 'x(3)', 'x(4)', 'x(5)', 'x(6)', 'x(7)'});
    % 
    % % Replace alpha and x variables
    % modified_expr = input_expr;
    % 
    % % Replace alphas
    % for i = 1:length(alpha_replacements)
    %     old = keys(alpha_replacements);
    %     new = values(alpha_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end
    % 
    % % Replace xs
    % for i = 1:length(x_replacements)
    %     old = keys(x_replacements);
    %     new = values(x_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end

    % keys = {};
    % values = {};
    % 
    % for i = 100:999
    %     keys{end+1} = ['alpha', num2str(i)];
    %     values{end+1} = ['alpha(', num2str(i), ')'];
    % end
    % 
    % alpha_replacements = containers.Map(keys, values);
    % 
    % x_replacements = containers.Map({'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}, ...
    %                                   {'x(1)', 'x(2)', 'x(3)', 'x(4)', 'x(5)', 'x(6)', 'x(7)'});
    % 
    % % Replace alpha and x variables
    % modified_expr = input_expr;
    % 
    % % Replace alphas
    % for i = 1:length(alpha_replacements)
    %     old = keys(alpha_replacements);
    %     new = values(alpha_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end
    % 
    % % Replace xs
    % for i = 1:length(x_replacements)
    %     old = keys(x_replacements);
    %     new = values(x_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end
    
    % Display the modified expression
    % disp('Modified Expression:');
    % disp(modified_expr);



    keys = {};
    values = {};

    for i = 100:999
        keys{end+1} = ['alpha', num2str(i)];
        values{end+1} = ['alpha(', num2str(i), ')'];
    end
    
    keys2 = {};
    values2 = {};

    for i = 1:9
        keys2{end+1} = ['x', num2str(i)];
        values2{end+1} = ['x(', num2str(i), ')'];
    end

    %alpha_replacements = containers.Map(keys, values);

    %x_replacements = containers.Map({'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}, ...
    %                                  {'x(1)', 'x(2)', 'x(3)', 'x(4)', 'x(5)', 'x(6)', 'x(7)'});
    
    % Replace alpha and x variables
    modified_expr = input_expr;
    

    % Replace alphas
    % alpha_keys = keys(alpha_replacements);   % Get the keys of the alpha map
    % alpha_values = values(alpha_replacements); % Get the values of the alpha map
    for i = 1:length(keys)
        modified_expr = strrep(modified_expr, keys{i}, values{i});
    end

    for i = 1:length(keys2)
        modified_expr = strrep(modified_expr, keys2{i}, values2{i});
    end
    
end



