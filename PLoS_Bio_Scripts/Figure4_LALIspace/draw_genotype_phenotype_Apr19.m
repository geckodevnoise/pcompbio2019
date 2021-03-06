
%given the genotype [fu,FT]
%this finds the nth generated phenotype (number)
%and finds the normalized FA and EE

function [PL,SS,EE,FA,normalizedEE,normalizedFA,FT]=draw_genotype_phenotype_Apr19(c,f,fu,FractionalThreshold,number,gecko);

D1=0.5;
fv=0.8888;
gu=0.88;
gv=1;
m=0.0024;

cd ../GeckoMatFiles
if abs(fix(fu*1000)-(fu*1000))<0.01
    cd(['gecko',num2str(fu*1000)])
    name=['gecko',num2str(fu*1000),'phenotype',num2str(1000+number),'.mat'];
    load(name)
else
    cd(['gecko',num2str(fu*10000)])
    name=['gecko',num2str(fu*10000),'phenotype',num2str(1000+number),'.mat'];
    load(name)
end


cd ../../Figure4_LALIspace
MeanThreshold=mean(mean(geckoA));
%[PL,SS,EE,FA]=pattern_stats(geckoA,FractionalThreshold*MeanThreshold,0);
[PL,SS,EE,FA,FT]=pattern_statsNov10(geckoA,FractionalThreshold*MeanThreshold,7);

PL=PL*m;
SS=SS*m;%SS transformed from pixels to centimeters (inches! 6/20) 
SP=SS/PL;



%[PL,SS,EE,FA]
[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(0,0);

x=EE;
y=FA;
f=0;
if f~=0
figure(f)
end
if c~=0
    scatter(Xm*(x-Xmax)+1,Ym*(y-Ymax)+1,[],c,'filled')
end
normalizedX=Xm*(x-Xmax)+1;
normalizedY=Ym*(y-Ymax)+1;

normalizedEE=normalizedX;
normalizedFA=normalizedY;

