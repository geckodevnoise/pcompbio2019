%this version is for the 'edges' subroutine
function draw_natural_phenotypes_May22_2017

q=[1.0000    1.0000    1.0000
    1.0000         0         0
         0         0    1.0000
    0.4828    0.1034    0.4138
    1.0000    0.1034    0.7241
    1.0000    0.8276         0
         0    0.3448         0
         0    0.5172    0.5862
    0.6207    0.3103    0.2759
         0    1.0000    0.7586
         0    0.5172    0.5862
         0         0    0.4828
    0.5862    0.8276    0.3103
    0.7500    0.7500    0.7500
    0.8276    0.0690    1.0000
    0.4828    0.1034    0.4138];

radius2=0.01;
   
%Gecko PL EE FA SS FL SS/PL
stats=[681.0000    0.0560    0.6480    0.3060    0.0400    0.2156    0.7200
  682.0000    0.0600    0.7720    0.2910    0.0440    0.2037    0.7300
  731.0000    0.0680    0.7240    0.3070    0.0470    0.2144    0.6900
  732.0000    0.0800    0.6930    0.2680    0.0500    0.2077    0.6200
  735.0000    0.0950    0.7680    0.2330    0.0510    0.2309    0.5400
  763.0000    0.0600    0.7000    0.2990    0.0440    0.1944    0.7400
  772.0000    0.0570    0.7200    0.3360    0.0460    0.1951    0.8200
  773.0000    0.1050    0.6710    0.2400    0.0590    0.2630    0.5600];

gecko_labels=[773   735   682   772   731   763   732   681];

for i=1:8
    j=find(gecko_labels==stats(i,1));
    scatter(stats(i,3),stats(i,4),50,q(j+1,:),'filled')
    hold on
    %cut and paste the square shape from http://fsymbols.com/signs/square/
    %text(stats(i,3)+radius2,stats(i,4)+.001,'??','Color','w','FontSize',24)
    %text(stats(i,3)+radius2,stats(i,4),'??','Color','w','FontSize',24)
    hold on
    %text(stats(i,3)+radius2,stats(i,4),num2str(stats(i,1)),'Color','k','FontSize',24)
    text(stats(i,3)+radius2,stats(i,4),num2str(stats(i,1)),'Color',[0,0,0],'FontSize',16)
    
    hold on
end

for i=1:8
    j=find(gecko_labels==stats(i,1));
    text(stats(i,3)+radius2,stats(i,4),num2str(stats(i,1)),'Color',[0,0,0],'FontSize',16)
    hold on
end

set(gca,'FontSize',26)
box on
xlabel('EE')
ylabel('FA')
set(gca,'YTick',.23:.04:.36)
set(gca,'YTick',.15:.04:.36)
%% 
%% 
%xlim([0.55,0.93]);
%ylim([0.14,0.37]);
hold on

