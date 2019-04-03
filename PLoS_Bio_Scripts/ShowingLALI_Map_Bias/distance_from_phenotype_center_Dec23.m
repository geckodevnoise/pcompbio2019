
function [centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);

%first, find the center 
%of the phenotype cloud
%of the given genotype
fu_g=fu_g;
FT_g=FT_g;
a=1;b=100;
EE=[];
FA=[];
for number=a:b
    [PL,SS,EE(number),FA(number),FT]=draw_genotype_phenotype_Dec18(0,0,fu_g,FT_g,number);
end
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%here's the normalized center
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
centerEE=mean(EE);
centerFA=mean(FA);

if sum(EE<0)>0
    EE
    'EE negative'
    centerEE=0;
    centerFA=0;
    normalizedFA=0;
    normalizedEE=0;
    percent_distance=111;
else


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%here's the spatial distribution of the phenotypes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distances=[];
for number=a:b
    distances(number)=sqrt( (EE(number)-centerEE)^2 + (FA(number)-centerFA)^2);
end
distances=sort(distances,'ascend');
%size(distances);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% here's the photographed gecko location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks,normalizedFA,normalizedEE]=retrieve_natural_phenotypes_Dec24(gecko);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%how does the photographed gecko phenotype fit among those distances?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
natural_gecko_distance=sqrt( (normalizedEE-centerEE)^2 + (normalizedFA-centerFA)^2);
percent_distance=sum(distances<natural_gecko_distance);

end



