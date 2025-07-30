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
    d=5;      %   F1 --> 2   ||   F2 --> 5   ||   F3 --> 10
    pc=0.001;
    pm=0.05;
    landa=0.2;
    alpha=1;
    beta=3;
    c=0.001;
    
    pop=zeros(popsize,d+1);
    
    %     Function 1
    if d==2
        df=[0 2; 0 2];
        for i=1:popsize
            pop(i,1)=rand*(df(1,2)-df(1,1))+df(1,1);
            pop(i,2)=rand*(df(2,2)-df(2,1))+df(2,1);
            pop(i,3)=fitness(pop(i,1:2),d,0,c,alpha,beta);
        end
        
        %      Function 2
    elseif d==5
        df=[78 102; 33 45; 27 45; 27 45; 27 45];
        for i=1:popsize
            pop(i,1)=rand*(df(1,2)-df(1,1))+df(1,1);
            pop(i,2)=rand*(df(2,2)-df(2,1))+df(2,1);
            pop(i,3)=rand*(df(3,2)-df(3,1))+df(3,1);
            pop(i,4)=rand*(df(4,2)-df(4,1))+df(4,1);
            pop(i,5)=rand*(df(5,2)-df(5,1))+df(5,1);
            pop(i,6)=fitness(pop(i,1:5),d,0,c,alpha,beta);
        end
        
        %      Function 3
    elseif d==10
        df=[0.000001 2; 0.000001 2; 0.000001 2; 0.000001 2; 0.000001 2;
            0.000001 2; 0.000001 2; 0.000001 2; 0.000001 2; 0.000001 2];
        for i=1:popsize
            pop(i,1)=rand*(df(1,2)-df(1,1))+df(1,1);
            pop(i,2)=rand*(df(2,2)-df(2,1))+df(2,1);
            pop(i,3)=rand*(df(3,2)-df(3,1))+df(3,1);
            pop(i,4)=rand*(df(4,2)-df(4,1))+df(4,1);
            pop(i,5)=rand*(df(5,2)-df(5,1))+df(5,1);
            pop(i,6)=rand*(df(6,2)-df(6,1))+df(6,1);
            pop(i,7)=rand*(df(7,2)-df(7,1))+df(7,1);
            pop(i,8)=rand*(df(8,2)-df(8,1))+df(8,1);
            pop(i,9)=rand*(df(9,2)-df(9,1))+df(9,1);
            pop(i,10)=rand*(df(10,2)-df(10,1))+df(10,1);
            pop(i,11)=fitness(pop(i,1:10),d,0,c,alpha,beta);
        end
    end
    
    ncross=2*round((popsize*pc)/2);
    nmut=round(popsize*pm);
    crosspop=zeros(ncross,d+1);
    mutpop=zeros(nmut,d+1);
    
    [value,index]=min(pop(:,d+1));
    gpop=pop(index,1:d);
    BEST=zeros(maxgen,1);
    
    for gen=1:maxgen
        %Crossover
        crosspop=crossover(crosspop,pop,ncross,landa,d,i,c,alpha,beta);
        
        %Mutation
        mutpop=mutation(mutpop,pop,d,nmut,i,maxgen,popsize,c,alpha,beta);
        
        [pop]=[pop;crosspop;mutpop];
        
        [value,index]=sort(pop(:,d+1));
        pop=pop(index,:);
        gpop=pop(1,:);
        pop=pop(1:popsize,:);
        BEST(gen)=gpop(d+1);
    end
    
    disp(['------- ',num2str(R),' -------'])
    disp('The Best X is : ')
    disp(gpop(1:d))
    disp('The Best Fitness is : ')
    disp(gpop(d+1))
    toc
    
    TIME(R)=toc;
    VAL(R)=gpop(d+1);
    
    figure, plot(BEST,'r')
    xlabel('Generation'); ylabel('Fitness')
    legend('BEST'); title('Genetic Algorithm')
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