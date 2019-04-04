function optimize_patterns(ss_pl,ee,fa,gecko_id);
global n m M deltax DDD
global maxx UU c1u c8u iniflag terminate_flag lastUU lastT

%% compute optimum through matlab's algorithm.
%% approach: First a starting point is determined through the pre-computed arrays in arraydir
%% 
iniflag=1;
tic
tolf=1e-4;  %%%%  error tolerances
tolx=1e-4;   %%%%  was -2
maxiter=35;


diaryfilename=['logfile_' num2str(gecko_id) '50it.txt'];
diary(diaryfilename);
diary on



%%% determine starting point from array of pre-computed values
% 
% arraydir=['U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\new method - minimize fa ee only\arrays_25_25_1_aug29'];
% load([arraydir '/optimal_stat.mat'],'ee_array','fa_array','pl_array','ss_array','dlist','rholist','Rlist','threshlist');
% load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
% 
% 
%     
%     dist_list=(ee_array-ee).^2/ee.^2+(fa_array-fa).^2./fa^2;
%     %dist_list=(ee_array-ee).^2+(fa_array-fa).^2;
%     
%     [M,I]=min(dist_list(:));
%     [i,j,k,l]=ind2sub([size(dist_list,1) size(dist_list,2) size(dist_list,3) size(dist_list,4)], I);
%  
%     inirho=rholist(i);
%     iniR=0.047;
%     inid=dlist(k);
%     inithresh=threshlist(i,j,k,l);
%     
%     
%     if(gecko_id==772)
%         inirho=2.8;
%     end
%     
%     if(gecko_id==682)
%         inirho=3.2525;
%     end
%     
%     if(gecko_id==731)
%         inirho=2.8;
%     end
%     
%     if(gecko_id==681)
%         inirho=2.67;
%     end
%     
%     if(gecko_id==773)
%         inirho=2.67;
%     end 
    
    

    
% %     if ((gecko_id==681))
% %         previousdir=['763_TolFun0.0001_TolX0.0001_MaxIter20'];
% %         load([previousdir '/optimization_results.mat'],'optimal_param','iniR','inid');
% %         inirho=optimal_param;
% %     end
%     
%     if ((gecko_id==773))
%         previousdir=['732_TolFun0.0001_TolX0.0001_MaxIter20'];
%         load([previousdir '/optimization_results.mat'],'optimal_param','iniR','inid');
%         inirho=optimal_param;
%     end




initialvaluedir=['..\patternmatching_new_1D - recalculate thresholds\' num2str(gecko_id)];
 load([initialvaluedir '/optimization_results.mat'],'optimal_param','iniR','inid');
inirho=optimal_param;


    
    disp(['gecko ' num2str(gecko_id)]);
    disp(['SS/PL=' num2str(ss_pl) '  EE=' num2str(ee) '   FA=' num2str(fa)]);
 %   disp(['best fit SS/PL=' num2str(ss_array(i,j,k,l)/pl_array(i,j,k,l)) ' ee=' num2str(ee_array(i,j,k,l)) '  fa=' num2str(fa_array(i,j,k,l))]);
    disp(['initial data rho=' num2str(inirho) ' R=' num2str(iniR) '  d=' num2str(inid) ]);
%    disp(['minimum distance=' num2str(M)]);
    disp(' ');
    


options = optimset('Display','iter','TolFun',tolf,'TolX', tolx,'MaxIter', maxiter);
%obj_fct=@(param) distance_characteristics_space(param,iniR,inid, ss_pl,ee,fa); %% we keep d constant=inid
obj_fct=@(param) optimal_threshold(param,iniR,inid, ss_pl,ee,fa); %% we keep d constant=inid and use a new way to compute the distance: instad of optimizing the thresold for each run and hen average over the thresholds,
%we find the optimal threshold for several runs simulataneously.
%Hopefully, this'll make results more stable.
[optimal_param,fval,exitflag,output] = fminsearch(obj_fct, [   inirho], options)





elapsed_time=toc

dir=[num2str(gecko_id)];
mkdir(dir);
save([dir '/optimization_results.mat'], 'optimal_param','iniR', 'inid','gecko_id','ss_pl', 'ee', 'fa');

param=optimal_param;
[mindist,threshold]=distance_characteristics_space(param,iniR,inid, ss_pl,ee,fa);

save([dir '/optimization_results.mat'], 'optimal_param', 'inid','iniR','mindist','threshold','ss_pl', 'ee', 'fa');
diary off
%%% make runs for checking statistics


