
function [Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks,normalizedFA,normalizedEE]=retrieve_natural_phenotypes_Dec24(gecko)



%case 'EE'
x=3;
Xmin=0.62;%always until Dec 14th
Xmax=0.82;%always until Dec 14th
Xticks=0.50:0.05:.85;%always until Dec 14th

Xmin=0.42;%Dec 14th
% Xmax=1.02;%Dec 14th
Xticks=0.65:0.1:.85;%Dec 14th
Xticks=0.6:0.1:.9;%Dec 14th

Xm=1/(Xmax-Xmin);
Xticks2=Xm*(Xticks-Xmax)+1;


%case 'FA'
y=4;%'FA'
Ymin=0.22;
Ymax=0.355;
Ym=1/(Ymax-Ymin);
Yticks=0.2:0.05:.35;

      
%Gecko PL EE FA SS FL SS/PL
stats=[ 681.0000    0.0560    0.6480    0.3060    0.0400    0.2156    0.7200
        682.0000    0.0600    0.7720    0.2910    0.0440    0.2037    0.7300
        731.0000    0.0680    0.7240    0.3070    0.0470    0.2144    0.6900
        732.0000    0.0800    0.6930    0.2680    0.0500    0.2077    0.6200
        735.0000    0.0950    0.7680    0.2330    0.0510    0.2309    0.5400
        763.0000    0.0600    0.7000    0.2990    0.0440    0.1944    0.7400
        772.0000    0.0570    0.7200    0.3360    0.0460    0.1951    0.8200
        773.0000    0.1050    0.6710    0.2400    0.0590    0.2630    0.5600];

i=find(stats(:,1)==gecko);
EE=stats(i,x);
normalizedEE=Xm*(EE-Xmax)+1;
FA=stats(i,y);
normalizedFA=Ym*(FA-Ymax)+1;
%     data1=stats(:,x);
%     data1=Xm*(data1-Xmax)+1;
%     data2=stats(:,y);
%     data2=Ym*(data2-Ymax)+1;
%     scatter(data1(i),data2(i),'k','filled')
%     text(data1(i)+radius2,data2(i),num2str(stats(i,1)),'Color',c,'FontSize',16)
%     hold on


% data1_cluster1=[data1(4:5)',data1(8)'];
% data1_cluster2=[data1(1:3)',data1(6:7)'];
% data2_cluster1=[data2(4:5)',data2(8)'];
% data2_cluster2=[data2(1:3)',data2(6:7)'];
% size([data1_cluster1;data2_cluster1]);


% for i=1:8
%     data1=stats(:,x);
%     data1=Xm*(data1-Xmax)+1;
%     data2=stats(:,y);
%     data2=Ym*(data2-Ymax)+1;
%     scatter(data1(i),data2(i),'k','filled')
%     text(data1(i)+radius2,data2(i),num2str(stats(i,1)),'Color',c,'FontSize',18)
%     hold on
% end
% ylim([-0.1,1.0])
% xlim([-.1,1.2])
% xlim([.35,1.2])
% Xticks2=Xm*(Xticks-Xmax)+1;
% Yticks2=Ym*(Yticks-Ymax)+1;
% set(gca,'XTick',Xticks2)
% set(gca,'XTickLabel',Xticks)
% set(gca,'YTick',Yticks2)
% set(gca,'YTickLabel',Yticks)


