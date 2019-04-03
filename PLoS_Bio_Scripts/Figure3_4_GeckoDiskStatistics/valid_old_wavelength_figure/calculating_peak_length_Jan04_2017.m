%uppdated Dec 21 to imprive the skeletonization
geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
peak_length=[];
for i=1:8
    i=i
    q=3;
    gecko=geckoID(i)
    [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko);
    threshold=0;
    [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
    %threshold=adjusted_mean-adjusted_sigma;
    PL=[];
    bigROI=increase_res(ROI,q);
    low=round((adjusted_mean-1.25*adjusted_sigma));
    high=round((adjusted_mean-.75*adjusted_sigma));
    for threshold=low:high
        threshold
        [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
        binary_gecko_disk=increase_res(binary_gecko_disk,q);
        b=bwconvhull(binary_gecko_disk,'objects');
        PL=[PL,find_peak_lengths_binary_diskDec20(b,bigROI,f_resize*q)];
    end
    peak_length(i,1)=mean(PL)
    peak_length(i,2)=std(PL)
    peak_length(i,3)=min(PL)
    peak_length(i,4)=max(PL)
end

% % % %after modifying the skeleton on Dec 20th
% % % peak_length=[0.1428    0.0032    0.1373    0.1514
% % %     0.1588    0.0060    0.1511    0.1705
% % %     0.1800    0.0025    0.1748    0.1843
% % %     0.2020    0.0080    0.1908    0.2128
% % %     0.2403    0.0082    0.2222    0.2642
% % %     0.1535    0.0028    0.1489    0.1591
% % %     0.1468    0.0019    0.1439    0.1514
% % %     0.2627    0.0147    0.2384    0.3004];

