
%this code saturates at a max rate of production
%for each morphogen

function [geckoA,geckoB]=RxnDiff_specifyALL(initialization,D1,fu,fv,gu,N,f)

x1=200;
x2=200;

global geckoA
global geckoB
global TimeSteps

%%%parameters
t=0.001;

gv=1;%without loss of generality..
%fu=0.25;%vary this another day

% % % %innermost line
% % % %given by fv*gu=k=gv*fu
% % % k=gv*fu;
% % % %outermost line 
% % % %given by fv*gu=k+delta=gv*fu+(2*fu-gv)^2/8
% % % delta=(2*fu-gv)^2/8
% % % %the parameter m picks a point in the interval [k,k+delta]
% % % m=[1:fix(x2/2),fix(x2/2):-1:1]/fix(x2/2)*delta;
% % % c=repmat(k+m,x1,1);%this defines the lines fv*gu=c
% % % 
% % % %where along the line fv*gu=c
% % % M=length;
% % % if M>0
% % %     fv=M*sqrt(c);
% % %     size(fv)
% % %     gu=1/M*sqrt(c);
% % % elseif M<0
% % %     gu=-M*sqrt(c);
% % %     fv=-1/M*sqrt(c);
% % % end

gu=gu;
fv=fv;

D1=D1*t;
D2=1.0*t;


d=D2/D1;


if initialization==1
    geckoA=rand(x1,x2);
    geckoB=rand(x1,x2);
    TimeSteps=0;
end

fu=fu*t;
fv=fv*t;
gu=gu*t;
gv=gv*t;

for timestep=1:N
    TimeSteps=TimeSteps+1;
    %%%diffusion
    geckoA=diffuse(geckoA,D1);
    geckoB=diffuse(geckoB,D2);
    %%%reaction NOT ALLOWING NEGATIVE CONCENTRATIONS
    geckoA=max(geckoA+fu*geckoA-fv.*geckoB,0);
    geckoB=max(geckoB+gu.*geckoA-gv*geckoB,0);

end
figure(f)
mu=mean(mean(geckoA));
sigma=std(mean(geckoA));
h=geckoA>(mu+sigma);
imagesc([h,h;h,h])

axis off
axis equal
axis xy
colormap bone
colormap(flipud(colormap))
title(['D1=',num2str(D1/t),', [fu,fv,gu,gv]=[',num2str(round(fu/t*10000)/10000),',',num2str(round(fv/t*100000)/100000),',',num2str(round(gu/t*100000)/100000),',',num2str(gv/t),'], ',num2str(TimeSteps),' Steps'])
