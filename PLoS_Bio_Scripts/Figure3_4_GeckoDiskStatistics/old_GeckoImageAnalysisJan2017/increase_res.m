

function [new_BGD]=increase_res(BGD,q);
%q=5;
[a,b]=size(BGD);
new_BGD=zeros(a*q,b*q);
for i=1:a
    for j=1:b
        s=q*(i-1)+1;
        t=q*(j-1)+1;
        new_BGD(s:s+q-1,t:t+q-1)=BGD(i,j)*ones(q,q);
    end
end