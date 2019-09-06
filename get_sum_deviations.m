% get the sum of deviations from the mean  
function [sum_deviations] = get_sum_deviations(Array)
mean_array = mean (Array);
sum_deviations = 0;
for i=1:length(Array)
    %sum all the deviations from the mean of the array
    sum_deviations = sum_deviations + ((Array(i) - mean_array)^2); 
end % end for  
end % end function