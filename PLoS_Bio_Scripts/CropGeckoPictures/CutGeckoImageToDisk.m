
%this takes the largest disk 
%fitting within the gecko head
%and cuts it accordingly:

%1. using the cut images
%2. recreate disk ROI



%%% gecko
%%% 681, 682, 731, 732, 735, 763, 772, 773
%%%
function [gecko_disk,ROI,f_resize]=CutGeckoImageToDisk(gecko)

switch gecko
    
    case 681
        uncut_image='u681_w9_213.jpg';
        cut_image='c681_w9_213.jpg';
        f_rot=171.4;
        f_resize=213;
        Rx=135; Ry=89; radius=1717;
    case 682
        uncut_image='u682_w9_204.jpg';
        cut_image='c682_w9_204.jpg';
        f_rot=-25.2;
        f_resize=204;
        Rx=109; Ry=109; radius=1665;
	case 731
        uncut_image='u731_w9_200.jpg';
        cut_image='c731_w9_200.jpg';
        f_rot=-22.4;
        f_resize=200;
        Rx=70; Ry=176; radius=1237;
    case 732
        uncut_image='u732_w9_200.jpg';
        cut_image='c732_w9_200.jpg';
        f_rot=119.9;
        f_resize=200;
        Rx=124; Ry=95; radius=1553;
    case 735
        uncut_image='u735_w9_207.jpg';
        cut_image='c735_w9_207.jpg';
        f_rot=10.9;
        f_resize=207;
        Rx=110; Ry=166; radius=1089;
    case 763
        uncut_image='u763_w9_211.jpg';
        cut_image='c763_w9_211.jpg';
        f_rot=-5.1;
        f_resize=211;
        Rx=85; Ry=126; radius=1825;
    case 772
        uncut_image='u772_w9_209.jpg';
        cut_image='c772_w9_209.jpg';
        f_rot=-65.5;
        f_resize=209;
        Rx=100; Ry=96; radius=2925;        
    case 773
        uncut_image='u773_w9_210.jpg';
        cut_image='c773_w9_210.jpg';
        f_rot=-1.1;
        f_resize=210;
        Rx=89; Ry=198; radius=1370;
end


%1. Using cut image
cd OriginalGeckoImages 
gecko_image=imread(cut_image);
cd ..
gecko_image=gecko_image(:,:,1);


%2. RECREATING ROI
distances=zeros(size(gecko_image));
for i=1:size(gecko_image,1)
    for j=1:size(gecko_image,2)  
        distances(i,j)=(i-Rx)^2+(j-Ry)^2;
    end
end
ROI=(distances<radius);
%gecko_disk=double(gecko_image).*ROI;
gecko_disk=(gecko_image);


