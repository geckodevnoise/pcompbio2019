
%Peak Length is calculated on the Convex Hull of the image
%SS and PL are given in inches

function [PL,SS,EE,FA]=pattern_stats_GeckoBinary_May11_2017(gecko,f);
cd ..
cd('CropGeckoPictures')
cd BinaryDiskMatFiles
switch gecko

    case 681
        load('gecko681_4stats_213x3PPI.mat')
        load('gecko681_4stats_213x3PPI_ROI.mat')
        f_resize=213*3;
    case 682
        load('gecko682_4stats_204x3PPI.mat')
        load('gecko682_4stats_204x3PPI_ROI.mat') 
        f_resize=204*3;
	case 731
        load('gecko731_4stats_200x3PPI.mat')
        load('gecko731_4stats_200x3PPI_ROI.mat')
        f_resize=200*3;
    case 732
        load('gecko732_4stats_200x3PPI.mat')  
        load('gecko732_4stats_200x3PPI_ROI.mat') 
        f_resize=200*3;
    case 735
        load('gecko735_4stats_207x3PPI.mat') 
        load('gecko735_4stats_207x3PPI_ROI.mat') 
        f_resize=207*3;
    case 763
        load('gecko763_4stats_211x3PPI.mat')  
        load('gecko763_4stats_211x3PPI_ROI.mat')  
        f_resize=211*3;
    case 772
        load('gecko772_4stats_209x3PPI.mat')
        load('gecko772_4stats_209x3PPI_ROI.mat')
        f_resize=209*3;        
    case 773
        load('gecko773_4stats_210x3PPI.mat')
        load('gecko773_4stats_210x3PPI_ROI.mat')
        f_resize=210*3;
end
cd ..
cd ..
cd Figure3_4_GeckoDiskStatistics

%image now stored as 'binary_image'
%fill holes again
binary_image=imfill(binary_image==1,'holes');
%image now stored as 'binarization'
binarization=binary_image;

%image now stored as 'positive_pattern'
positive_pattern=binarization;
negative_pattern=(binarization==0);
total_area=sum(sum( binarization>=0));

positive_pattern=binarization.*binary_imageROI;
negative_pattern=(binarization==0).*binary_imageROI;
total_area=sum(sum( (binarization>=0).*binary_imageROI ));

%%% Calculating Peak Length on Convex Hull
positive_patternConvexHull=bwconvhull(positive_pattern,'objects');
peak_area=sum(sum(  bwmorph(positive_patternConvexHull,'skel',inf).*binary_imageROI   ));
negative_patternConvexHull=(positive_patternConvexHull==0);
valley_area=sum(sum(  bwmorph(negative_patternConvexHull,'skel',inf).*binary_imageROI  ));
peak_length=2*total_area/(peak_area+valley_area);
if f>0
figure(f)
imagesc(bwmorph(positive_patternConvexHull,'skel',inf).*binary_imageROI+bwmorph(negative_patternConvexHull,'skel',inf).*binary_imageROI)
figure(f+1)
end
PL=peak_length;

%other statistics
b=positive_pattern;
imagesc(-b)
axis off
axis square

%figure(101)
%imagesc(b)
FA=sum(sum(b==1))/sum(sum(binary_imageROI==1));


% % %added on May 19th 2017 lets see what happens
% % %nope, no good because selectively cuts out long spots :(
% % %remove spots cut off at the edge
% % spots=b+(binary_imageROI==0); %this makes edge a large spot
% % spots=imclearborder(spots);%now remove that big border spot
% % b=spots;



s=regionprops(b==1,'EquivDiameter','Eccentricity');
spot_sizes=[s.EquivDiameter];
SS=mean([s.EquivDiameter]);
EE=mean([s.Eccentricity]);

%weed out non-patterns

if max(size([s.EquivDiameter]))<2
    'spots too small'
    PL=0;
    SS=0;
    EE=0;
end

geckoA=binary_image;
if max([s.EquivDiameter])>(size(geckoA,1)/2)
    'spots too big'
    PL=0;
    SS=0;
    EE=0;
end

PL=PL/f_resize;%final measurement output is in inches!!!
SS=SS/f_resize;%final measurement output is in inches!!!