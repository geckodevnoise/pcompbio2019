

%pick a genotype [fu_g,FT_g]
%and a gecko

%this function looks at the cloud of that genotype
%and determines how well the gecko fits in that cloud
%[centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Specify Spatial Scale
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%


%make grid
vfu=.001;%61
vft=.0175;%61
%vfu=.005;%13
%vft=.0875;%13
%vfu=.0005;%120
%vft=.0088;%120
vary_fu_g=0.80:vfu:.86;
vary_FT_g=0.80:vft:1.85;
distance_grid_b=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
grid_size=sum(sum(distance_grid_b==0));


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Make FA and EE Grids
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%


%make FA isoclines
gecko_limits=[  773  .800  .860 0.80  1.85];
if 1==1 %generate isoclines or not
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%generating isoclines
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for k=1:1
    gecko=gecko_limits(k,1)
    minFU=gecko_limits(k,2);
    maxFU=gecko_limits(k,3);
    minFT=gecko_limits(k,4);
    maxFT=gecko_limits(k,5);
    %for all geckos
    isocline_grid_FA=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
    isocline_grid_EE=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
    max_count=size(minFU:vfu:maxFU,2)*size(minFT:vft:maxFT,2)
    count=0;
    for fu_g=minFU:vfu:maxFU
        for FT_g=minFT:vft:maxFT
            count=count+1
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %compute average FA and EE for this set of parameters
            EE=[]; FA=[];
            for number=1:100
                [PL,SS,EE(number),FA(number),normalizedEE,normalizedFA,FT]=draw_genotype_phenotype_Apr19(0,0,fu_g,FT_g,number);
            end
            centerEE=mean(EE);%non-normalized
            centerFA=mean(FA);%non-normalized
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            i=find(abs(vary_fu_g-fu_g)==min(abs(vary_fu_g-fu_g)));
            j=find(abs(vary_FT_g-FT_g)==min(abs(vary_FT_g-FT_g)));
            isocline_grid_FA(j,i)=centerFA;
            isocline_grid_EE(j,i)=centerEE;
            hold off, imagesc(isocline_grid_FA)
            colormap hot, colorbar
            print('-djpeg',['isocline_grid_FA.jpg'])
            hold off, imagesc(isocline_grid_EE)
            colormap hot, colorbar
            print('-djpeg',['isocline_grid_EE.jpg'])
        end
    save(['isocline_grid_FA_',num2str(max_count),'.mat'],'isocline_grid_FA')
    save(['isocline_grid_EE_',num2str(gmax_count),'.mat'],'isocline_grid_EE')
    end
    end
end


% gecko_limits=[  773  .800  .824 1.40  1.85
%                 735  .820  .860 1.25  1.85
%                 682  .820  .860 0.80  1.50
%                 772  .810  .828 0.80  1.30
%                 731  .810  .832 1.10  1.50
%                 763  .810  .832 1.10  1.50
%                 732  .810  .828 1.30  1.70
%                 681  .800  .820 0.80  1.40];

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Generate 8 Gecko Grids
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

gecko_limits=[  773  .810  .820 1.5   1.70
                735  .820  .860 1.10  1.70
                682  .820  .860 1.10  1.50
                772  .810  .828 1.00  1.30
                731  .810  .832 1.10  1.50
                763  .810  .832 1.10  1.50
                732  .810  .828 1.30  1.70
                681  .800  .820 1.00  1.35];

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
    %load(['distance_grid_',num2str(gecko),'_',num2str(grid_size),'.mat'])
    %distance_grid_b=distance_grid;
    max_count=size(minFU:vfu:maxFU,2)*size(minFT:vft:maxFT,2)
    count=0;
    for fu_g=minFU:vfu:maxFU
        for FT_g=minFT:vft:maxFT
            count=count+1
            if gecko>500
                [EE,FA,centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Apr19(fu_g,FT_g,gecko);
            else
                [EE,FA,centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Apr19(fu_g,FT_g,gecko);
            end
            i=find(abs(vary_fu_g-fu_g)==min(abs(vary_fu_g-fu_g)));
            j=find(abs(vary_FT_g-FT_g)==min(abs(vary_FT_g-FT_g)));
            distance_grid_b(j,i)=percent_distance;
            hold off, imagesc(distance_grid_b)
            colormap hot, colorbar
            print('-djpeg',['SoFar',num2str(gecko),'.jpg'])
        end
    end
    distance_grid=distance_grid_b;
    save(['distance_grid_',num2str(gecko),'_',num2str(max_count),'.mat'],'distance_grid')
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Make Figure 4
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

distance_grid_all=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
load(['isocline_grid_FA_',num2str(grid_size),'.mat']);
%boundary=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
boundary=(isocline_grid_FA<0.21)+(isocline_grid_FA>0.36);
for k=1:8
    gecko=gecko_limits(k,1)
    load(['distance_grid_',num2str(gecko),'_',num2str(grid_size),'.mat'])
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





