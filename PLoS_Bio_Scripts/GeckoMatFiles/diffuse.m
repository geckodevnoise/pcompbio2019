

function gecko=diffuse(gecko,h);

[x1,x2]=size(gecko);

gecko=(1-h)*gecko+h*[gecko(x1,:);gecko(1:(x1-1) ,:)];
%fraction diffuse down
gecko=(1-h)*gecko+h*[gecko(2:x1,:);gecko(1,:)];
%fraction diffuse right
gecko=(1-h)*gecko+h*[gecko(:,x2),gecko(:,1:(x2-1))];
%fraction diffuse left
gecko=(1-h)*gecko+h*[gecko(:,2:x2),gecko(:,1)];

%imagesc(gecko),axis xy
%generate_phenotypes_Feb23


function generate_phenotypes_Feb23(gecko,a,b);

[D1,fu,fv,gu,gv,m,threshold]=retrieve_genotype_Feb23(gecko);
for i=a:b
    [geckoA,geckoB]=RxnDiff_specifyALL(1,D1,fu,fv,gu,200000,3);
    if fix(gecko)==gecko
        cd(['gecko',num2str(gecko)])
        name=['gecko',num2str(gecko),'phenotype',num2str(1000+i),'.mat']
        save(name,'geckoA')
        cd ..
    else
        cd(['gecko',num2str(gecko*10)])
        name=['gecko',num2str(gecko*10),'phenotype',num2str(1000+i),'.mat']
        save(name,'geckoA')
        cd ..
    end
end



%This is the script for generating the time series.

%modified from generate_phenotypes_Feb23




function generate_phenotypes_Nov30_2018(gecko,a,b);



global geckoA
global geckoB
global TimeSteps

gecko=682;
gecko=735;
[D1,fu,fv,gu,gv,m,threshold]=retrieve_genotype_Feb23(gecko);
deltaT=1000;
for time=1:(600000/deltaT)
    if time==1
        [geckoA,geckoB]=RxnDiff_specifyALL(1,D1,fu,fv,gu,deltaT,3);
    else
        [geckoA,geckoB]=RxnDiff_specifyALL(0,D1,fu,fv,gu,deltaT,3);
    end
    cd(['TimeSeriesGecko',num2str(gecko)])
    name=['gecko',num2str(gecko),'phenotype',num2str(10000000+time*deltaT),'.mat']
    save(name,'geckoA')
    figure(3)
    name=['gecko',num2str(gecko),'phenotype',num2str(10000000+time*deltaT),'.jpg']
    print('-djpeg',name)
    cd ..
end




%this is the script
%used to make all the reaction diffusion 
%patterns for different parameter values

%%%%%%%%%%%%%%%%%%%%%%%
%%% generate phenotypes
%%%%%%%%%%%%%%%%%%%%%%%
%step 1: generate a bunch of phenotypes 
%for a genotype stored in retrieve_genotype.m
for gecko=850.5:1:854.5
a=1;
b=100;
gecko=gecko
generate_phenotypes_Feb23(gecko,a,b);
end











function [D1,fu,fv,gu,gv,m,FractionalThreshold]=retrieve_genotype_Feb23(gecko)


D1=0.5;
fv=0.8888;
gu=0.88;
gv=1;
m=0.0024;

genotypes=[     681	0.811	1.1951
                682	0.826	1.4157
                732	0.817	1.4747
                735 0.832   1.57
                772	0.818	1.1607
                773	0.815	1.622
                731	0.819	1.3033
                763	0.817	1.3133];

              
if find(genotypes==gecko)    
    [row,j,k]=find(genotypes==gecko);
    fu=genotypes(row,2);
    FractionalThreshold=genotypes(row,3);
else
    fu=gecko/1000;
    FractionalThreshold=1;
end
        


            


%this code saturates at a max rate of production
%for each morphogen

function [geckoA,geckoB]=RxnDiff_specifyALL(initialization,D1,fu,fv,gu,N,f)

x1=200;
x2=200;

global geckoA
global geckoB
global TimeSteps

%%%parameters
t=0.001;

gv=1;%without loss of generality..
%fu=0.25;%vary this another day

% % % %innermost line
% % % %given by fv*gu=k=gv*fu
% % % k=gv*fu;
% % % %outermost line 
% % % %given by fv*gu=k+delta=gv*fu+(2*fu-gv)^2/8
% % % delta=(2*fu-gv)^2/8
% % % %the parameter m picks a point in the interval [k,k+delta]
% % % m=[1:fix(x2/2),fix(x2/2):-1:1]/fix(x2/2)*delta;
% % % c=repmat(k+m,x1,1);%this defines the lines fv*gu=c
% % % 
% % % %where along the line fv*gu=c
% % % M=length;
% % % if M>0
% % %     fv=M*sqrt(c);
% % %     size(fv)
% % %     gu=1/M*sqrt(c);
% % % elseif M<0
% % %     gu=-M*sqrt(c);
% % %     fv=-1/M*sqrt(c);
% % % end

gu=gu;
fv=fv;

D1=D1*t;
D2=1.0*t;


d=D2/D1;


if initialization==1
    geckoA=rand(x1,x2);
    geckoB=rand(x1,x2);
    TimeSteps=0;
end

fu=fu*t;
fv=fv*t;
gu=gu*t;
gv=gv*t;

for timestep=1:N
    TimeSteps=TimeSteps+1;
    %%%diffusion
    geckoA=diffuse(geckoA,D1);
    geckoB=diffuse(geckoB,D2);
    %%%reaction NOT ALLOWING NEGATIVE CONCENTRATIONS
    geckoA=max(geckoA+fu*geckoA-fv.*geckoB,0);
    geckoB=max(geckoB+gu.*geckoA-gv*geckoB,0);

end
figure(f)
mu=mean(mean(geckoA));
sigma=std(mean(geckoA));
h=geckoA>(mu+sigma);
imagesc([h,h;h,h])

axis off
axis equal
axis xy
colormap bone
colormap(flipud(colormap))
title(['D1=',num2str(D1/t),', [fu,fv,gu,gv]=[',num2str(round(fu/t*10000)/10000),',',num2str(round(fv/t*100000)/100000),',',num2str(round(gu/t*100000)/100000),',',num2str(gv/t),'], ',num2str(TimeSteps),' Steps'])
