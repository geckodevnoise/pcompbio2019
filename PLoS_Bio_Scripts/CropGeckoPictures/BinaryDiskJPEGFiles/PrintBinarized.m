

gecko_labels=[681   682   731   732   735   763   772   773];

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

figure(10)
for i=1:8
    load(BINARYnames(i,:))
    load(ROInames(i,:))
    imagesc(binary_image.*binary_imageROI)
    colormap(flipud(gray))
    gecko=gecko_labels(i);
    set(gca,'XTick',[])
    set(gca,'YTick',[])
    print('-djpeg',['GeckoBinarized',num2str(gecko),'.jpg'])
end

figure(10)
for i=1:8
    gecko=gecko_labels(i);
    cut_gecko_image=FirstFigure_HeadCutToDisk_Jan28_2016(gecko,f);
    set(gca, 'LooseInset', [0,0,0,0]);
    print('-djpeg',['GeckoGrayscaleSpot',num2str(gecko),'.jpg'])
end
    