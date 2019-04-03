

geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
gecko_order=[1,6,2,7,3,4,5,8];%SS
gecko_order=[7,3,1,6,2,4,8,5];%FA
%gecko_order=[1,8,4,6,7,3,5,2];%EE
f_resize=[213,204,200,200,207,211,209,210];%number of pixels per inch

% for i=1:1%8
%     i=i
%     q=3;
%     gecko=geckoID(i);
%     [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko);
%     threshold=0;
%     [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
%     %threshold=adjusted_mean-adjusted_sigma;
%     SS=[];
%     EE=[];
%     FA=[];
%     bigROI=increase_res(ROI,q);
%     low=round((adjusted_mean-1.25*adjusted_sigma));
%     high=round(1.1*(adjusted_mean-.75*adjusted_sigma));
%     for threshold=low:high
%         threshold
%         [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
%         binary_gecko_disk=increase_res(binary_gecko_disk,q);
%         b=bwlabel(binary_gecko_disk);
%         s=regionprops(b,'EquivDiameter','Eccentricity');%b is three times larger
%         spot_sizes=[s.EquivDiameter];
%         SS=[SS,mean([s.EquivDiameter])];
%         EE=[EE,mean([s.Eccentricity])];
%         FA=[FA,sum(sum(binary_gecko_disk==1))/sum(sum(bigROI==1))];
%     end
%     spot_average(i,1)=min(SS);
%     spot_average(i,2)=max(SS);
%     spot_average(i,3)=mean(SS);
%     spot_average(i,4)=std(SS);
%     e_average(i,1)=min(EE);
%     e_average(i,2)=max(EE);
%     e_average(i,3)=mean(EE);
%     e_average(i,4)=std(EE);
%     f_average(i,1)=min(FA)
%     f_average(i,2)=max(FA);
%     f_average(i,3)=mean(FA);
%     f_average(i,4)=std(FA);
% end

spot_average =[23.0075   31.7170   26.6076    2.4314
   24.3641   34.8076   29.3459    3.5273
   25.0530   35.4955   30.3156    3.2674
   27.6397   33.7140   30.7345    1.6667
   25.6053   41.2953   34.3734    4.7389
   24.5413   33.8877   29.1299    2.6470
   22.6443   34.3300   29.5773    3.6221
   31.5870   45.5425   37.6471    3.3506];
spot_average =spot_average ./ [f_resize;f_resize;f_resize;f_resize]';
%this converts from pixels to inches
%so these numbers are in inches
e_average =[0.6256    0.6779    0.6549    0.0113
    0.7342    0.8050    0.7759    0.0204
    0.6913    0.7500    0.7224    0.0164
    0.6387    0.7463    0.7020    0.0320
    0.7189    0.8217    0.7808    0.0246
    0.6848    0.7172    0.7010    0.0074
    0.7188    0.7635    0.7386    0.0120
    0.6595    0.7418    0.6904    0.0219];
% f_average =[0.0178    0.0305    0.0245    0.0038
%     0.0284    0.0473    0.0379    0.0056
%     0.0181    0.0324    0.0255    0.0043
%     0.0216    0.0429    0.0315    0.0065
%     0.0154    0.0272    0.0207    0.0036
%     0.0275    0.0451    0.0365    0.0052
%     0.0307    0.0613    0.0473    0.0088
%     0.0108    0.0204    0.0157    0.0028];
f_average =[0.2314    0.3966    0.3185    0.0491
    0.2367    0.3933    0.3152    0.0463
    0.2268    0.4051    0.3191    0.0540
    0.2012    0.3999    0.2939    0.0606
    0.1997    0.3521    0.2681    0.0469
    0.2370    0.3886    0.3146    0.0452
    0.2198    0.4384    0.3383    0.0628
    0.1847    0.3480    0.2681    0.0482];
MEANspot=mean(spot_average(:,3))
MEANe=mean(e_average(:,3))
MEANf=mean(f_average(:,3))
STDspot=mean(spot_average(:,4))
STDe=mean(e_average(:,4));
STDf=mean(f_average(:,4));

MEANspot=1;
MEANe=1;
MEANf=1;
STDspot=1;
STDe=1;
STDf=1;

spot_sizes=[0.0400    0.0440    0.0470    0.0500    0.0510    0.0440    0.0460    0.0590];
figure(2)
hold off
for j=1:8
i=gecko_order(j);

middle=spot_sizes(i);
lower=spot_average(i,3)-spot_average(i,1);
upper=spot_average(i,2)-spot_average(i,3);
errorbar(2*j,middle/MEANspot,lower/MEANspot,upper/MEANspot,'sk','LineWidth',2)
hold on

end
ylim([0,0.11])
xlim([0,17.5])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:17.5)
set(gca,'XTickLabel',{geckoID(gecko_order)})

ylabel('Spot Size')
xlabel('Gecko ID')


eccentricities=[0.6480    0.7720    0.7240    0.6930    0.7680    0.7000    0.7200    0.6710];
figure(3)
hold off
for j=1:8
i=gecko_order(j);
middle=eccentricities(i);
lower=e_average(i,3)-e_average(i,1);
upper=e_average(i,2)-e_average(i,3);
errorbar(2*j,middle'/MEANe,lower/MEANe,upper/MEANe,'sk','LineWidth',2)
hold on
end
ylim([0.5,1.0])
xlim([0,17.5])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Spot Eccentricity')
xlabel('Gecko ID')

fractional_areas=[0.3060    0.2910    0.3070    0.2680    0.2330    0.2990    0.3360    0.2400];
figure(4)
hold off
for j=1:8
i=gecko_order(j);
middle=fractional_areas(i);
lower=f_average(i,3)-f_average(i,1);
upper=f_average(i,2)-f_average(i,3);
errorbar(2*j,middle/MEANf,lower/MEANf,upper/MEANf,'sk','LineWidth',2)
hold on
end
ylim([0.0,.5])
xlim([0,17.5])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Fractional Spot Area')
xlabel('Gecko ID')