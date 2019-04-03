
function Figure_time_development_focus_682

time1=100000;
time2=600000;


gecko_labels=[681   682   731   732   735   763   772   773];
colors = [0   0     0     100   100   100     0    51    62     0     0     0
          0     51   100     0    10    82    34    51    31   100    51     0
        100     58     75    0    72     0     0   100    27    75    58    48]'/100;
figure(2)
sss=20;
hold off
setFA=[];
setEE=[];
for i=2:2
    gecko=gecko_labels(i);
    for number=time1:(20000*5):time2
        number
        [EE,FA]=stats_one_phenotype_cutgeckoA_Nov30_2018(gecko,number,0);
        setFA(number)=FA;
        setEE(number)=EE;
        figure(33)
        %scatter(EE,FA,20,'MarkerEdgeColor',colors(2,:),'MarkerFaceColor',colors(2,:))
        scatter(EE,FA,sss,'MarkerEdgeColor',[0.0 .7 .7],'MarkerFaceColor',[0.0 .7 .7])
        hold on
        draw_natural_phenotypes_May22_2017
        axis square
        xlim([0.55,0.93]);
        ylim([0.21,0.37]);
        title([num2str(number),' Timesteps, ',num2str(fix(number/2000)),'% Time'])
        name=['OverallPath.jpg']
        print('-djpeg',name)
        
        figure(44)
        name=['Pattern',num2str(10000000+number),'.jpg']
        
        print('-djpeg',name)
    end
end

% draw_natural_phenotypes_May22_2017
% axis square
% xlim([0.55,0.93]);
% ylim([0.21,0.37]);
