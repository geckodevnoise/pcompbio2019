
function Figure_Pattern_Stats_May11_2017

%CENTRAL VALUES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%central values are measured directly from the processed images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gecko_labels=[681   682   731   732   735   763   772   773];
central_data=zeros(8,5);
for g=1:8
    gecko=gecko_labels(g);
    [PL,SS,EE,FA]=pattern_stats_GeckoBinary_May11_2017(gecko,0);
    central_data(g,:)=[gecko,PL,SS,EE,FA]
end
% [gecko,PL,SS,EE,FA]
% central_data =
%   681.0000    0.0556    0.0400    0.6480    0.3063
%   682.0000    0.0604    0.0442    0.7723    0.2910
%   731.0000    0.0684    0.0472    0.7238    0.2981
%   732.0000    0.0803    0.0499    0.6929    0.2676
%   735.0000    0.0947    0.0509    0.7676    0.2332
%   763.0000    0.0597    0.0444    0.6995    0.2987
%   772.0000    0.0568    0.0463    0.7203    0.3359
%   773.0000    0.1053    0.0586    0.6713    0.2395


%ERROR BARS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Error Bars are measured from the grayscale images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[spot_average,e_average,f_average,pl_average]=pattern_stats_GeckoGrayscale_May11_2017;
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

%based on FA
geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
gecko_order=[7 1 6 3 2 4 8 5];

%%%%%%%%%%%%%%%%%%%
%% SPOT SIZE FIGURE
%%%%%%%%%%%%%%%%%%%%
spot_sizes=central_data(:,3);
figure(3)
hold off
for j=1:8
i=gecko_order(j);
middle=spot_sizes(i);
lower=spot_average(i,3)-spot_average(i,1);
upper=spot_average(i,2)-spot_average(i,3);
inches_to_cm=2.54;
errorbar(2*j,middle*2.54,lower*2.54,upper*2.54,'sk','LineWidth',2)
hold on
end
ylim([0,0.09*2.54])
xlim([0,17.5])
set(gca,'FontSize',26)
set(gca,'XTick',2:2:17.5)
set(gca,'XTickLabel',{geckoID(gecko_order)})

ylabel('Spot Size (cm)')
xlabel('Gecko ID')

%%%%%%%%%%%%%%%%%%%
%% ECCENTRICITY FIGURE
%%%%%%%%%%%%%%%%%%%%
eccentricities=central_data(:,4);
figure(2)
hold off
for j=1:8
i=gecko_order(j);
middle=eccentricities(i);
lower=e_average(i,3)-e_average(i,1);
upper=e_average(i,2)-e_average(i,3);
errorbar(2*j,middle',lower,upper,'sk','LineWidth',2)
hold on
end
ylim([0.5,1.0])
xlim([0,17.5])
set(gca,'FontSize',26)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Spot Eccentricity')
xlabel('Gecko ID')


%%%%%%%%%%%%%%%%%%%
%% Fractional Area FIGURE
%%%%%%%%%%%%%%%%%%%%
fractional_areas=central_data(:,5);
figure(1)
hold off
for j=1:8
i=gecko_order(j);
middle=fractional_areas(i);
lower=f_average(i,3)-f_average(i,1);
upper=f_average(i,2)-f_average(i,3);
errorbar(2*j,middle,lower,upper,'sk','LineWidth',2)
hold on
end
ylim([0.0,.5])
xlim([0,17.5])
set(gca,'FontSize',26)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Fractional Spot Area')
xlabel('Gecko ID')

%%%%%%%%%%%%%%%%%%%
%% Wavelength FIGURE
%%%%%%%%%%%%%%%%%%%%
peak_length=central_data(:,2);
figure(4)
hold off
for j=1:8
i=gecko_order(j);
central_data(i,1)
middle=peak_length(i)*2.45;
lower=(pl_average(i,3)-pl_average(i,1))*2.45;
upper=(pl_average(i,2)-pl_average(i,3))*2.45;
errorbar(2*j,middle,lower,upper,'sk','LineWidth',2)
hold on
end
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

for j=1:8
    i=gecko_order(j);
    lower=(fourier_length(i,2)-fourier_length(i,3));
    upper=(fourier_length(i,4)-fourier_length(i,2));
    c=[.5 .5 .5];
    errorbar(2*j+.25,fourier_length(i,2),lower,upper,'s','LineWidth',2,'Color',c)
    scatter(2*j+.25,fourier_length(i,2),'MarkerEdgeColor',c,'MarkerFaceColor',c)
end
box on
ylim([0.0,.5])
xlim([0.5,17.5])
set(gca,'FontSize',26)
set(gca,'YTick',[.1:.2:.7])
set(gca,'YTickLabel',{[.1:.2:.7]})
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Wavelength (cm)')
xlabel('Gecko ID')
