

%pick a genotype [fu_g,FT_g]
%and a gecko

%this function looks at the cloud of that genotype
%and determines how well the gecko fits in that cloud
%[centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);

%gecko 772
vary_fu_g=.810:.001:.828;
vary_FT_g=0.84:.02:1.3;
%gecko 735
vary_fu_g=.82:.001:.838;%needs more on the right
vary_FT_g=1.2:.05:1.8;
%gecko 682
vary_fu_g=.818:.001:.838;%needs more on the right
vary_FT_g=1.2:.02:1.5;
%gecko 731 and 763
vary_fu_g=.810:.001:.832;
vary_FT_g=1.100:.02:1.50;
%gecko 773
vary_fu_g=.810:.002:.824;%needs ore on the left
vary_FT_g=1.42:.01:1.77;


%for all geckos
fu_grid=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
FT_grid=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
distance_grid_b=zeros(size(vary_fu_g,2),size(vary_FT_g,2));
max_count=size(vary_fu_g,2)*size(vary_FT_g,2)
count=0;
for i=1:size(vary_fu_g,2)
    fu_g=vary_fu_g(i)
    for j=1:size(vary_FT_g,2)
        count=count+1
        FT_g=vary_FT_g(j)
        fu_grid(i,j)=fu_g;
        FT_grid(i,j)=FT_g;
        [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);
        distance_grid_b(i,j)=percent_distance;
    end
end

distance_grid=distance_grid_b';
fu_grid=fu_grid';
FT_grid=FT_grid';
save(['distance_grid_',num2str(gecko),'.mat'],'distance_grid')
save(['fu_grid_',num2str(gecko),'.mat'],'fu_grid')
save(['FT_grid_',num2str(gecko),'.mat'],'FT_grid')













% load(['distance_grid_',num2str(gecko),'.mat']);
% load(['fu_grid_',num2str(gecko),'.mat']);
% load(['FT_grid_',num2str(gecko),'.mat']);

% figure(9)
% hold off
% count=0;
% delta_fu=.001;
% delta_FT=.02;
% v=1;
% size_spots=5;
% a=1;
% pink=[255 150 150]/256;
% red=[255 0 0]/256;
% sky=[150 150 255]/256;
% blue=[0 0 195]/256;
% outer=99;
% inner=75;
% shape='o';
% for i=1:size(vary_fu_g,2)
%     fu=vary_fu_g(i);
%     for j=1:v:size(vary_FT_g,2)
%         count=count+1
%         ft=vary_FT_g(j)
%         Dfu=delta_fu*.5;
%         Dft=delta_FT*v*.5;
%         if distance_grid_731(j,i)<=inner
%             for k=1:num_spots
%                 scatter(fu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,red,shape,'filled')
%                 hold on
%                 scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,red,shape,'filled')
%             end
%             if distance_grid_763(j,i)>outer
%                 for k=1:num_spots
%                     scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,red,shape,'filled')
%                     hold on
%                     scatter(fu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,red,shape,'filled')
%                 end
%             end
%             
%         elseif distance_grid_731(j,i)<=outer
%             for k=1:num_spots
%                 scatter(fu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,pink,shape,'filled')
%                 hold on
%                 scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,pink,shape,'filled')
%             end
%             if distance_grid_763(j,i)>outer
%                 for k=1:num_spots
%                     scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,pink,shape,'filled')
%                     hold on
%                     scatter(fu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,pink,shape,'filled')
%                 end
%             end
%         end
%         if distance_grid_763(j,i)<=inner
%             for k=1:num_spots
%                 scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,blue,shape,'filled')
%                 hold on
%                 scatter(fu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,blue,shape,'filled')
%             end
%             if distance_grid_731(j,i)>outer
%                 for k=1:num_spots
%                     scatter(fu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,blue,shape,'filled')
%                     hold on
%                     scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,blue,shape,'filled')
%                 end
%             end
%             
%         elseif distance_grid_763(j,i)<=outer
%             for k=1:num_spots
%                 scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,sky,shape,'filled')
%                 hold on
%                 scatter(fu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,sky,shape,'filled')
%             end
%             if distance_grid_731(j,i)>outer
%                 for k=1:num_spots
%                     scatter(fu+Dfu*rand(1)*a,ft+Dft*rand(1)*a,size_spots,sky,shape,'filled')
%                     hold on
%                     scatter(fu+Dfu+Dfu*rand(1)*a,ft+Dft+Dft*rand(1)*a,size_spots,sky,shape,'filled')
%                 end
%             end
%         end
%     end
% end
% set(gca,'FontSize',22)
% xlim([.805,.83])
% ylim([1.1,1.5])
