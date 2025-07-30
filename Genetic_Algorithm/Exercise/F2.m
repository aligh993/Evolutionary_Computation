% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [Out] = F2(X)
T1 = X.^2;
T2 = -10*cos(2*pi*X)+10;
Out = sum(T1+T2,2);