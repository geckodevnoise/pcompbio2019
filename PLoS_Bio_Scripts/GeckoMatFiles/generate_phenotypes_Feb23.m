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

