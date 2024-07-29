% ******** pattern search ************

function [patterns] = f_pattern_search(table_size, pattern_size, rules)

if pattern_size>table_size
    print("Pattern larger than field!")
    stop
end

iterations = [1,20,100]; %checkpoints
no_cells_pattern = pattern_size^2;
accu={};

for i = 3:no_cells_pattern
    no_combinations = factorial(no_cells_pattern)/(factorial(i)*factorial(no_cells_pattern-i)); %izracunaj broj mogucih kombinacija i elemenata no_cells_pattern klase
    generator = nextchoose(no_cells_pattern,i);
    for j=1:no_combinations
            current_pattern = generator();
            pattern = zeros(no_cells_pattern,1);
            pattern(current_pattern,1) = 1;
            pattern = reshape(pattern,[pattern_size,pattern_size]);
            
            %insert pattern into the field
            init_pattern = zeros(table_size,table_size);
            starting_point = round((table_size-pattern_size)/2)+1;
            init_pattern(starting_point:starting_point+pattern_size-1,starting_point:starting_point+pattern_size-1) = pattern;
            for k=1:3             
                [resulting_pattern{1,k}]=f_game_of_life_no_plot(init_pattern, rules, iterations(1,k));
            end
            
            if isequal(resulting_pattern{1,1},resulting_pattern{1,2}) && isequal(resulting_pattern{1,2},resulting_pattern{1,3}) && isequal(init_pattern,resulting_pattern{1,1})
                accu{1, size(accu,2)+1} = pattern;
            end
            
    end
end

patterns = accu;


            
            
            
    