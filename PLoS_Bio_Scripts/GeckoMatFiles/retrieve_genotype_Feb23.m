

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
        


            
