global ss_array pl_array ee_array fa_array UU c1u DDD iniflag
%% determines mean concentration values for each gecko based on 10 runs and save them in the corresponding directories


%array_dir=['arrays_25_25_1_aug29'];  %%% array containing pre-computed ss, pl, ee, fa as functions of rho, R, d 
%load([array_dir '/optimal_stat.mat'],'ee_array','fa_array','pl_array','ss_array','dlist','rholist','Rlist','threshlist');
load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');

iniflag=1;

for gecko=3
    gecko_id=gecko_data(gecko,4);
    ss_pl=gecko_data(gecko,1)*ones(size(ee_array));
    ee=gecko_data(gecko,2)*ones(size(ee_array));
    fa=gecko_data(gecko,3)*ones(size(ee_array));

    
    
   
  if((gecko_id==763))
        dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter40'];
    else if((gecko_id==772)||(gecko_id==682)||(gecko_id==681)||(gecko_id==773))
            dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
        else if((gecko_id==731))
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter50'];
            else
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
            end
        end
    end
        

load([dir '/optimization_results.mat'], 'optimal_param', 'inid','iniR','mindist','threshold');


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
    
    
%%% make runs for checking statistics
meanlist=[];
for j=1:10
    
    fn(optrho,optR,optd);
    endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
    GG=gridrepresentation(c1u*UU(endt,:)');
    mm=mean(GG(:));
    
    meanlist=[meanlist; mm];
    
end

mm=mean(meanlist);


save([dir '/mean_concentrations.mat'],'mm');


    
    
    
    
    
    
end
    