
geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
f_resize=[213 204  200 200 207 211 209 210];
BINARYnames=['gecko681_4stats_213x3PPI.mat',  
'gecko682_4stats_204x3PPI.mat',  
'gecko731_4stats_200x3PPI.mat',  
'gecko732_4stats_200x3PPI.mat',  
'gecko735_4stats_207x3PPI.mat',  
'gecko763_4stats_211x3PPI.mat',  
'gecko772_4stats_209x3PPI.mat',  
'gecko773_4stats_210x3PPI.mat']

ROInames=['gecko681_4stats_213x3PPI_ROI.mat',  
'gecko682_4stats_204x3PPI_ROI.mat',  
'gecko731_4stats_200x3PPI_ROI.mat',  
'gecko732_4stats_200x3PPI_ROI.mat',  
'gecko735_4stats_207x3PPI_ROI.mat',  
'gecko763_4stats_211x3PPI_ROI.mat',  
'gecko772_4stats_209x3PPI_ROI.mat',  
'gecko773_4stats_210x3PPI_ROI.mat'];


peak_length=[];
for i=1:8
    i=i
    gecko=geckoID(i)
    load(BINARYnames(i,:)); %binary_image
    load(ROInames(i,:)) %binary_imageROI
    b=bwconvhull(binary_image,'objects');
    PL=find_peak_lengths_binary_disk(b,binary_imageROI,f_resize(i)*3)
    peak_length(i)=PL;
end

% % % peak_length=[0.0556
% % %     0.0603
% % %     0.0688
% % %     0.0800
% % %     0.0953
% % %     0.0596
% % %     0.0568
% % %     0.1049]';



