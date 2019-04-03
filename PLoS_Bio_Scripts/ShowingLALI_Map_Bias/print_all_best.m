
function print_all_best


gecko_labels=[681   682   731   732   735   763   772   773];

for i=1:8
    
    gecko=gecko_labels(i);

    f=101;
    a=1;b=20;
    c='ob';
    figure(f)
    %clf
    
    subplot(1,2,2)
    distance=[];
    for number=a:b
        distance(number)=draw_simulation_phenotypesAug23('SS','EE',c,f,gecko,number);
        hold on
    end
    draw_natural_phenotypesAug23('SS','EE',.02,'k')
    d=find(distance==min(distance))
    distance(d)=draw_simulation_phenotypesAug23('SS','EE','r',f,gecko,d);

    axis square
    title(['Gecko ',num2str(gecko)])

    subplot(1,2,1)
    for number=a:b
        distance(number)=draw_simulation_phenotypesAug23('SS','FA',c,f,gecko,number);
        hold on
    end
    draw_natural_phenotypesAug23('SS','FA',.02,'k')
    d=find(distance==min(distance))
    distance(d)=draw_simulation_phenotypesAug23('SS','FA','r',f,gecko,d);
    axis square
    title(['Gecko ',num2str(gecko)])
    set(gca, 'LooseInset', [0,0,0,0]);
    %print('-djpeg',['GeckoPhenotypeDist',num2str(gecko),'.jpg'])
    
    %draw_simulation_match(gecko,d,4)
    %set(gca, 'LooseInset', [0,0,0,0]);
    %print('-djpeg',['GeckoPhenotypeBestMatch',num2str(gecko),'.jpg'])
    
end


