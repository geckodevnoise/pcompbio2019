% 
% geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
% peak_length=[];
% for i=1:8
%     i=i
%     q=3;
%     gecko=geckoID(i);
%     [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko);
%     threshold=0;
%     [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
%     threshold=adjusted_mean-adjusted_sigma;
%     [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
%     binary_gecko_disk=increase_res(binary_gecko_disk,q);
%     ROI=increase_res(ROI,q);
%     b=bwconvhull(binary_gecko_disk,'objects');
%     %imagesc(b), axis square
%     peak_length(i)=find_peak_lengths_binary_disk(b,ROI,f_resize*q);
% end
% peak_length=[0.1368    0.1417    0.1535    0.1481    0.1908    0.1379    0.1213    0.2313];
% %q=10, i=7: total_area=916900, peak_area=16930, valley_area=20679
% %q=10, i=7: total_area=82521, peak_area=4865, valley_area=6126;
% %peak_length=.0593 / .0608
% peak_length=[0.1372    0.1488    0.1660    0.1946    0.1988    0.1449    0.1383    0.2182];
% peak_length=[0.1367    0.1469    0.1648    0.1935    0.2040    0.1439    0.1403    0.2214];
% 


geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
% peak_length=[];
% for i=1:8
%     i=i
    q=3;
    gecko=geckoID(i);
    [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko);
    threshold=0;
    [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
    %threshold=adjusted_mean-adjusted_sigma;
    PL=[];
    bigROI=increase_res(ROI,q);
    low=round(.9*(adjusted_mean-adjusted_sigma));
    high=round(1.1*(adjusted_mean-adjusted_sigma));
    for threshold=low:high
        threshold
        [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
        binary_gecko_disk=increase_res(binary_gecko_disk,q);
        b=bwconvhull(binary_gecko_disk,'objects');
        PL=[PL,find_peak_lengths_binary_disk(b,bigROI,f_resize*q)];
    end
%     peak_length(i,1)=mean(PL)
%     peak_length(i,2)=std(PL)
% end
% 
% geckoID=[681, 682, 731, 732, 735, 763, 772, 773];

% %varying threshold from mu to mu+sigma
% %bad because threshold was objectively too low
% peak_length=[0.1399    0.0059
%     0.1438    0.0072
%     0.1634    0.0072
%     0.1537    0.0204
%     0.1633    0.0282
%     0.1369    0.0074
%     0.1383    0.0042
%     0.1810    0.0238];
%varying threshold from mu+.5*sigma to mu+sigma
geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
peak_length1=[0.1349    0.0017
    0.1494    0.0055
    0.1678    0.0023
    0.1715    0.0112
    0.1883    0.0126
    0.1430    0.0025
    0.1399    0.0029
    0.2000    0.0125]

%varying threshold by 10% of sigma
peak_length2=[0.1372    0.0013
    0.1479    0.0023
    0.1684    0.0028
    0.1911    0.0086
    0.2005    0.0050
    0.1449    0.0022
    0.1415    0.0013
    0.2221    0.0101];


fourier_length=[681.0000    0.2141    0.0264    0.0211
  682.0000    0.2011    0.0327    0.0280
  731.0000    0.2142    0.0198    0.0275
  732.0000    0.2052    0.0337    0.0272
  735.0000    0.2394    0.0759    0.0398
  763.0000    0.1933    0.0217    0.0254
  772.0000    0.1933    0.0625    0.0330
  773.0000    0.2630    0.0323    0.0702];

fourier_length=[681.0000    0.2156    0.0266    0.0223
  682.0000    0.2037    0.0270    0.0410
  731.0000    0.2144    0.0199    0.0277
  732.0000    0.2077    0.0475    0.0289
  735.0000    0.2309    0.0482    0.0396
  763.0000    0.1944    0.0216    0.0273
  772.0000    0.1951    0.0631    0.0373
  773.0000    0.2630    0.0307    0.0678];
 

gecko_order=[1,7,6,2,3,4,5,8];


hold off
for j=1:8
i=gecko_order(j);
errorbar(2*j,peak_length1(i,1),peak_length1(i,2),'sr','LineWidth',2)
%errorbar(2*j,peak_length2(i,1),peak_length2(i,2),'sk','LineWidth',2)
hold on
errorbar(2*j+.25,fourier_length(i,2),fourier_length(i,3),'sb','LineWidth',2)
end

ylim([0,.5])
xlim([0,19])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:19)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Measured Pattern Wavelength')
