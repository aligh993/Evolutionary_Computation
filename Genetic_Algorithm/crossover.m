% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function crosspop=crossover(crosspop,pop,ncross,Landa,d,ngeneration,c,alpha,beta)

if d==2
    f=pop(:,3);
    f=max(f)-f+eps;
    f=f./sum(f);
    f=cumsum(f);
elseif d==5
    f=pop(:,6);
    f=max(f)-f+eps;
    f=f./sum(f);
    f=cumsum(f);
else
    f=pop(:,11);
    f=max(f)-f+eps;
    f=f./sum(f);
    f=cumsum(f);
end

if d==2
    for n=1:2:ncross
        i1=find(rand<=f,1,'first');
        i2=find(rand<=f,1,'first');
        p1=pop(i1,1:2);
        p2=pop(i2,1:2);
        x1=Landa .* p1+(1-Landa).*p2;
        x2=Landa .* p2+(1-Landa).*p1;
        crosspop(n,1:2)=x1;
        crosspop(n,3)=fitness(x1,d,ngeneration,c,alpha,beta);
        crosspop(n+1,1:2)=x2;
        crosspop(n+1,3)=fitness(x2,d,ngeneration,c,alpha,beta);
    end
    
elseif d==5  
    for n=1:2:ncross
        i1=find(rand<=f,1,'first');
        i2=find(rand<=f,1,'first');
        p1=pop(i1,1:5);
        p2=pop(i2,1:5);
        x1=Landa .* p1+(1-Landa).*p2;
        x2=Landa .* p2+(1-Landa).*p1;
        crosspop(n,1:5)=x1;
        crosspop(n,6)=fitness(x1,d,ngeneration,c,alpha,beta);
        crosspop(n+1,1:5)=x2;
        crosspop(n+1,6)=fitness(x2,d,ngeneration,c,alpha,beta);
    end
    
elseif d==10
    for n=1:2:ncross
        i1=find(rand<=f,1,'first');
        i2=find(rand<=f,1,'first');
        p1=pop(i1,1:10);
        p2=pop(i2,1:10);
        x1=Landa .* p1+(1-Landa).*p2;
        x2=Landa .* p2+(1-Landa).*p1;
        crosspop(n,1:10)=x1;
        crosspop(n,11)=fitness(x1,d,ngeneration,c,alpha,beta);
        crosspop(n+1,1:10)=x2;
        crosspop(n+1,11)=fitness(x2,d,ngeneration,c,alpha,beta);
    end   
end
end