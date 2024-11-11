function modified_expr = check3(input_expr)% Create a map for replacements
    %input_expr = 'alpha2*(conj(x1)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2) - conj(x2)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) + alpha3*(conj(x1)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2) - conj(x3)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) + alpha4*(conj(x1)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2) - conj(x4)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) + alpha9*(conj(x2)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2) + conj(x3)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2)) + alpha10*(conj(x2)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2) + conj(x4)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2)) + alpha15*(conj(x3)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2) + conj(x4)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2)) - alpha24*(conj(x5)/70 + conj(x6)/100) - alpha27*(conj(x6)/150 + conj(x7)/70) - alpha25*(conj(x5)/150 + conj(x7)/100) - (alpha23*conj(x5))/50 - (alpha26*conj(x6))/35 - (alpha28*conj(x7))/75 - alpha6*(conj(x1)/70 + conj(x6)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) - alpha12*(conj(x2)/70 - conj(x6)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2)) - alpha17*(conj(x3)/70 - conj(x6)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2)) - alpha21*(conj(x4)/70 - conj(x6)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2)) - alpha5*(conj(x1)/100 + conj(x5)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) - alpha11*(conj(x2)/100 - conj(x5)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2)) - alpha16*(conj(x3)/100 - conj(x5)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2)) - alpha20*(conj(x4)/100 - conj(x5)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2)) - alpha7*(conj(x1)/150 + conj(x7)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2)) - alpha13*(conj(x2)/150 - conj(x7)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2)) - alpha18*(conj(x3)/150 - conj(x7)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2)) - alpha22*(conj(x4)/150 - conj(x7)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2)) - 2*alpha1*conj(x1)*((x2*x5)/2 + (x3*x6)/2 + (x4*x7)/2) + 2*alpha8*conj(x2)*((x1*x5)/2 + (x3*x6)/2 - (x4*x7)/2) + 2*alpha14*conj(x3)*((x1*x6)/2 - (x2*x7)/2 + (x4*x5)/2) + 2*alpha19*conj(x4)*((x1*x7)/2 + (x2*x6)/2 - (x3*x5)/2)';
    %alpha_replacements = containers.Map({'alpha1', 'alpha2', 'alpha3', 'alpha4', 'alpha5', 'alpha6', 'alpha7', 'alpha8', 'alpha9', 'alpha10', 'alpha11', 'alpha12', 'alpha13', 'alpha14', 'alpha15', 'alpha16', 'alpha17', 'alpha18', 'alpha19', 'alpha20', 'alpha21', 'alpha22', 'alpha23', 'alpha24', 'alpha25', 'alpha26', 'alpha27', 'alpha28'}, ...
    %                                     {'alpha(1)', 'alpha(2)', 'alpha(3)', 'alpha(4)', 'alpha(5)', 'alpha(6)', 'alpha(7)', 'alpha(8)', 'alpha(9)', 'alpha(10)', 'alpha(11)', 'alpha(12)', 'alpha(13)', 'alpha(14)', 'alpha(15)', 'alpha(16)', 'alpha(17)', 'alpha(18)', 'alpha(19)', 'alpha(20)', 'alpha(21)', 'alpha(22)', 'alpha(23)', 'alpha(24)', 'alpha(25)', 'alpha(26)', 'alpha(27)', 'alpha(28)'});
    
    %x_replacements = containers.Map({'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}, ...
       %                               {'x(1)', 'x(2)', 'x(3)', 'x(4)', 'x(5)', 'x(6)', 'x(7)'});
    
    % alpha_replacements = containers.Map({'alpha10', 'alpha11', 'alpha12', 'alpha13', 'alpha14', 'alpha15', 'alpha16', 'alpha17', 'alpha18', 'alpha19', 'alpha20', 'alpha21', 'alpha22', 'alpha23', 'alpha24', 'alpha25', 'alpha26', 'alpha27', 'alpha28','alpha29'}, ...
    %                                  {'alpha(10)', 'alpha(11)', 'alpha(12)', 'alpha(13)', 'alpha(14)', 'alpha(15)', 'alpha(16)', 'alpha(17)', 'alpha(18)', 'alpha(19)', 'alpha(20)', 'alpha(21)', 'alpha(22)', 'alpha(23)', 'alpha(24)', 'alpha(25)', 'alpha(26)', 'alpha(27)', 'alpha(28)','alpha(29)'});

    keys = {};
    values = {};

    for i = 10:99
        keys{end+1} = ['alpha', num2str(i)];
        values{end+1} = ['alpha(', num2str(i), ')'];
    end
    
    keys2 = {};
    values2 = {};

    for i = 1:9
        keys2{end+1} = ['x', num2str(i)];
        values2{end+1} = ['x(', num2str(i), ')'];
    end

    alpha_replacements = containers.Map(keys, values);

    x_replacements = containers.Map({'x1', 'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}, ...
                                      {'x(1)', 'x(2)', 'x(3)', 'x(4)', 'x(5)', 'x(6)', 'x(7)'});
    
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
    
    % Replace xs
    % x_keys = keys(x_replacements);   % Get the keys of the x map
    % x_values = values(x_replacements); % Get the values of the x map
    % for i = 1:length(x_keys)
    %     modified_expr = strrep(modified_expr, x_keys{i}, x_values{i});
    % end
    % % Replace alphas
    % for i = 1:length(alpha_replacements)
    %     old = keys(alpha_replacements);
    %     new = values(alpha_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end
    % 
    % Replace xs
    % for i = 1:length(x_replacements)
    %     old = keys(x_replacements);
    %     new = values(x_replacements);
    %     modified_expr = strrep(modified_expr, old{i}, new{i});
    % end
    
    % Display the modified expression
    % disp('Modified Expression:');
    % disp(modified_expr);
end