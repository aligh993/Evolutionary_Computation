% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [Out] = F3(X)
T1 = 1/4000*sum(X.^2,2);
I = 1:1:size(X,2);
T2 = -prod(cos (X./repmat(sqrt(I),size(X,1),1)),2)+1;
Out = T1+T2;