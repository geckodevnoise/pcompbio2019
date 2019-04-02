
%b is the number of phenotypes to look through
%usually 100;

function Figure_find_closest_phenotypes(gecko,nth_closest,b,f,Tilmann)


gecko=gecko;
n=nth_closest;
b=b;

%Gecko PL EE FA SS FL SS/PL
stats=[681.0000    0.0560    0.6480    0.3060    0.0400    0.2156    0.7200
  682.0000    0.0600    0.7720    0.2910    0.0440    0.2037    0.7300
  731.0000    0.0680    0.7240    0.3070    0.0470    0.2144    0.6900
  732.0000    0.0800    0.6930    0.2680    0.0500    0.2077    0.6200
  735.0000    0.0950    0.7680    0.2330    0.0510    0.2309    0.5400
  763.0000    0.0600    0.7000    0.2990    0.0440    0.1944    0.7400
  772.0000    0.0570    0.7200    0.3360    0.0460    0.1951    0.8200
  773.0000    0.1050    0.6710    0.2400    0.0590    0.2630    0.5600];
labels=stats(:,1);
i=find(labels==gecko)
centralFA=stats(i,4)
centralEE=stats(i,3)

setFA=[];
setEE=[];

for number=1:b
    if Tilmann==1
        [EE,FA]=stats_one_phenotype_cutTilmannPatterns_May24_2017(gecko,number,0);
    else
        [EE,FA]=stats_one_phenotype_cutgeckoA_May23_2017(gecko,number,0);
    end
    setFA(number)=FA;
    setEE(number)=EE;
end


% stdFA=std(setFA);
% stdEE=std(setEE);
% normedFA=(setFA-centralFA)/stdFA;
% normedEE=(setEE-centralEE)/stdEE;
%matching Tilmann's function
normedFA=(setFA-centralFA)/centralFA;
normedEE=(setEE-centralEE)/centralEE;

distances=sqrt(normedFA.^2+normedEE.^2);
sorted_distances=sort(distances);
nth_closest_pattern=find(distances==sorted_distances(n));

if Tilmann==1
        [EE,FA]=stats_one_phenotype_cutTilmannPatterns_May24_2017(gecko,nth_closest_pattern,8);
else
    [EE,FA]=stats_one_phenotype_cutgeckoA_May23_2017(gecko,nth_closest_pattern,8);
end
EE
FA

