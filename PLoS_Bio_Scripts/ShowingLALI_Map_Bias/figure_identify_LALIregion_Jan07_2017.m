%pick a value for fu
%vary the threshold to see what is the natural range

vary_fu_g=.805:.001:.824;
vary_FT_g=0:.02:3;

minFU=.8;
maxFU=.85;
minFT=min(vary_FT_g);
maxFT=max(vary_FT_g);

FUgrid=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
FTgrid=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
FAgrid=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
EEgrid=zeros(size(vary_FT_g,2),size(vary_fu_g,2));

max_count=size(minFU:.001:maxFU,2)*size(minFT:.02:maxFT,2)
count=0;
for fu_g=.802:.001:.85
    fu_g=fu_g
    count=0;
    for FT_g=minFT:.02:maxFT
        count=count+1
        EE=[];
        FA=[];
        for number=1:100
            %load that gecko pattern (1 through 100)
            cd(['gecko',num2str(fu_g*1000)])
                name=['gecko',num2str(fu_g*1000),'phenotype',num2str(1000+number),'.mat'];
                load(name)
            cd ..
            MeanThreshold=mean(mean(geckoA));
            %these values from pattern_stats are NOT normalized
            %and more "raw"!
            [PL,SS,EE(number),FA(number),FT]=pattern_stats_Jan07_2017(geckoA,FT_g*MeanThreshold,0);
        end
        centerEE=mean(EE);
        centerFA=mean(FA);
        i=find(abs(vary_fu_g-fu_g)==min(abs(vary_fu_g-fu_g)));
        j=find(abs(vary_FT_g-FT_g)==min(abs(vary_FT_g-FT_g)));
        FAgrid(j,i)=centerFA;
        EEgrid(j,i)=centerEE;
        FUgrid(j,i)=fu_g;
        FTgrid(j,i)=FT_g;
    end
    save(['FAgrid.mat'],'FAgrid')
save(['EEgrid.mat'],'EEgrid')
save(['FUgrid.mat'],'FUgrid')
save(['FTgrid.mat'],'FTgrid')
figure(42)
imagesc(FAgrid)
end




% vary_fu_g=.8:.001:.85;
% vary_FT_g=0:.02:3;
% distance_grid_all=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
% boundary=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
% 
% for k=1:19
%     gecko=gecko_limits(k,1)
%     load(['distance_grid_',num2str(gecko),'c.mat'])
%     %pattern=(distance_grid<99).*(distance_grid>0)+(distance_grid<50).*(distance_grid>0)*k;
%     boundary=max(boundary,distance_grid==111);
%     if max(gecko==[763 735 773])
%         pattern=(distance_grid<50).*(distance_grid>0)*15;
%     else
%         pattern=(distance_grid<50).*(distance_grid>0)*13;
%     end
%     distance_grid_all=distance_grid_all+pattern;
% end
% 
% distance_grid_all=distance_grid_all+2*boundary;
% figure(11),hold off, image(distance_grid_all)
% axis xy
% colormap vga
% Xticks=(11:10:46); 
% set(gca,'XTick',(Xticks))
% set(gca,'XTickLabel',vary_fu_g(Xticks))
% Yticks=(22:20:140); 
% set(gca,'YTick',(Yticks))
% set(gca,'YTickLabel',vary_FT_g(Yticks))
% xlim([10,46])
% ylim([0,93])
% set(gca,'FontSize',22)
% xlabel('Activation Rate {f_u}')
% ylabel('Threshold Relative to Mean')
% hold on
% gecko_labels=[681   682   731   732   735   763   772   773];
% for i=1:8
%     gecko=gecko_labels(i);
%     [D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Dec18(gecko);
%     i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
%     j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
%     scatter(i,j,'k','filled')
%     if gecko==682
%         scatter(i,j,'k','filled')
%     end
%     if gecko==731
%         text(i+1,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
%     else
%         text(i-2,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
%     end
%         hold on
% end