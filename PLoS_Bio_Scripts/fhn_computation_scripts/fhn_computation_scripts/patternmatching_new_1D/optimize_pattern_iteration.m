function optimize_patterns_iteration(ss_pl,ee,fa,gecko_id);
global n m M deltax DDD
global maxx UU c1u c8u iniflag terminate_flag lastUU lastT

%% compute optimum through matlab's algorithm.
%% approach: First a starting point is determined through a previous run
%% 
iniflag=1;
tic
tolf=1e-4;  %%%%  error tolerances
tolx=1e-4;   %%%%  was -2
maxiter=60;


diaryfilename=['logfile_nmaxiter60_' num2str(gecko_id) '.txt'];
diary(diaryfilename);
diary on



%%% determine starting point from array of pre-computed values


if((gecko_id==681)||(gecko_id==763)||(gecko_id==772)||(gecko_id==773))
    previousdir=['732_TolFun0.0001_TolX0.0001_MaxIter20'];
else    
    previousdir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
end
load([previousdir '/optimization_results.mat'],'optimal_param','inid','mindist');
load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');



if(gecko_id==772)
    inirho=3.1764;
    iniR=0.046462;
else
    inirho=optimal_param(1);
    iniR=optimal_param(2);
end

    
    disp(['gecko ' num2str(gecko_id)]);
   
%%    disp(['SS/PL=' num2str(ss_pl) '  EE=' num2str(ee) '   FA=' num2str(fa)]);
%%    disp(['best fit SS/PL=' num2str(ss_array(i,j,k,l)/pl_array(i,j,k,l)) ' ee=' num2str(ee_array(i,j,k,l)) '  fa=' num2str(fa_array(i,j,k,l))]);
    disp(['initial data rho=' num2str(inirho) ' R=' num2str(iniR) '  d=' num2str(inid) ]);
    disp(['minimum distance=' num2str(mindist)]);
    disp(' ');
    


options = optimset('Display','iter','TolFun',tolf,'TolX', tolx,'MaxIter', maxiter);
%obj_fct=@(param) distance_characteristics_space_center_of_mass(param(1),param(2),param(3));
obj_fct=@(param) distance_characteristics_space(param(1),param(2),inid, ss_pl,ee,fa); %% we keep d constant=inid
[optimal_param,fval,exitflag,output] = fminsearch(obj_fct, [   inirho, iniR], options)
elapsed_time=toc

dir=[num2str(gecko_id) '_TolFun' num2str(tolf) '_TolX' num2str(tolx) '_MaxIter' num2str(maxiter)];
mkdir(dir);
save([dir '/optimization_results.mat'], 'optimal_param', 'inid','gecko_id','ss_pl', 'ee', 'fa');

param=optimal_param;
[mindist,threshold]=distance_characteristics_space(param(1),param(2),inid, ss_pl,ee,fa);

save([dir '/optimization_results.mat'], 'optimal_param', 'inid','mindist','threshold','ss_pl', 'ee', 'fa');
diary off
%%% make runs for checking statistics


