% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function F=fitness(p,d,t,c,alpha,beta)

if d==2
    F=(p(1,1)-2)^2+(p(1,2)-1)^2+penalty(p,d,t,c,alpha,beta);
    
elseif d==5
    F=(5.3578547*(p(1,3)^2)+0.8356891*p(1,1).*p(1,5)+37.293239*p(1,1)-...
        40792.141)+penalty(p(1,:),d,t,c,alpha,beta);
    
elseif d==10
    C=[-6.089;-17.164;-34.054;-5.914;-24.721;-14.986;-24.100;-10.708;-26.662;-22.179];
    sumX=sum(p(1,1:10));
    X=log(p(1,1:10)./sumX);
    N=X';
    F=(p(1,1:10)*(C+N))+penalty(p(1,:),d,t,c,alpha,beta);
end
end