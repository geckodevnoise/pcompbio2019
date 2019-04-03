
function [spot_average,e_average,f_average,pl_average]=pattern_stats_GeckoGrayscale_May11_2017;

geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
f_resize=[213,204,200,200,207,211,209,210];%number of pixels per inch



variation=0.25;
variation=0.05;
variation=0.10;
for i=1:8
    cd ..
    cd('CropGeckoPictures')
    i=i
    q=3;
    gecko=geckoID(i);
    [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko);
    threshold=0;
    [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
    %threshold=adjusted_mean-adjusted_sigma;
    SS=[];
    EE=[];
    FA=[];
    PL=[];
    bigROI=increase_res(ROI,q);
    %binarization adjusted by 10%xsigma from (mu-sigma)
    low=round((adjusted_mean-(1+variation)*adjusted_sigma))
    high=round((adjusted_mean-(1-variation)*adjusted_sigma))
    %binarization adjusted by 10% of sigma from (mu-sigma)
    for threshold=low:high
        threshold
        [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
        binary_gecko_disk=increase_res(binary_gecko_disk,q);
        b=bwlabel(binary_gecko_disk);
        s=regionprops(b,'EquivDiameter','Eccentricity');%b is three times larger
        spot_sizes=[s.EquivDiameter];
        SS=[SS,mean([s.EquivDiameter])];
        EE=[EE,mean([s.Eccentricity])];
        FA=[FA,sum(sum(binary_gecko_disk==1))/sum(sum(bigROI==1))];
        %%% Calculating Peak Length
        b=bwconvhull(binary_gecko_disk,'objects');
        positive_pattern=b;
        total_area=sum(sum(bigROI));
        negative_pattern=(b==0);
        peak_area=sum(sum(bwmorph(positive_pattern,'skel',inf).*bigROI));
        valley_area=sum(sum(bwmorph(negative_pattern,'skel',inf).*bigROI));
        cm=f_resize*q/2.54;
        peak_length=2*total_area/(peak_area+valley_area)/cm;
        %%%%%%%%%%%%%
        PL=[PL,peak_length];
    end
    spot_average(i,1)=min(SS);
    spot_average(i,2)=max(SS);
    spot_average(i,3)=mean(SS);
    spot_average(i,4)=std(SS);
    e_average(i,1)=min(EE);
    e_average(i,2)=max(EE);
    e_average(i,3)=mean(EE);
    e_average(i,4)=std(EE);
    f_average(i,1)=min(FA);
    f_average(i,2)=max(FA);
    f_average(i,3)=mean(FA);
    f_average(i,4)=std(FA);
    pl_average(i,1)=min(PL);
    pl_average(i,2)=max(PL);
    pl_average(i,3)=mean(PL);
    pl_average(i,4)=std(PL)
end
cd ..
cd Figure3_4_GeckoDiskStatistics
f_resize=[213,204,200,200,207,211,209,210];%number of pixels per inch
spot_average=spot_average ./ [f_resize;f_resize;f_resize;f_resize]';




%%this is what the data looks like if you want to check
%%for variation 0.25
% spot_average =[23.0075   31.7170   26.6076    2.4314
%    24.3641   34.8076   29.3459    3.5273
%    25.0530   35.4955   30.3156    3.2674
%    27.6397   33.7140   30.7345    1.6667
%    25.6053   41.2953   34.3734    4.7389
%    24.5413   33.8877   29.1299    2.6470
%    22.6443   34.3300   29.5773    3.6221
%    31.5870   45.5425   37.6471    3.3506];
% spot_average =spot_average ./ [f_resize;f_resize;f_resize;f_resize]';
% %this converts from pixels to inches
% %so these numbers are in inches
% spot_average =[0.1080    0.1489    0.1249    0.0114
%     0.1194    0.1706    0.1439    0.0173
%     0.1253    0.1775    0.1516    0.0163
%     0.1382    0.1686    0.1537    0.0083
%     0.1237    0.1995    0.1661    0.0229
%     0.1163    0.1606    0.1381    0.0125
%     0.1083    0.1643    0.1415    0.0173
%     0.1504    0.2169    0.1793    0.0160];
% e_average =[0.6256    0.6779    0.6549    0.0113
%     0.7342    0.8050    0.7759    0.0204
%     0.6913    0.7500    0.7224    0.0164
%     0.6387    0.7463    0.7020    0.0320
%     0.7189    0.8217    0.7808    0.0246
%     0.6848    0.7172    0.7010    0.0074
%     0.7188    0.7635    0.7386    0.0120
%     0.6595    0.7418    0.6904    0.0219];
% f_average =[0.2314    0.3966    0.3185    0.0491
%     0.2367    0.3933    0.3152    0.0463
%     0.2268    0.4051    0.3191    0.0540
%     0.2012    0.3999    0.2939    0.0606
%     0.1997    0.3521    0.2681    0.0469
%     0.2370    0.3886    0.3146    0.0452
%     0.2198    0.4384    0.3383    0.0628
%     0.1847    0.3480    0.2681    0.0482];


