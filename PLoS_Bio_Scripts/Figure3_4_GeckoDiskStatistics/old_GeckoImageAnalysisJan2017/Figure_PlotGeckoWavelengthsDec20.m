 
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
            
%after modifying the skeleton on Dec 20th (in inches)
peak_length=[0.0608    0.0014    0.0584    0.0644
    0.0676    0.0026    0.0643    0.0725
    0.0766    0.0011    0.0744    0.0784
    0.0860    0.0034    0.0812    0.0905
    0.1023    0.0035    0.0946    0.1124
    0.0653    0.0012    0.0633    0.0677
    0.0625    0.0008    0.0612    0.0644
    0.1118    0.0063    0.1014    0.1278];            

fourier_length=[681.0000    0.2156    0.0266    0.0223
  682.0000    0.2037    0.0270    0.0410
  731.0000    0.2144    0.0199    0.0277
  732.0000    0.2077    0.0475    0.0289
  735.0000    0.2309    0.0482    0.0396
  763.0000    0.1944    0.0216    0.0273
  772.0000    0.1951    0.0631    0.0373
  773.0000    0.2630    0.0307    0.0678];


geckoID=[681, 682, 731, 732, 735, 763, 772, 773];
gecko_order=[1,7,6,2,3,4,5,8];%PL
gecko_order=[7,3,1,6,2,4,8,5];%FA
figure(4)
hold off
for j=1:8
    i=gecko_order(j);
    lower=peak_length5(i,1)-peak_length5(i,3);
    upper=peak_length5(i,4)-peak_length5(i,1);
    errorbar(2*j,peak_length5(i,1),lower,upper,'s','LineWidth',2,'Color','k')
    hold on
    scatter(2*j,peak_length(i),'k','filled')
    errorbar(2*j+.25,fourier_length(i,2),fourier_length(i,3),'s','LineWidth',2,'Color',[.5,.5,.5])
end
figure(4)
ylim([0.0,.39])
xlim([0.5,17.5])
set(gca,'FontSize',16)
set(gca,'XTick',2:2:18)
set(gca,'XTickLabel',{geckoID(gecko_order)})
ylabel('Measured Pattern Wavelength')
xlabel('Gecko ID')
