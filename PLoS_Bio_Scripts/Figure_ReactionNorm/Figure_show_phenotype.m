
%b is the number of phenotypes to look through
%usually 100;

function Figure_show_phenotype(gecko,n,f,Tilmann)

if Tilmann==1
    [EE,FA]=stats_one_phenotype_cutTilmannPatterns_May24_2017(gecko,n,f);
else
    [EE,FA]=stats_one_phenotype_cutgeckoA_May23_2017(gecko,n,f);
end
