% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [p]= penaltyF3(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,t,c,alpha,beta)

if (x2+2*x2+2*x3+x6+x10-2==0) && (x4+2*x5+x*6+x7-1==0) && (x3+x7+x8+2*x9+x10-1==0)
    p=0;
else
    p=((c*t)^alpha)*((abs(x2+2*x2+2*x3+x6+x10-2))^beta)+((abs(x4+2*x5+x6+x7-1))^beta+((abs(x3+x7+x8+2*x9+x10-1))^beta)) ;
end
end