% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function dlt=delta(ngeneration,selectedGenforMut,maxX,minX,random,maxGen)
r=rand();
if (random>=0)
    dlt=(maxX-selectedGenforMut)*r*(1-(ngeneration/maxGen));
elseif (random<0)
    dlt=(selectedGenforMut-maxX)*r*(1-(ngeneration/maxGen));
end
end