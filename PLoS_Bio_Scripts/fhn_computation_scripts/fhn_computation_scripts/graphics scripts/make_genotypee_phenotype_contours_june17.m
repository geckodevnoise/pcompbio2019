%%  The matrix mean_EE_FA
%% is an M by 4 matrix:
%% columns:  rho threshold  mean EE   mean FA
%%
%% produced with make_genotypoe_phenotype_contours.m

slope=0.30;
maxthresh=1.79; %% 1.79
minthresh=1.52;

inputfile=['mean_EE_FA_june13.mat'];

load(inputfile,'mean_EE_FA');

figure
scatter3(mean_EE_FA(:,1), mean_EE_FA(:,2),mean_EE_FA(:,3));




RHO=2.6:0.001:3.4;
THRESH= minthresh:0.001:2.3;

rhogridindices=1:100:size(RHO,2);
threshgridindices=1:50:round((maxthresh-minthresh)/0.001);

maxthreshgridindex=max(threshgridindices);
maxrhogridindex=max(rhogridindices);

[RHOgrid,THRESHgrid]=meshgrid(RHO, THRESH);
EEinterp=griddata(mean_EE_FA(:,1),mean_EE_FA(:,2),mean_EE_FA(:,3),RHOgrid,THRESHgrid, 'cubic');
FAinterp=griddata(mean_EE_FA(:,1),mean_EE_FA(:,2),mean_EE_FA(:,4),RHOgrid,THRESHgrid, 'cubic');


figure
subplot(1,2,1)
surf(RHOgrid,THRESHgrid,EEinterp);
title('EE');
subplot(1,2,2)
surf(RHOgrid,THRESHgrid,FAinterp);
title('FA');


% 
% n=100;
% h = ones(n,n) / n^2;
% 
% EEinterp=imfilter(EEinterp,h);
% FAinterp=imfilter(FAinterp,h);
% 
% N=50;
% sigma=20;
%  [x y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
%  f=exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2));
%  f=f./sum(f(:));
% 
% EEinterp=conv2(EEinterp,f,'same');
% FAinterp=conv2(FAinterp,f,'same');

EEinterp=imgaussfilt(EEinterp,40);
FAinterp=imgaussfilt(FAinterp,40);

%EEinterp=interp2(mean_EE_FA(:,1),mean_EE_FA(:,2),mean_EE_FA(:,3),RHOgrid,THRESHgrid);
%FAinterp=interp2(mean_EE_FA(:,1),mean_EE_FA(:,2),mean_EE_FA(:,4),RHOgrid,THRESHgrid);



figure
subplot(1,2,1)
surf(RHOgrid,THRESHgrid,EEinterp);
title('EE');
subplot(1,2,2)
surf(RHOgrid,THRESHgrid,FAinterp);
title('FA');


figure
subplot(1,2,1)
contour(RHOgrid,THRESHgrid,EEinterp);
title('EE');
subplot(1,2,2)
contour(RHOgrid,THRESHgrid,FAinterp);
title('FA');


slope_threshindices=round(slope*(1:size(RHO,2)));
slope_rhoindices=round(1/slope*(1:size(THRESH,2)));


figure
subplot(1,2,1)
hold on
for i=threshgridindices
    shifted_thresh_indices=i+slope_threshindices;
    index=sub2ind(size(RHOgrid),shifted_thresh_indices, 1:size(RHO,2));
    line(RHOgrid(index),THRESHgrid(index), 'Color', 'r', 'Linewidth',2);
    %plot(RHOgrid(index),threshsmooth, 'Color', 'r', 'Linewidth',2);
end
for j=rhogridindices
    shifted_rho_indices=j+slope_rhoindices;
    real_maxthresh=THRESH(threshgridindices(size(threshgridindices,2)));
    real_minthresh=THRESH(threshgridindices(1));
    maxthreshindex=round(1+(real_maxthresh-real_minthresh)/0.001);
    index=sub2ind(size(RHOgrid), slope_threshindices(j)+(1:maxthreshindex),j*ones(1,maxthreshindex));
    line(RHOgrid(index),THRESHgrid(index), 'Linewidth',2);   
end
% 
% lastEE=[RHOgrid(maxthreshgridindex+slope_threshindices(maxrhogridindices),maxrhogridindex); RHOgrid(maxthreshgridindex+slope_threshindices(maxrhogridindices-100),maxrhogridindex-100)];
% lastFA=[THRESHgrid(maxthreshgridindex+slope_threshindices(maxrhogridindices),maxrhogridindex); THRESHgrid(maxthreshgridindex+slope_threshindices(maxrhogridindices-100),maxrhogridindex-100)];
% line(lastEE,lastFA,'Color','g');


load('optimal_param_list.mat');

scatter(optimal_param_list(:,2), optimal_param_list(:,5),30,'filled', 'black');

    
       
for j=1:8
 
    %% statslist=[statslist; [PL,SS,EE,FA]];
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
  title(['Genotype space']);
  
  gecko_id=optimal_param_list(j,1);
  rho=optimal_param_list(j,2);
  thresh=optimal_param_list(j,5);      
  
  if(gecko_id==773)
      
      t=text(0.98*rho,1.009*thresh,num2str(gecko_id));
      t.FontSize=15;
      t.Color=[0.1 0 0];
  else
      if(gecko_id==732)
          
          t=text(1.002*rho,0.99*thresh,num2str(gecko_id));
          t.FontSize=15;
          t.Color=[0.1 0 0];
          scatter(optimal_param_list(4,2), optimal_param_list(4,5),10, [0.1 0 0], 'filled');
      else
          if(gecko_id==763)
              
              t=text(1.001*rho,1.009*thresh,num2str(gecko_id));
              t.FontSize=15;
              t.Color=[0.1 0 0];
              
          else
              t=text(1.002*rho,0.999*thresh,num2str(gecko_id));
              t.FontSize=15;
              t.Color=[0.1 0 0];
          end
      end
  end
end

    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('threshold concentration (absolute)');
    


subplot(1,2,2)
hold on
for i=threshgridindices
      shifted_thresh_indices=i+slope_threshindices;
    index=sub2ind(size(RHOgrid),shifted_thresh_indices, 1:size(RHO,2));
      eep=linspace(min(EEinterp(index)),max(EEinterp(index)),29);
      eep2=linspace(min(EEinterp(index)),max(EEinterp(index)),17);
%    
%     smoothed=polyfit(EEinterp(index)',FAinterp(index)',6);
%     fasmooth=polyval(smoothed,RHOgrid(index)');
%     plot(EEinterp(index)',fasmooth, 'Color','r', 'Linewidth',2);
%       
      
    fap=spline(EEinterp(index),FAinterp(index),eep);
    fap2=spline(EEinterp(index),FAinterp(index),eep2);
%     smoothed=polyfit(eep,fap,5);
%     fasmooth=polyval(smoothed,eep);
%     plot(eep,fasmooth, 'Color','r', 'Linewidth',2);
   % line(eep,fap, 'Color','r', 'Linewidth',2);
    line(eep2,fap2, 'Color','r', 'Linewidth',2);
end


  smoothed=polyfit(RHOgrid(index)',THRESHgrid(index)',4);
    threshsmooth=polyval(smoothed,RHOgrid(index)');

lastEE=[EEinterp(maxthreshgridindex+slope_threshindices(maxrhogridindex)-3,maxrhogridindex); EEinterp(maxthreshgridindex+slope_threshindices(maxrhogridindex-100)-2,maxrhogridindex-100)];
lastFA=[FAinterp(maxthreshgridindex+slope_threshindices(maxrhogridindex)-3,maxrhogridindex); FAinterp(maxthreshgridindex+slope_threshindices(maxrhogridindex-100)-2,maxrhogridindex-100)];
line(lastEE,lastFA,'Color','r', 'Linewidth',2);

for j=rhogridindices
    
    shifted_rho_indices=j+slope_rhoindices;
    real_maxthresh=THRESH(threshgridindices(size(threshgridindices,2)));
    real_minthresh=THRESH(threshgridindices(1));
    maxthreshindex=round(1+(real_maxthresh-real_minthresh)/0.001);
    index=sub2ind(size(RHOgrid), slope_threshindices(j)+(1:maxthreshindex),j*ones(1,maxthreshindex));
   line(EEinterp(index),FAinterp(index), 'Linewidth',2);
end
load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
%load('optimal_param_list.mat');
   scatter(gecko_data(:,2), gecko_data(:,3),30,'black','filled');
    
    for i = 1:8
        
        % Label the points with the index
        
        t=text(1.01*gecko_data(i,2),0.99*gecko_data(i,3),num2str(gecko_data(i,4)));
           t.FontSize=15;
              t.Color=[0.1 0 0];
        
    end
    
        xlabel('EE');
    ylabel('FA');
      title(['Phenotype space']);
  
