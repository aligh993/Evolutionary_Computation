% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

function mutpop=mutation(mutpop,pop,d,nmut,ngeneration,maxgen,popsize,c,alpha,beta)
r=unifrnd(-1,1);
ub=0;
lb=0;

if d==2
    ub=2;
    lb=0;
    for n=1:nmut
        i=randi([1 popsize]);
        p=pop(i,1:2);
        j=randi([1 d]);
        dlt=delta(ngeneration,p(j),ub,lb,r,maxgen);
        if (r>=0)
            p(j)=p(j)+dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        else
            p(j)=p(j)-dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        end
        mutpop(n,1:2)=p;
        mutpop(n,3)=fitness(p,d,ngeneration,c,alpha,beta);
    end
    
elseif d==5
    for n=1:nmut
        i=randi([1 popsize]);
        p=pop(i,1:d);
        j=randi([1 d]);
        if (j==1)
            ub=102;
            lb=78;
        elseif (j==2)
            ub=45;
            lb=33;
        elseif (j==3)||(j==4)||(j==5)
            ub=45;
            lb=27;
        end
        dlt=delta(ngeneration,p(j),ub,lb,r,maxgen);
        if (r>=0)
            p(j)=p(j)+dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        else
            p(j)=p(j)-dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        end
        mutpop(n,1:5)=p;
        mutpop(n,6)=fitness(p,d,ngeneration,c,alpha,beta);
    end
    
elseif d==10
    ub=2;
    lb=0.000001;
    for n=1:nmut
        i=randi([1 popsize]);
        p=pop(i,1:10);
        j=randi([1 d]);
        dlt=delta(ngeneration,p(j),ub,lb,r,maxgen);
        if (r>=0)
            p(j)=p(j)+dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        else
            p(j)=p(j)-dlt;
            p=[p(1:j-1) p(j) p(j+1:d)];
        end
        mutpop(n,1:10)=p;
        mutpop(n,11)=fitness(p,d,ngeneration,c,alpha,beta);
    end
end
end