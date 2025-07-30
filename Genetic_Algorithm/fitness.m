% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function F=fitness(p,d,t,c1,alpha,beta)

if d==2
    F=(p(1)-2)^2+(p(2)-1)^2 + penaltyF1(p(1),p(2),t,c1,alpha,beta);

elseif d==5
    F=5.3578547*p(3)^2+0.8356891*p(1)*p(5)+37.293239*p(1)-40792.141 + penaltyF2(p(1),p(2),p(3),p(4),p(5),t,c1,alpha,beta);
    
elseif d==10
    C=[-6.089;-17.164;-34.054;-5.914;-24.721;-14.986;-24.100;-10.708;-26.662;-22.179];
    sumX=p(1)+p(2)+p(3)+p(4)+p(5)+p(6)+p(7)+p(8)+p(9)+p(10);
    X=log(p(:,1:10)./sumX);
    XT=X';
    X=C+XT;
    F=p(:,1:10)*X + penaltyF3(p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10),t,c1,alpha,beta);
end
end