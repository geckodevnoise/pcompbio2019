%generate_phenotypes2
%I now run simulations for 4x longer 
%since the pattern looks less jagged
%for these parameters anyway 


function generate_phenotypes2(gecko,a,b);

[D1,fu,fv,gu,gv,m,threshold]=retrieve_genotype_Dec18(gecko);
for i=a:b
    [geckoA,geckoB]=RxnDiff_specifyALL(1,D1,fu,fv,gu,200000,3);
    name=['gecko',num2str(gecko),'phenotype',num2str(1000+i),'.mat']
    save(name,'geckoA')
end


% for i=1:100
%     gecko=735;
%     name=['gecko',num2str(gecko),'phenotype',num2str(1000+i),'.mat'];
%     load(name)
%     gecko=682;
%     name=['gecko',num2str(gecko),'phenotype',num2str(1000+i),'.mat']
%     save(name,'geckoA')
% end