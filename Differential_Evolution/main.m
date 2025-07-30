% @author: ALI GHANBARI
% @email: alighanbari446@gmail.com

close all
clear
clc

VAL=zeros(1,10);
TIME=zeros(1,10);
for R=1:10
    tic
    
    maxgen=1000;
    popsize=50;
    d=2;      %   F1 --> 2   ||   F2 --> 5   ||   F3 --> 10
    bt=0.001;
    pr=0.2;
    alpha=0.01;
    beta=2;
    c=2;
    
    pop=zeros(popsize,d,1000);
    fit=zeros(popsize,1,1000);
    
    %     Function 1
    if d==2
        up=2; lw=0;
        for i=1:popsize
            pop(i,:,1)=rand(1,d).*(up-lw)+(lw);
            fit(i,1,1)=(pop(i,1,1)-2)^2+(pop(i,2,1)-1)^2+penalty(pop(i,:),d,1,c,alpha,beta);
        end
    end
    
    %     Function 2
    if d==5
        df=[78 102; 33 45; 27 45; 27 45; 27 45];
        for i=1:popsize
            pop(i,1,1)=rand*(df(1,2)-df(1,1))+df(1,1);
            pop(i,2,1)=rand*(df(2,2)-df(2,1))+df(2,1);
            pop(i,3,1)=rand*(df(3,2)-df(3,1))+df(3,1);
            pop(i,4,1)=rand*(df(4,2)-df(4,1))+df(4,1);
            pop(i,5,1)=rand*(df(5,2)-df(5,1))+df(5,1);
            fit(i,1,1)=(5.3578547*(pop(i,3,1)^2)+0.8356891*pop(i,1,1).*pop(i,5,1)+...
            37.293239*pop(i,1,1)-40792.141)+penalty(pop(i,:),d,1,c,alpha,beta);
        end
    end
    
    %     Function 3
    if d==10
        up=2; lw=0.000001;
        C=[-6.089;-17.164;-34.054;-5.914;-24.721;-14.986;-24.100;-10.708;-26.662;-22.179];
        for i=1:popsize
            pop(i,:,1)=rand(1,d).*(up-lw)+(lw);
            sumX=sum(pop(i,:,1));
            X=log(pop(i,:,1)./sumX);
            N=X';
            fit(i,1,1)=(pop(i,:,1)*(C+N))+penalty(pop(i,:),d,1,c,alpha,beta);
        end
    end
    
    [value,index]=min(fit(:,1,1));
    gpop=pop(index,:,1);
    fgpop=value;
    
    u=zeros(popsize,d);
    BEST=zeros(maxgen,1);
    BEST(1)=fgpop;
    
    newpop=zeros(popsize,d);
    newfit=zeros(popsize,1);
    
    for gen=2:maxgen
        for i=1:popsize
            Q=[1:i-1 i+1:popsize];
            S=randsample(Q,3);
            A=S(1);
            B=S(2);
            C=S(3);
            
            % Mutation
            u(i,:)=pop(A,:,gen-1)+bt.*(pop(B,:,gen-1)-pop(C,:,gen-1));
            
            % Crossover
            j1=randi([1 d]);
            j2=find(rand(1,d)<pr);
            J=[j1 j2];
            newpop(i,:)=pop(i,:,gen-1);
            newpop(i,J)=u(i,J);
            newfit(i,1)=fitness(newpop(i,:),d,gen,c,alpha,beta);
            
            if newfit(i,1)<fit(i,1,gen-1)
                pop(i,:,gen)=newpop(i,:);
                fit(i,1,gen)=newfit(i,1);
            else
                pop(i,:,gen)=pop(i,:,gen-1);
                fit(i,1,gen)=fit(i,1,gen-1);
            end
            if fit(i,1,gen)<fgpop
                gpop=newpop(i,:);
                fgpop=fit(i,1,gen);
            end
        end
        BEST(gen)=fgpop;
    end
    
    disp(['------- ',num2str(R),' -------'])
    disp('The Best X is : ')
    disp(gpop(1:end))
    disp('The Best Fitness is : ')
    disp(min(BEST))
    toc
    
    TIME(R)=toc;
    VAL(R)=min(BEST);
    
    figure, plot(BEST,'r')
    xlabel('Generation'); ylabel('Fitness')
    legend('BEST'); title('Differential Evolution')
end

disp('---------------------------')
disp('Mean: ')
disp(mean(VAL))
disp('Best: ')
disp(min(VAL))
disp('Worst: ')
disp(max(VAL))
disp('STD: ')
disp(std(VAL))
disp('Average Running Time: ')
disp(mean(TIME))