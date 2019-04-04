
function [PL,SS,EE,FA]=pattern_stats(geckoA,threshold,f);

%threshold=mean(mean(geckoA))-(std(geckoA(geckoA>=0)));
binarization=geckoA>=threshold;
%binarization=bwconvhull(binarization,'objects');
positive_pattern=binarization;
total_area=sum(sum(binarization>=0));
negative_pattern=(binarization==0);


%%% Calculating Peak Length
peak_area=sum(sum(bwmorph(positive_pattern,'skel',inf)));
valley_area=sum(sum(bwmorph(negative_pattern,'skel',inf)));
peak_length=2*total_area/(peak_area+valley_area);
if f>0
figure(f)
imagesc(bwmorph(positive_pattern,'skel',inf)+bwmorph(negative_pattern,'skel',inf))
end
PL=peak_length;

%other statistics
b=positive_pattern;
s=regionprops(b,'EquivDiameter','Eccentricity');
spot_sizes=[s.EquivDiameter];
SS=mean([s.EquivDiameter]);
EE=mean([s.Eccentricity]);
FA=sum(sum(b==1))/sum(sum(b>=0));

%weed out non-patterns

if max(size([s.EquivDiameter]))<2
    PL=0;
    SS=0;
    EE=1000;
end
if max([s.EquivDiameter])>(size(geckoA,1)/2)
    PL=0;
    SS=0;
    EE=1000;
end