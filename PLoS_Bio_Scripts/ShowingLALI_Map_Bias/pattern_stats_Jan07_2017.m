%on Jan 7, 2017
%I tweaked the code just a bit
%to more reflect "raw" EE and FA values
%before I set extreme pattern cases to '0'
%if the spots were too small or too large

function [PL,SS,EE,FA,FT]=pattern_statsNov10(geckoA,threshold,f);

%threshold=mean(mean(geckoA))-(std(geckoA(geckoA>=0)));
FT=threshold/mean(mean(geckoA ));
binarization=(geckoA>=threshold);
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
%figure(101)
%imagesc(b)
FA=sum(sum(b==1))/sum(sum(b>=0));


% this part taken out 1/7/2017
%weed out non-patterns
% this part taken out 1/7/2017
% % if max(size([s.EquivDiameter]))<2
% %     'spots too small';
% %     PL=0;
% %     SS=0;
% %     EE=0;
% % end
% % if max([s.EquivDiameter])>(size(geckoA,1)/2)
% %     'spots too big';
% %     PL=0;
% %     SS=0;
% %     EE=0;
% % end