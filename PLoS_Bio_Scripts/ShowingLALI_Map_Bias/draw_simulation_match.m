

function draw_simulation_match(gecko, number,f)
cd(['gecko',num2str(gecko)])
name=['gecko',num2str(gecko),'phenotype',num2str(1000+number),'.mat']
load(name)
cd ..
[D1,fu,fv,gu,gv,m,threshold]=retrieve_genotype_Dec18(gecko);
[PL,SS,EE,FA]=pattern_stats_Jan07_2017(geckoA,threshold,0);
%1/m pixels is one inch
%1/m/2.54 pixels is one centimeter
m=.003;
cm=1/m/2.54;
window_width=fix(cm*1.5);%number of pixels per 1.5 cm
q=67;
q=100;
geckoA=[geckoA(q:200,:);geckoA(1:(q-1),:)];
geckoA=[geckoA(:,q:200,:),geckoA(:,1:(q-1))];
window_width
size(geckoA)
window=geckoA(1:window_width,1:window_width);

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
MeanThreshold=mean(mean(geckoA));
window=(window<(threshold*MeanThreshold));
%the disk radius is given in natural gecko image pixels
%also it is actually the radius squared
%to convert this number of pixels into inches, divide by f_resize
disk_radius_inches=sqrt(radius)/f_resize;
%to convert this number of inches into pixels (simulation image)
%divide by m
disk_radius=sqrt(radius)/f_resize/m
cx=fix(window_width/2);
cy=cx;
for i=1:window_width
    for j=1:window_width
        if sqrt( (i-cx)^2 + (j-cy)^2 ) > disk_radius
            window(i,j)=3;
        end
    end
end
%rectangle('Position',[cx-cm,cy-cm,2*cm,2*cm])
%1/m pixels is one inch
%1/m/2.54 pixels is one centimeter
cm=1/m/2.54;
window(window_width-10:window_width-9,(window_width-fix(0.6*cm)):(window_width-fix(0.1*cm)))=0;
figure(f)
imagesc(window)
colormap gray
axis square
set(gca,'XTick',[])
set(gca,'YTick',[])