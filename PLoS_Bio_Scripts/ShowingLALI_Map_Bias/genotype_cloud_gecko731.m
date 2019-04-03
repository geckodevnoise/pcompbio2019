


%pick a genotype [fu_g,FT_g]
%and a gecko
%this function looks at the cloud of that genotype
%and determines how well the gecko fits in that cloud
%[centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);

% vary_fu_g=.814:.001:.823
% vary_fu_g=.810:.001:.823;
% vary_FT_g=1.200:.002:1.380;
% fu_grid=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
% FT_grid=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
% distance_grid_731b=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
% distance_grid_763b=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
% max_count=size(vary_fu_g,2)*size(vary_FT_g,2)
% count=0;
% for i=1:size(vary_fu_g,2)
%     fu_g=vary_fu_g(i)
%     for j=1:size(vary_FT_g,2)
%         count=count+1
%         FT_g=vary_FT_g(j)
%         fu_grid(i,j)=fu_g;
%         FT_grid(i,j)=FT_g;
%         [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,763);
%         distance_grid_763b(i,j)=percent_distance;
%         [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,731);
%         distance_grid_731b(i,j)=percent_distance;
%     end
% end
% 
% distance_grid=distance_grid';
% distance_grid_731=distance_grid_731';
% distance_grid_763=distance_grid_763';



own_jpeg=zeros(size(vary_FT_g,2),size(vary_fu_g,2),3);
%light red
light_red=[distance_grid_731<75];
own_jpeg(:,:,1)=light_red*255;
own_jpeg(:,:,2)=light_red*100;
own_jpeg(:,:,3)=light_red*100;
%red
red=[distance_grid_731<50];
own_jpeg(:,:,1)=light_red*255;
own_jpeg(:,:,3)=fix([distance_grid_763<75].^k*255);
%own_jpeg(:,:,1)=fix(([distance_grid_731<70]+[distance_grid_731<50])*255/2);
own_jpeg(:,:,2)=255.*(own_jpeg(:,:,1)==0).*(own_jpeg(:,:,3)==0);
nothing=(own_jpeg(:,:,1)==0).*(own_jpeg(:,:,3)==0);
own_jpeg(:,:,1)=max(own_jpeg(:,:,1),255*nothing);
own_jpeg(:,:,3)=max(own_jpeg(:,:,3),255*nothing);
own_jpeg=uint8(own_jpeg);
figure(9)
image(own_jpeg)
axis xy
qY=8:20:size(vary_FT_g,2);
set(gca,'YTick',qY)
set(gca,'YTickLabel',vary_FT_g(qY))
qX=1:2:size(vary_fu_g,2);
set(gca,'XTick',qX)
set(gca,'XTickLabel',vary_fu_g(qX))   



% cloudG=3*(distance_grid_731<80)+5*(distance_grid_731<50)+...
%     +7*(distance_grid_763<80)+11*(distance_grid_763<50);
% figure(9)
% image(cloudG)
% axis xy
% map=colormap;
% map(1,:)=[1 1 1];
% map(3,:)=[1 .5 .5];
% map(7,:)=[.5 .5 1];
% map(8,:)=[1 0 0];
% map(10,:)=[1 0 1];
% map(15,:)=[.5 0 .5];
% map(18,:)=[0 0 1];
% map(21,:)=[.5 0 1];
% colormap(map)
% qY=1:5:size(vary_FT_g,2);
% set(gca,'YTick',qY)
% set(gca,'YTickLabel',vary_FT_g(qY))
% qX=1:2:size(vary_fu_g,2);
% set(gca,'XTick',qX)
% set(gca,'XTickLabel',vary_fu_g(qX))



% % %here, looking at the matches with the matched genotypes
% % %very good!
% % gecko_labels=[681   682   731   732   735   763   772   773];
% % for i=1:8
% %     gecko=gecko_labels(i)
% %     [D1,fu_g,fv,gu,gv,m,FT_g]=retrieve_genotype_Dec18(gecko);
% %     [centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);
% %     percent_distance
% % end

 

    