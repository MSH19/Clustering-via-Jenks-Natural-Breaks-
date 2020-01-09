% Jenks Natural Breaks - Get the interface that best separates the two classes 
function [SDCM_All, GF] = get_jenks_interface(Array)
total = length (Array);
SDCM_All = zeros(1,total);
GF = zeros(1,total);

% step 1: Calculate the sum of the squared deviations from the mean (SDAM)
SDAM = get_sum_deviations(Array);

% step 2: Calculate the sum of the squared deviations for every possible
% combination of classes
for i=1:total    
    class_1 = Array(1:i);
    class_2 = Array(i+1:total);
    
    s1 = get_sum_deviations(class_1);
    s2 = get_sum_deviations(class_2);
    
    SDCM_All(i) = s1 + s2;
    % Calculate the goodness of variance fit 
    GF(i) = ((SDAM - SDCM_All(i)) / SDAM) ;
end % end for 
end % end function
