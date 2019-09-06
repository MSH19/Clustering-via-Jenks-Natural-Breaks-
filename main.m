
% Jenks Natural Breaks is a data clustering method. It is an optimization
% process that finds the best arrangement of values into different classes.
% It can be used for step-change detection in noisy data. 
% In this example, a one-dimensional array of noisy values is used. 
% The method is applied to the array to find the index of the
% interface separating the high and low values. 

clc;
close all;
clear all;

% one-dimension data sample 
data_sample = [900 750 702 744 710 676 721 674 632 640 603 607 855 768 728 787 723 671 757 706 637 665 632 637 615 609 639 600 596 611 542 554 565 506 489 73 17 14 14 20 18 24 11 10 16 14 16 18];

% get number of elements in the array
total = length (data_sample);

% create empty array to display the interface 
interfaces = zeros (1,total);

% apply Jenks Natural Breaks method to get the interface between the two classes 
[SDCM_All, GF] = get_jenks_interface(data_sample);

% get the index that has the maximum Goodness of Variance Fit 
[M, I] = max(GF);

% set the index of the selected interface to one
interfaces(I) = 1;

% set figure to full screen 
figure('units','normalized','outerposition',[0 0 1 1])

% plot original data sample 
subplot(2,2,1);
plot(data_sample);
title('Data sample');

% plot the sum of deviations for each possible split
subplot(2,2,2);
plot(SDCM_All);
title('SDCM ALL');

% plot the goodness of variance fit 
subplot(2,2,3);
plot(GF);
title('GFs');

% plot the selected interface separating the two classes
subplot(2,2,4);
plot(interfaces);
title(strcat('Boundary between two classes:',int2str(I)));