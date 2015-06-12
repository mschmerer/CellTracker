%%
 %  [n,totalcells] = RunAnalysisFullChipAN(thresh,Nplot,nms,nms2,midcoord,fincoord,index1,index2,param1,param2)
 % function RunAnalysisFullChipAN produces 5 figures ( meav values, scatter
 % plot and three colony-analysis related plots)
 % see descriptions below and within each function
 
 % Nplot - number of parts of the chip to plot (usually 4)
 % midcoord - defines the imagenumbers which separate the two quadrants (1,1) and (1,2) in
 % x direction (1,1) and (2,1) in y direction. Need to check these image numbers while setting up the grid
 % before aquisition
 % fincoord - define the imagenumbers of the last images taken in x and y
 % directions. Also need to check these and record while setting up the grid
 % on the microscope.( also they are obvious if use mkCytooPLotPeaks)
 % index1 - specifies which peaks' column to use. If index has two components
 % [ index1(1) index1(2)] - the ratio of the columns is plotted.
 % index2 = the column of the 'peaks' data to plot from the matfile. if input
 % only one number - get the plot of this column = not normalized data
 % values; if input two numbers [index2(1),index2(2)], obtain scatter plot of
 % normalized index2(1)(x-axis) versus normalized index2(2)(y-axis);Normalization
 % to DAPI ( DAPI is assumed to be column 5 of peaks);
 % need to be within the directory with the matfiles
 % nms2 - cell array of strings that specifies the conditions in each
 % quadrant/ used as a label for the x axis
 % param1 - label of the y-axis, input as a string, specifies which peaks' column you
 % are plotting and what it represents ( e.g. 'Sox2 expression');
 % thresh parameter can be first input randomly small (e.g. 0.2) and then
 % adjusted based on the scatter plots for the specific gene of interest
 
 %Note: need to input manually only the midcoord, fincoord, and the peaks'
 %column number which you want to plot ( in MM data peaks{}(:,6) - cdx2) 
 
 %nms = {'ESI049FullCytoo'};                  %midcoord[14 12]  fincoord[26 17]     need to rerun the colony; mafullcytooplot looks horrible here
 %nms = {'esi017FullCytoo42hr'};              %midcoord[11 18]  fincoord[19 18]      for this only two condition at one time point were probed: Nplot = 2
 %nms = {'esi017FullCytoo51and61hr'};         %midcoord[12 12]  fincoord[21 20]
 %nms = {'esi017_7260hr_repeat'};             %midcoord[11 9]   fincoord[22 21]
 % nms = {'esi017_42hr53hr_denser'};            %midcoord[11 10]  fincoord[22 22]
% nms = {'esi017_42hr53hr_denser(2)'};          %midcoord[11 10]  fincoord[22 22]
 %nms = {'esi017_42hr53hr_smalldensity'} ;    %midcoord[10 10]  fincoord[22 21]
 %nms = {'esi017withControl42hr'};            %midcoord[10 10] or (midcoord better[12 13]) fincoord[23 21]  % most recent dataset
  %nms = {'esi017_42hrVol_1ngBMP'};     %midcoord[11 11]  fincoord[22 21]  % volume-dependent,1ng/ml label
 % nms = {'esi017_42hrVol_control(1)'};     %midcoord[10 11]  fincoord[20 21]  % volume-dependent,contro(1) label
  nms = {'esi017_42hrVol_control(2)'};       %midcoord[11 10]  fincoord[21 22]  % volume-dependent,contro(2) label
  
  %nms = {'esi017fDish_control'};    
  %nms = {'esi017fDish_1ngml'}; 
  %nms = {'esi017fDish_10ngml'}; 
      
  %nms2 = {'Sox2','pSmad1','Eomes','Gata6'};
  %nms2 = {'Oct4','Smad2','Cdx2','Cdx2'};
  %nms2 = {'Bra','Bra','Sox17','Sox17'};
  
  
  nms2 = {'100ul','150ul','200ul','225ul'};
 %nms2 = {'control ','0.1 ng/ml','1 ng/ml ','10 ng/ml'};                     
  % nms2 = {'1 ng/ml(42hrs)','10 ng/ml (42hrs)' };                             
 % nms2 = {'10 ng/ml (51hr)','10 ng/ml (61hr)','1 ng/ml (51hr)','1 ng/ml(61hr)'};
 % nms2 = {'1 ng/ml (60hr)','1 ng/ml (72hr)','10 ng/ml (60hr)','10 ng/ml (72hr)'}; 
  %nms2 = {'10 ng/ml (53hr)','10 ng/ml (42hr)','1 ng/ml (53hr)','1 ng/ml (42hr)'};  
 

    plotallanalysisAN(0.5,nms,nms2,[],[],[6 5],[6 10],'CY5','RFP',1,flag);
    
 %%
 %scripts for the functions to run Nplot separate matfiles and plot  mean values, scatter plots, colony analysis 
 
 % nms = {'H2BoutallControlMM','H2Boutall01MM','H2Boutall1MM','H2Boutall10MM'}; 
 
% nms = {'esi017fDish_control'};    
  %nms = {'esi017fDish_1ngml'}; 
  %nms = {'esi017fDish_10ngml'}; 
      
  %nms2 = {'Sox2','pSmad1','Eomes','Gata6'};
  %nms2 = {'Oct4','Smad2','Cdx2','Cdx2'};
  %nms2 = {'Bra','Bra','Sox17','Sox17'};
% nms = { 'esi017noqdratall_control(2)','esi017noqdratall_control(cdx2)','esi017noqdratall_1ngmlBMP','esi017noqdratall_10ngmlBMP'};    % from
 nms = { 'esi017noQd_C(2)_Repeat','esi017noQd_C(1)_Repeat','esi017noQd_1ng_Repeat','esi017noQd_10ng_Repeat'};
 
 %nms = {'Q4_1ng42hr','Q2_10ng42hr','Q3gitUpdated','Q1_10ng53hr'}; 
 %nms = {'esi017_30hr_1ng_repeat','esi017_42hr_1ng_repeat','esi017_30hr_10ng_repeat','esi017_42hr_10ng_repeat'};
 %nms = {'Venus_outall_001_NEW','Venus_outall_01_NEW','Venus_outall_1_NEW','Venus_outall_10_NEW'}; 
 %nms = {'ESI049BMP4atControl','ESI049BMP4at01','ESI049BMP4at1','ESI049BMP4at10'};
 %nms = {'outallcontrolH2BSignMM','outall01H2BSignMM','outall1H2BSignMM','outall10H2BSignMM'};
 %nms = {'h2bsignS2_control_MM','h2bsignS2_01_MM','h2bsignS2_1_MM','h2bsignS2_10_MM'};
 
 %nms = {'esi017noqdratall_control(2)'};
 % nms2 = {'control ','10 ng/ml'};  
 %nms2 = {'control ','0.1 ng/ml','1 ng/ml ','10 ng/ml'};  
 %nms2 = {'control'};
 nms2 = {'control(2)','control(1) ','1 ng/ml ','10 ng/ml'};    
 %nms2 = {'1ng/ml(42 hr)','10ng/ml(42 hr)','Q31ng/ml(53 hr)','10ng/ml(53 hr)'};
 %nms2 = {'1ng/ml(42 hr)','10ng/ml(42 hr)','Q3updatedcode1ng/ml(53 hr)','10ng/ml(53 hr)'};
 %nms2 = {'esi017(30 hr 1 ng/ml)','esi017(42 hr 1 ng/ml)','esi017(30 hr 10 ng/ml)','esi017(42 hr 10 ng/ml)'};  
 %nms2 = {'h2bSignControl','h2bSign 0.1 ng/ml','h2bsign 1 ng/ml','h2bsign 10 ng/ml'};
 dir = '2015-08-06-NoQdrAtAll(control1)Cdx2etc_1';
    % plotallanalysisAN(4.5,nms,nms2,[],[],[10 5],[10 6],'RFP','CY5',0,1);
     

  [a, b] =   findcolonyAN(dir,2,[1 3],nms,2,[10 5],3,1,15,0);
%%
% script to optimize the segmentation parameters. Can look at a chse image
% and adjust the parameters. N is a linear index, image number
% need to be one directory up from the actual images folder ( since using
% the readMMdirectory function here)
 N = 20;

 ANrunOneMM('2015-08-06-NoQdrAtAll(control2)EomNanogOct_1',N,bIms,nIms,'setUserParamAN20X','DAPI');
%
%%
%to run the full set of images (obtained from the MM software)
%note: peaks to colonies is now the only function used: the choice between
%single cell and circular large colonies is done within the peakstocolonies
%function

 runFullTileMM('2015-08-06-NoQdrAtAll(control2)EomNanogOct_1','esi017noQd_C(2)_Repeat.mat','setUserParamAN20X');

%function runFullTileMM(direc,outfile,paramfile,step) 
