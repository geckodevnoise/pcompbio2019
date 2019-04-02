

%pick a genotype [fu_g,FT_g]
%and a gecko

%this function looks at the cloud of that genotype
%and determines how well the gecko fits in that cloud
%[centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);


%make grid
vfu=.001;%61
vft=.0175;%61
%vfu=.005;%13
%vft=.0875;%13
vary_fu_g=0.80:vfu:.86;
vary_FT_g=0.80:vft:1.85;
distance_grid_b=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
grid_size=sum(sum(distance_grid_b==0));




gecko_limits=[  773  .800  .824 1.40  1.85
                735  .820  .860 1.25  1.85
                682  .820  .860 0.80  1.50
                772  .810  .828 0.80  1.30
                731  .810  .832 1.10  1.50
                763  .810  .832 1.10  1.50
                732  .810  .828 1.30  1.70
                681  .800  .820 0.80  1.40];

if 1==1 %generate grids or not
    %%%%%%%%%%%%%%%%%%%
    %%%generating grids
    %%%%%%%%%%%%%%%%%%%
    for k=1:8
    gecko=gecko_limits(k,1)
    minFU=gecko_limits(k,2);
    maxFU=gecko_limits(k,3);
    minFT=gecko_limits(k,4);
    maxFT=gecko_limits(k,5);
    %for all geckos
    distance_grid_b=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
    max_count=size(minFU:vfu:maxFU,2)*size(minFT:vft:maxFT,2)
    count=0;
    for fu_g=minFU:vfu:maxFU
        for FT_g=minFT:vft:maxFT
            count=count+1
            if gecko>500
                [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Apr17(fu_g,FT_g,gecko);
            else
                [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Apr17(fu_g,FT_g,682);
            end
            i=find(abs(vary_fu_g-fu_g)==min(abs(vary_fu_g-fu_g)));
            j=find(abs(vary_FT_g-FT_g)==min(abs(vary_FT_g-FT_g)));
            distance_grid_b(j,i)=percent_distance;
            hold off, imagesc(distance_grid_b)
            colormap hot, colorbar
            print('-djpeg',['SoFar',num2str(gecko),'.jpg'])
            %0 would be 0.233; -0.1481 would be 0.2; -0.074 would be 0.21
            if cFA<-0.074 %this corresponds to a particular reference FA value
               distance_grid_b(j,i)=111;
            end
            if cFA>0.963 %this corresponds to a particular reference FA value
               distance_grid_b(j,i)=112;
            end
        end
    end
    distance_grid=distance_grid_b;
    save(['distance_grid_',num2str(gecko),'_',num2str(grid_size),'.mat'],'distance_grid')
    end
end



distance_grid_all=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
boundary=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
for k=1:8
    gecko=gecko_limits(k,1)
    load(['distance_grid_',num2str(gecko),'_',num2str(grid_size),'.mat'])
    %pattern=(distance_grid<99).*(distance_grid>0)+(distance_grid<50).*(distance_grid>0)*k;
    boundary=max(boundary,distance_grid==111);
    boundary=max(boundary,distance_grid==112);
    if max(gecko==[763 735 773 681])
        pattern=(distance_grid<50).*(distance_grid>0)*5;
    else
        pattern=(distance_grid<50).*(distance_grid>0)*8;
    end
    distance_grid_all=distance_grid_all+pattern;
end

distance_grid_all=distance_grid_all+14*boundary;
distance_grid_all(distance_grid_all==0)=16;
distance_grid_all(distance_grid_all==13)=8;
figure(11),hold off, image(distance_grid_all)


axis xy
colormap vga
colormap gray
Xticks=(11:10:46); 
set(gca,'XTick',(Xticks))
set(gca,'XTickLabel',vary_fu_g(Xticks))
Yticks=(26:10:140); 
set(gca,'YTick',(Yticks))
set(gca,'YTickLabel',vary_FT_g(Yticks))
xlim([2,46])
ylim([42,93])
set(gca,'FontSize',22)
xlabel('Activation Rate {f_u}')
ylabel('Threshold Relative to Mean')
hold on
gecko_labels=[681   682   731   732   735   763   772   773];
for i=1:8
    gecko=gecko_labels(i);
    cd ../GeckoMatFiles
    [D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Feb23(gecko);
    cd ../Figure4_LALIspace
    i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
    j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
    scatter(i,j,80,'k','filled')
    scatter(i,j,20,'w','filled')
    if gecko==682
        scatter(i,j,80,'k','filled')
        scatter(i,j,20,'w','filled')
    end
    if gecko==731
        text(i+1,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    elseif gecko==735
        text(i+1,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    else
        text(i-2,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    end
        hold on
end

axis square

fu=.806;FT=1.75;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'A','Color',[0 0 0],'FontSize',18)

fu=.805;FT=1.1;
fu=.804;FT=1.0;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
%scatter(i,j,80,[.6 .6 .6],'filled')
scatter(i,j,100,'p','k','filled')
text(i+1,j,'B','Color',[0 0 0],'FontSize',18)

fu=.84;FT=1.7;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'C','Color',[0 0 0],'FontSize',18)
fu=.835;FT=0.9;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'D','Color',[0 0 0],'FontSize',18)





