
[one,two,three,four,five] = eqn_gen(2,1);
one = char(one);
%mod_1 = check6(one);
mod_1 = check4(one);
mod_1 = check3(mod_1);
mod_1 = check2(mod_1);

two = char(two);
%mod_1 = check6(one);
mod_2 = check4(two);
mod_2 = check3(mod_2);
mod_2 = check2(mod_2);

three = char(three);
%mod_1 = check6(one);
mod_3 = check4(three);
mod_3 = check3(mod_3);
mod_3 = check2(mod_3);

four = char(four);
%mod_1 = check6(one);
mod_4 = check4(four);
mod_4 = check3(mod_4);
mod_4 = check2(mod_4);

five = char(five);
%mod_1 = check6(one);
mod_5 = check4(five);
mod_5 = check3(mod_5);
mod_5 = check2(mod_5);


timestamp = datestr(now, 'yyyymmdd_HHMMSS'); % Format: YYYYMMDD_HHMMSS
filename = ['output_' timestamp '.txt']; % Create the filename with timestamp

% Save mod_1, mod_2, and mod_3 into the timestamped text file
fileID = fopen(filename, 'w'); % Open the file for writing

fprintf(fileID, 'mod_1:\n%s\n\n', mod_1, 'mod_2:\n%s\n\n', mod_2, 'mod_3:\n%s\n\n', mod_3, 'mod_4:\n%s\n\n', mod_4, 'mod_5:\n%s\n\n', mod_5); % Write mod_1 to the file

fclose(fileID); % Close the file

disp('The details been saved to output.txt.');