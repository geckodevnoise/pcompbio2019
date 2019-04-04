function [ percentile_normalized,percentile_distancefct ] = find_percentile(EE, FA, gecko_k )
%% Finds the percentile of the data point (FA,EE) in the phenotype cloud
%% of gecko #gecko_k. E.g. outpout 0.1 means that (FA,EE)'s  is closer to the centroid
%% of the cloud than 10% of the points in the cloud
%% We have two computations based on different distance functions:
%% the first one is normalized EE FA values (z-scores based on the cloud)
%% the secondis the distance function used for optimization 
%% (EE-EE_gecko)^2.EE_gecko^2+(FA-FA_gecko)^2/FA_gecko^2

   load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
   gecko_id=gecko_data_pl_ss_ee_fa(gecko_k,5);
   
   
  if((gecko_id==763))
        dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter40'];
    else if((gecko_id==772)||(gecko_id==682)||(gecko_id==681)||(gecko_id==773))
            dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
        else if((gecko_id==731))
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
            else
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
            end
        end
    end
    
        
    load([dir '/optimal_stat.mat'],'ddlist','statslist');

    
    eegecko=gecko_data_pl_ss_ee_fa(gecko_k,3);
    fagecko=gecko_data_pl_ss_ee_fa(gecko_k,4);
    
    eelistnormal=zscore(statslist(:,3));
    falistnormal=zscore(statslist(:,4));
    
    FAnormal=(FA-mean(statslist(:,4)))/std(statslist(:,4));
    EEnormal=(EE-mean(statslist(:,3)))/std(statslist(:,3));

    
    distlistnormal=(eelistnormal).^2+(falistnormal).^2;
    distgeckonormal=EEnormal^2+FAnormal^2;
    
    percentile_normalized=sum(distlistnormal>distgeckonormal)/size(statslist(:,1),1);
    
    
    
    
    eelist=statslist(:,3);
    falist=statslist(:,4);
    eemean=mean(eelist);
    famean=mean(falist);
    
    distlist=(eelist-eemean).^2/eegecko^2+(falist-famean).^2/fagecko^2;
    distgecko=(EE-eemean)^2/eegecko^2+(FA-famean)^2/fagecko^2;
    
    percentile_distancefct=sum(distlist>distgecko)/size(statslist(:,1),1);
    
    


end

