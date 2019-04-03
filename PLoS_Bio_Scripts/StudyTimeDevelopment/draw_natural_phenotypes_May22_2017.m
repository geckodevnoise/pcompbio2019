
function draw_natural_phenotypes_May22_2017


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

for i=1:8
    scatter(stats(i,3),stats(i,4),'k','filled')
    hold on
    %cut and paste the square shape from http://fsymbols.com/signs/square/
    %text(stats(i,3)+radius2,stats(i,4)+.001,'??','Color','w','FontSize',24)
    %text(stats(i,3)+radius2,stats(i,4),'??','Color','w','FontSize',24)
    hold on
    %if max([6,2,3]==i)
      %text(stats(i,3)+radius2,stats(i,4),num2str(stats(i,1)),'FontWeight','Bold','Color','w','FontSize',18)
      text(stats(i,3)+radius2,stats(i,4),num2str(stats(i,1)),'Color','k','FontSize',16)
    %end  
    hold on
end

set(gca,'FontSize',18)
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

