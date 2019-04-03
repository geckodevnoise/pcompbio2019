

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








