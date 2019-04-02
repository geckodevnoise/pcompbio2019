
function [EE,FA,centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);

%first, find the center 
%of the phenotype cloud
%of the given genotype
fu_g=fu_g;
FT_g=FT_g;
a=1;b=100;
EE=[];
FA=[];
normalizedEE=[];
normalizedFA=[];
for number=a:b
    [PL,SS,EE(number),FA(number),normalizedEE(number),normalizedFA(number),FT]=draw_genotype_phenotype_Apr19(0,0,fu_g,FT_g,number,gecko);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%here's the non-normalized and normalized center
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
centerEE=mean(EE);
centerFA=mean(FA);
normalizedcenterEE=mean(normalizedEE);
normalizedcenterFA=mean(normalizedFA);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%here's the spatial distribution of the phenotypes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distances=[];
for number=a:b
    distances(number)=sqrt( (normalizedEE(number)-normalizedcenterEE)^2 + (normalizedFA(number)-normalizedcenterFA)^2);
end
distances=sort(distances,'ascend');
%size(distances);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% here's the photographed gecko location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks,normalizedGeckoFA,normalizedGeckoEE]=retrieve_natural_phenotypes_Dec24(gecko);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%how does the photographed gecko phenotype fit among those distances?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
natural_gecko_distance=sqrt( (normalizedGeckoEE-normalizedcenterEE)^2 + (normalizedGeckoFA-normalizedcenterFA)^2);
percent_distance=sum(distances<natural_gecko_distance);




