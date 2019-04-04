global ss_array pl_array ee_array fa_array UU c1u DDD iniflag
%% generates m data points of patterns for each point in an nrho by nthresh array of points
%%% in genotype space
%%% The outputs are 2 nrho* nthresh by m+2 matrices
%%% EEmat and FA mat
%% where each row corresponds to a point in genotype (rho/threshold) space
%%% the first two entries in each row are rho and threshold;
%% the next 10 are the values for a run
iniflag=1;

m=20; %% # data points in each cloud


nthresh=400;
nrho=100;
threshmin=1.5;
threshmax=1.85;
rhomin=2.6;
rhomax=3.0;

deltathresh=(threshmax-threshmin)/(nthresh-1);
deltarho=(rhomax-rhomin)/(nrho-1);


optd=0.0194;
optR=0.0470;


EEmat=zeros(nthresh*nrho,m+2);
FAmat=zeros(nthresh*nrho,m+2);

for j=0:nrho-1
    optrho=rhomin+j*deltarho;
    
    disp(['running rho=' num2str(optrho) ' R=' num2str(optR) '  d=' num2str(optd)]);
    disp(' ');
    
    for sim_num=1:m
        
        fn(optrho,optR,optd);
        iniflag=0;
        endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
        GG=gridrepresentation(c1u*UU(endt,:)');
        
        for k=0:nthresh-1
            threshold=threshmin+k*deltathresh;
       
            [PL,SS,EE,FA]=pattern_stats(GG,threshold,0);
            
            EEmat(nthresh*j+k+1,1)=optrho;
            EEmat(nthresh*j+k+1,2)=threshold;
            EEmat(nthresh*j+k+1,sim_num+2)=EE;
            
            FAmat(nthresh*j+k+1,1)=optrho;
            FAmat(nthresh*j+k+1,2)=threshold;
            FAmat(nthresh*j+k+1,sim_num+2)=FA;
            
            
            
        end
        save(['genotype_cloud_data_june12.mat'],'EEmat','FAmat','nthresh','nrho','threshmin','threshmax','rhomin','rhomax','m','optd','optR');
        
    end
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
