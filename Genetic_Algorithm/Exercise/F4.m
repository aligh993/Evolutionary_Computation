% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function [Out] = F4(X)
Out = sum(cumsum(X,2).^2,2);