
% function plots the mean values of the specified columns of peaks for four different quadrants of the
% cytoo chip ( or for any four or more given number of matfiles).
% Useful if the data was collected separately/or needs to be ploted
% from separate mat files.
% The input arguments are:
% Nplot = number of matfiles to process/and number of subplots in the figure
% nms =   cell array of strings with the full names of the matlab files containing all the data. Do not specify the 'mat'
%         extension
% nms2 =  cell array of strings with the names of the experimental conditions
% corresponding to each matfile/quadrant of the chip. The same strings
% appear as a legend of the plots
% col = the column of the 'peaks' data to plot from each matfile. if input
% only one number - get the mean of this column = not normalized data
% values; if input two numbers [col(1),col(2)], obtain the mean for
% the ratio of peaks data (col)1)/col(2); usually normalize to DApi, make
% col(2) = 5;need to be within the directory with the matfiles
% [aver, err, alldata]=Bootstrapping(peaks,Niter,nsample,col) Niter and
% nsample may be changed depending on the size of the dataset
% param1 - y label.depends on the meaning of the peaks columns ina a given experiment 
%
% see also: Bootstrapping
function MeanCytooQuadrants(Nplot,nms,nms2,col,param1);

for k=1:Nplot
    
    filename = ['.' filesep nms{k} '.mat'];%
    load(filename,'peaks');
    % disp(['loaded file: ' filename]);
    
    colors = {'r','g','b','k'};
    
    [avgs, errs, ~]=Bootstrapping(peaks,100,1000,col);
    newdata(k,1)=avgs;
    newdata(k,2)=errs;
end
figure,errorbar(newdata(:,1),newdata(:,2),'b*') ;

set(gca,'Xtick',1:4);
set(gca,'Xticklabel',nms2);
ylabel(param1);
title(['Dataset',nms]);

   

