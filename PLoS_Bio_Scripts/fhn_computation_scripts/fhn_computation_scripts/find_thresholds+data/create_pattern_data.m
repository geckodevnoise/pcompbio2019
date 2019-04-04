global ss_array pl_array ee_array fa_array UU c1u DDD iniflag
%% generates 50 data points of patterns for each gecko


%array_dir=['arrays_25_25_1_aug29'];  %%% array containing pre-computed ss, pl, ee, fa as functions of rho, R, d 
%load([array_dir '/optimal_stat.mat'],'ee_array','fa_array','pl_array','ss_array','dlist','rholist','Rlist','threshlist');
load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');


for gecko=[2]
    gecko_id=gecko_data(gecko,4);
    ss_pl=gecko_data(gecko,1)*ones(size(ee_array));
    ee=gecko_data(gecko,2)*ones(size(ee_array));
    fa=gecko_data(gecko,3)*ones(size(ee_array)) ;
%     
%     dist_list=(ee_array-ee).^2./ee.^2+(fa_array-fa).^2./fa.^2;
%     
%     [M,I]=min(dist_list(:));
%     [i,j,k,l]=ind2sub([size(dist_list,1) size(dist_list,2) size(dist_list,3) size(dist_list,4)], I);
%  
%     optrho=rholist(i);
%     optR=Rlist(j);
%     optd=dlist(k);
    
    
   
%gecko_dir=[ num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
   
gecko_dir=[ num2str(gecko_id)];

load([gecko_dir '/optimization_results.mat'], 'optimal_param', 'inid','iniR','mindist','threshold');


optrho=optimal_param;
optR=iniR;
optd=inid;

    disp(['gecko ' num2str(gecko_id)]);
    disp(['SS/PL=' num2str(gecko_data(gecko,1)) '  EE=' num2str(gecko_data(gecko,2)) '   FA=' num2str(gecko_data(gecko,3))]);
  %  disp(['best fit SS/PL=' num2str(ss_array(i,j,k,l)/pl_array(i,j,k,l)) ' ee=' num2str(ee_array(i,j,k,l)) '  fa=' num2str(fa_array(i,j,k,l))]);
    disp(['best fit rho=' num2str(optrho) ' R=' num2str(optR) '  d=' num2str(optd)]);
    disp(' ');
    
    
    
    
    ss_pl_gecko=gecko_data(gecko,1);
    ee_gecko=gecko_data(gecko,2);
    fa_gecko=gecko_data(gecko,3);
    
    
    
%dir=[num2str(gecko_id) '_run_25_25_1_aug29'];
%mkdir(dir);


%[dd,threshold]=distance_characteristics_space(optrho,optR,optd, ss_pl_gecko,ee_gecko,fa_gecko);

%save([gecko_dir '/optimization_results.mat'], 'optimal_param', 'inid','iniR','threshold');



%%% make runs for checking statistics
statslist=[];
ddlist=[];


iniflag=1;
for j=201:1000
    
    fn(optrho,optR,optd);
    endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
    GG=gridrepresentation(c1u*UU(endt,:)');
    
    
   % mm=min(min(GG));
   % MM=max(max(GG));
    
   % threshold=mm+(threshid-1)*(MM-mm)/100;
    
    
    
    
    
    
    [PL,SS,EE,FA]=pattern_stats(GG,threshold,0);
    dd=(EE-ee_gecko)^2/ee_gecko^2+(FA-fa_gecko)^2/fa_gecko^2;
    
    ddlist=[ddlist; [dd,threshold]];
    statslist=[statslist; [PL,SS,EE,FA]];
    
    
    pattern=GG<=threshold;
    filename=[gecko_dir '/pattern' num2str(j) '.jpg'];
    imwrite(pattern,filename);   %% save image
    
    
end
save([gecko_dir '/optimal_stat.mat'],'ddlist','statslist');


    
    
    
    
    
    
end
    

%% 4 by 4 by 4 arrays
%% rho runs from 2.9 to 3.2
%% R runs from 0.40 to 0.43
%% d runs from 0.10 to 0.21
% 
% rholist=linspace(2.9,3.2,4);
% Rlist=linspace(0.04,0.043,4);
% dlist=linspace(0.019,0.021,4);
% 
% iniflag=1;
% 
% ss_array=zeros(4,4,4,3);
% pl_array=zeros(4,4,4,3);
% ee_array=zeros(4,4,4,3);
% fa_array=zeros(4,4,4,3);
% 
% %% all are arrays where the indices are rho,R,d according to the above list and the fourth index is the threshold (mean and mean+-0.25*(max-min)
% 
% dir=['arrays_4_4_4'];
% mkdir(dir)
% 
% for i=1:4
%     for j=1:4
%         for k=1:4
%             ee=zeros(3,1);
%             pl=zeros(3,1);
%             ss=zeros(3,1);
%             fa=zeros(3,1);
%             for run=1:3
%                 fn(rholist(i),Rlist(j),dlist(k));
%                 endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
%                 GG=gridrepresentation(c1u*UU(endt,:)');
%                 av=mean(mean(GG));
%                 m=min(min(GG));
%                 M=max(max(GG));
%                 for tt=1:3
%                     threshold=av+0.25*(tt-2)*(M-m);
%                 [PLt,SSt,EEt,FAt]=pattern_stats(GG,threshold,0);
%                 ee(tt)=ee(tt)+EEt;
%                 ss(tt)=ss(tt)+SSt;
%                 pl(tt)=pl(tt)+PLt;
%                 fa(tt)=fa(tt)+FAt;
%                 end
%             end
%             ss_array(i,j,k,:)=ss/3;
%             ee_array(i,j,k,:)=ee/3;
%             pl_array(i,j,k,:)=pl/3;
%             fa_array(i,j,k,:)=fa/3;
%             save([dir '/optimal_stat.mat'],'ee_array','fa_array','pl_array','ss_array','dlist','rholist','Rlist');
%         end
%     end
% end
% 
