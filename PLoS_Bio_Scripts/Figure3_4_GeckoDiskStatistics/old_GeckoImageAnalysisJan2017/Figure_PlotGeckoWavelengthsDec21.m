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




% %varying threshold by 25% of sigma
% peak_length4=[0.1373    0.0038
%     0.1510    0.0048
%     0.1695    0.0028
%     0.1853    0.0148
%     0.1932    0.0113
%     0.1460    0.0033
%     0.1420    0.0025
%     0.2161    0.0224];

peak_length4=[0.1381    0.0039    0.1321    0.1483
    0.1513    0.0047    0.1443    0.1601
    0.1694    0.0029    0.1648    0.1739
    0.1908    0.0119    0.1747    0.2066
    0.1992    0.0054    0.1896    0.2055
    0.1463    0.0036    0.1416    0.1531
    0.1427    0.0019    0.1399    0.1467
    0.2228    0.0214    0.1904    0.2721];

%after modifying the skeleton on Dec 20th
peak_length5=[0.1428    0.0032    0.1373    0.1514
    0.1588    0.0060    0.1511    0.1705
    0.1800    0.0025    0.1748    0.1843
    0.2020    0.0080    0.1908    0.2128
    0.2403    0.0082    0.2222    0.2642
    0.1535    0.0028    0.1489    0.1591
    0.1468    0.0019    0.1439    0.1514
    0.2627    0.0147    0.2384    0.3004];

%rectangles
peak_length3=[0.1154    0.0068
    0.1194    0.0052
    0.1221    0.0026
    0.1490    0.0165
    0.1282    0.0106
    0.1265    0.0016
    0.1156    0.0011
    0.1679    0.0060];

fourier_length=[681.0000    0.2156    0.0266    0.0223
  682.0000    0.2037    0.0270    0.0410
  731.0000    0.2144    0.0199    0.0277
  732.0000    0.2077    0.0475    0.0289
  735.0000    0.2309    0.0482    0.0396
  763.0000    0.1944    0.0216    0.0273
  772.0000    0.1951    0.0631    0.0373
  773.0000    0.2630    0.0307    0.0678];



gecko_order=[1,7,6,2,3,4,5,8];

figure(2)

hold off
for j=1:8
i=gecko_order(j);
%errorbar(2*j,peak_length1(i,1),peak_length1(i,2),'sk','LineWidth',2)
lower=peak_length4(i,1)-peak_length4(i,3)
upper=peak_length4(i,4)-peak_length4(i,1)
errorbar(2*j,peak_length4(i,1),lower,upper,'s','LineWidth',2,'Color','k')
hold on
%errorbar(2*j,peak_length3(i,1),peak_length3(i,2),'sr','LineWidth',2)
errorbar(2*j+.25,fourier_length(i,2),fourier_length(i,3),'s','LineWidth',2,'Color',[.5,.5,.5])
end
ylim([0.0,.45])
xlim([0.5,17.5])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Measured Pattern Wavelength')
xlabel('Gecko ID')

% figure(3)
% mean_peak_length
% hold off
% for j=1:8
% i=gecko_order(j);
% %errorbar(2*j,peak_length1(i,1),peak_length1(i,2),'sk','LineWidth',2)
% errorbar(2*j,peak_length4(i,1),peak_length4(i,2),'sk','LineWidth',2)
% hold on
% %errorbar(2*j,peak_length3(i,1),peak_length3(i,2),'sr','LineWidth',2)
% errorbar(2*j+.25,fourier_length(i,2),fourier_length(i,3),'sb','LineWidth',2)
% end
% ylim([0.0,.45])
% xlim([0,19])
% set(gca,'FontSize',16)
% set(gca,'XTick',2:2:18)
% set(gca,'XTickLabel',{geckoID(gecko_order)})
% ylabel('Measured Pattern Wavelength')
xlabel('Gecko ID')