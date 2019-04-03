
function Figure_time_development_focus_682


gecko_labels=[681   682   731   732   735   763   772   773];
figure(2)
sss=20;
hold off
setFA=[];
setEE=[];
number=5;
for i=5:5
    gecko=gecko_labels(i);
    for k=0.8:.05:1.05
        k
        [EE,FA]=stats_one_phenotype_cutgeckoA_Dec05_2018(gecko,number,0,k);
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
        title(['Gecko ',num2str(gecko),', Threshold ',num2str(fix(k*100)),'%T_0'])
        name=['overall.jpg'];
        print('-djpeg',name)
        figure(44)
            name=['pattern',num2str(10000000+k*100),'.jpg'];
        print('-djpeg',name)
    end
end

