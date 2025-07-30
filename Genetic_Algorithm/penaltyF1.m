% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [p]= penaltyF1(x1,x2,t,c,alpha,beta)
if (x1-2*(x2)+1==0) && (((x2)^2)-((x1)^2)/4-1<=0)
    p=0;
else
    p=((c*t)^alpha)*((abs(x1-2*(x2)+1)^beta)+(abs(((x2)^2)-((x1)^2)/4-1)^beta));
end
end