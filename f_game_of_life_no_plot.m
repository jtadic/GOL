function [resulting_pattern]=f_game_of_life_no_plot(init_pattern, rules, no_iterations)

% Inputs:
% init_pattern - nxn matrix having zeros and ones. The dimensions are
% arbitrary
% rules - integer from 1..n representing set of rules we would like to use
% in the simulation
% 1 - original rules refecting under and overpopulations rules
% 2 - the lattices are updated one-by-one, not all-at-once
% 3 - the lattices are updated with certain probability, by default 0.5
% no_iterations - integer showing number of simulation iterations
%
% Outputs:
% resulting_pattern - the pattern obtained from initial pattern after rules
% were applied no_iterations times

world_size = size(init_pattern, 1);
%updated_pattern = zeros(size(init_pattern));
updated_pattern = init_pattern;


if rules == 1 
    for iter = 1:no_iterations
        for i=2:world_size-1 %we will not upate boundary cells
            for j=2:world_size-1 %we will not upate boundary cells
                current_neighborhood = sum(init_pattern(i-1:i+1,j-1))+init_pattern(i-1,j)+init_pattern(i+1,j)+sum(init_pattern(i-1:i+1,j+1)); %calculate current number of living cells around
                      
                    if (current_neighborhood<2 || current_neighborhood>3) && init_pattern(i,j) == 1
                        updated_pattern(i,j) = 0;
                    end
                    if (current_neighborhood == 3 && init_pattern(i,j) == 0)
                            updated_pattern(i,j) = 1;
                    end
            
            end
        end
        init_pattern = updated_pattern; % reset init_pattern to updated_pattern
        
    end
end                 


if rules == 2 
    for iter = 1:no_iterations
        for i=2:world_size-1 %we will not upate boundary cells
            for j=2:world_size-1 %we will not upate boundary cells
                current_neighborhood = sum(init_pattern(i-1:i+1,j-1))+init_pattern(i-1,j)+init_pattern(i+1,j)+sum(init_pattern(i-1:i+1,j+1)); %calculate current number of living cells around
                      
                    if (current_neighborhood<2 || current_neighborhood>3) && init_pattern(i,j) == 1
                        updated_pattern(i,j) = 0;
                    end
                    if (current_neighborhood == 3 && init_pattern(i,j) == 0)
                            updated_pattern(i,j) = 1;
                    end
                    
                    init_pattern = updated_pattern; % reset init_pattern to updated_pattern
            end 
        end
       
    end
end                 

if rules == 3 
    for iter = 1:no_iterations
        for i=2:world_size-1 %we will not upate boundary cells
            for j=2:world_size-1 %we will not upate boundary cells
                current_neighborhood = sum(init_pattern(i-1:i+1,j-1))+init_pattern(i-1,j)+init_pattern(i+1,j)+sum(init_pattern(i-1:i+1,j+1)); %calculate current number of living cells around
                      
                    if (current_neighborhood<2 || current_neighborhood>3) && init_pattern(i,j) == 1 && rand(1)>0.5
                        updated_pattern(i,j) = 0;
                    end
                    if (current_neighborhood == 3 && init_pattern(i,j) == 0) && rand(1)>0.5
                            updated_pattern(i,j) = 1;
                    end
            
            end
        end
        init_pattern = updated_pattern; % reset init_pattern to updated_pattern
        
    end
end                 




resulting_pattern = updated_pattern;