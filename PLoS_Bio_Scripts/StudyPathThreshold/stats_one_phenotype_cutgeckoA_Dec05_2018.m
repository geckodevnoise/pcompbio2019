%modified on 12/14 so the spatial scale wouldn't change over time

%on 09/08/2017 I modified things so that the border is cleared
%before calculating eccentricity
%and then I debated and took it out..

function [EE,FA]=stats_one_phenotype_cutgeckoA_Dec05_2018(gecko,number,f,threshold_scale)

k=threshold_scale;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%diameter ratio to cut the disk to size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%what we need from the original gecko image is
%what was the ratio of the cut disk radius
%to the average disk size SS?
gecko_labels=[681   682   731   732   735   763   772   773];
all_diameter_ratios=[9.7188    9.0424    7.4520    7.8963    6.2501    9.1057   11.1543    6.0119];
diameter_ratio=all_diameter_ratios(find(gecko_labels==gecko));
% % %this is how the diameters were found
% % [PL,SS,EE,FA,diameter_ratio]=pattern_stats_GeckoBinary_May18_2017(gecko,0);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%retrieve the simulated phenotype pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../GeckoMatFiles
[D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Feb23(gecko);
cd(['gecko',num2str(fu*1000)])
name=['gecko',num2str(fu*1000),'phenotype',num2str(1000+51),'.mat'];
load(name)
baseline_geckoA=geckoA;
name=['gecko',num2str(fu*1000),'phenotype',num2str(1000+number),'.mat'];
load(name)

cd ../../StudyPathThreshold


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%and cut the simulated phenotype pattern to size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%first, find SS for the basline image
baseline_MeanThreshold=mean(mean(baseline_geckoA));
%find the average spot size 
baseline_FTMT=baseline_MeanThreshold*FT;%modified 12/5/2018
[PL,SS,EE2,FA,FT2]=pattern_statsNov10(baseline_geckoA,baseline_FTMT,7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


MeanThreshold=mean(mean(geckoA));
%find the average spot size 
FTMT=MeanThreshold*FT*k;%modified 12/5/2018
[PL,SS2,EE,FA,FT]=pattern_statsNov10(geckoA,FTMT,7);

%and cut the disk to the right size
cut_diameter=SS*diameter_ratio
radius=ceil(cut_diameter/2);
disk_template=strel('disk',radius,8);
disk=disk_template.Neighborhood;
[m,n]=size(disk);
cut_geckoA=geckoA(1:m,1:n).*disk;
cut_geckoA=(cut_geckoA>(FTMT));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate EE and FA from it
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FA=sum(sum(cut_geckoA))/sum(sum(disk));
%other statistics
b=cut_geckoA;
%just didn't work out, see e-mail dated May 19th to Tilmann
% % % %remove spots cut off at the edge
% % % spots=cut_geckoA+(disk==0); %this makes edge a large spot
% % % spots=imclearborder(spots);%now remove that big border spot
% % % b=spots;
%b=imclearborder(b);%added 09/08/2017
s=regionprops(b==1,'EquivDiameter','Eccentricity');
spot_sizes=[s.EquivDiameter];
SS=mean([s.EquivDiameter]);
EE=mean([s.Eccentricity]);



if f>0
    %gecko_disk=cut_geckoA;
    %ROI=disk;
    gecko_labels=[681   682   731   732   735   763   772   773];
    all_diameters =[0.9898    1.0334    0.9017    1.0033    0.8221    1.0232    1.3004    0.8830];
    diameter_cm=all_diameters(find(gecko_labels==gecko));
    [m,n]=size(cut_geckoA);
    diameter_pixels=m;
    cm_per_pixel=diameter_cm/diameter_pixels;
    
    %window must be 1.5 x 1.5 cm
    win_radius=floor(.75/cm_per_pixel)
    window=zeros(2*win_radius+1,2*win_radius+1);
    a=win_radius-ceil(m/2)
    b=a+m-1;
    gray=(disk.*(cut_geckoA==0));
    cut_geckoA=cut_geckoA+0.2*gray;
    window(a:b,a:b)=cut_geckoA;
    
    %add scale bar
    m=size(window);
    a=m(1,1);
    b=m(1,2);
    window(a-9:a-8,(b-fix(0.6/cm_per_pixel)):(b-fix(0.1/cm_per_pixel)))=1;
    figure(f)
    imagesc(-window)
    colormap gray
    axis square
    set(gca,'YTick',[])
    set(gca,'XTick',[])
    box on
    set(gca, 'LooseInset', [0,0,0,0]);
    %tomorrow need to figure outhow to add the half centimeter bar
end

figure(44)
imagesc(-cut_geckoA)
axis square
axis off
colormap gray
    axis square
    set(gca,'YTick',[])
    set(gca,'XTick',[])
    box on
    set(gca, 'LooseInset', [0,0,0,0]);
