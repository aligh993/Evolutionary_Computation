% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

clear all;
clc;
x=-10:0.5:10;
y=x;
% for i=1:length (x)
%     for j=1:length(y)
%         z(i,j)=cos(sqrt(x(i)^2+y(j)^2));
%     end
% end

[X,Y] = meshgrid(x,y);
in = [X(:), Y(:)];
out = F1(in);
Z = reshape(out, size(X));

surf(X,Y,Z);