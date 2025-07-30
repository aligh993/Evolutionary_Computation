% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [Out] = F1(X)
T1 = -20*exp(-0.2*(sqrt(sum(X.^2,2)*1./size(X,2))));
T2 = exp(sum(cos(X*2*pi),2)*1./size(X,2));
Out = T1-T2+20+exp(1);