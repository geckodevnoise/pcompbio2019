global ss_array pl_array ee_array fa_array UU c1u DDD iniflag
%% generates NUMRUNS data points of patterns for each gecko

NUMRUNS=200;

iniflag=1;

load('optimal_param_list.mat');


for j=1:8
    gecko_id=optimal_param_list(j,1);
    rho=optimal_param_list(j,2);
    R=optimal_param_list(j,3);
    dd=optimal_param_list(j,4);
    threshold=optimal_param_list(j,5);
    
    gecko_dir=[ num2str(gecko_id)];
    if(exist(gecko_dir,'dir')~=7)
        mkdir(gecko_dir);
    end
        
        
        
        
        
        
        for k=1:NUMRUNS
            disp(['Gecko ' num2str(gecko_id) ', run ' num2str(k)]);
            fn(rho,R,dd);
            iniflag=0;
            endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
            GG=gridrepresentation(c1u*UU(endt,:)');
            
            pattern=GG<=threshold;
            filename=[gecko_dir '/' num2str(gecko_id) '_' num2str(k) '.jpg'];
            imwrite(pattern,filename);   %% save image
            save([gecko_dir '/' num2str(gecko_id) '_' num2str(k) '.m'], 'pattern');
            
        end
        
        
        
        
        
        
        
        
    end
    