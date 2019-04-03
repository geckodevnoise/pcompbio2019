
%use calculating_peak_length_Jan04_2017.m
%to generate this data

%after modifying the skeleton on Dec 20th (in cm)
peak_length=[  0.1428    0.0032    0.1373    0.1514
                0.1588    0.0060    0.1511    0.1705
                0.1800    0.0025    0.1748    0.1843
                0.2020    0.0080    0.1908    0.2128
                0.2403    0.0082    0.2222    0.2642
                0.1535    0.0028    0.1489    0.1591
                0.1468    0.0019    0.1439    0.1514
                0.2627    0.0147    0.2384    0.3004];
            
% %after modifying the skeleton on Dec 20th (in inches)
% peak_length=[0.0608    0.0014    0.0584    0.0644
%     0.0676    0.0026    0.0643    0.0725
%     0.0766    0.0011    0.0744    0.0784
%     0.0860    0.0034    0.0812    0.0905
%     0.1023    0.0035    0.0946    0.1124
%     0.0653    0.0012    0.0633    0.0677
%     0.0625    0.0008    0.0612    0.0644
%     0.1118    0.0063    0.1014    0.1278];   

%then this is grabbed from 
%Figure_PlotGeckoWavelengths_Points_Jan04_2017
%in centimeters
peak_length(:,1)=[0.0556
    0.0603
    0.0688
    0.0800
    0.0953
    0.0596
    0.0568
    0.1049]*2.35;

%in centimeters
%Gecko ID     length     90% low  90% hi   75% lo     75% hi
fourier_length=[681.0000    0.2156    0.1889    0.2379    0.1396    0.2560
  682.0000    0.2037    0.1767    0.2447    0.1203    0.2787
  731.0000    0.2144    0.1945    0.2421    0.1814    0.2756
  732.0000    0.2077    0.1602    0.2366    0.1376    0.2597
  735.0000    0.2309    0.1826    0.2704    0.1458    0.6672
  763.0000    0.1944    0.1727    0.2216    0.1553    0.2493
  772.0000    0.1951    0.1320    0.2325    0.1261    0.2714
  773.0000    0.2630    0.2324    0.3308    0.2124    0.3909];


  






geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
gecko_order=[1,7,6,2,3,4,5,8];%PL
gecko_order=[7,3,1,6,2,4,8,5];%FA
figure(4)
hold off
q=1;%cm
%q=2.35;%inches
for j=1:8
    i=gecko_order(j)
    lower=peak_length(i,1)-peak_length(i,3);
    upper=peak_length(i,4)-peak_length(i,1);
    errorbar(2*j,peak_length(i,1)/q,lower/q,upper/q,'s','LineWidth',2,'Color','k')
    scatter(2*j,peak_length(i)/q,'k','filled')
    hold on
    lower=(fourier_length(i,2)-fourier_length(i,5))/q;
    upper=(fourier_length(i,6)-fourier_length(i,2))/q;
    c=[.5 .5 .5];
    errorbar(2*j+.25,fourier_length(i,2)/q,lower,upper,'s','LineWidth',2,'Color',c)
    scatter(2*j+.25,fourier_length(i,2)/q,'MarkerEdgeColor',c,'MarkerFaceColor',c)
end
figure(4)
box on
%ylim([0.0,.18])
ylim([0.0,.75])
xlim([0.5,17.5])
set(gca,'FontSize',22)
%set(gca,'YTick',[.05,.1,.15])
%set(gca,'YTickLabel',{'0.05','0.10','0.15'})
set(gca,'YTick',[.1:.2:.7])
set(gca,'YTickLabel',{[.1:.2:.7]})
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
%ylabel('Wavelength (inches)')
ylabel('Wavelength (cm)')
xlabel('Gecko ID')

