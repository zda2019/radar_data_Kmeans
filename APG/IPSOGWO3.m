% Grey Wolf Optimizer

%改进点：1、增加Logistic映射初始化
%       2、对非领头粒子进行一定概率的变异
%       3、非线性w




function [Alpha_score,Alpha_pos,Convergence_curve]=IPSOGWO3(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
% initialize alpha, beta, and delta_pos
Alpha_pos=zeros(1,dim);
Alpha_score=inf; %change this to -inf for maximization problems

Beta_pos=zeros(1,dim);
Beta_score=inf; %change this to -inf for maximization problems

Delta_pos=zeros(1,dim);
Delta_score=inf; %change this to -inf for maximization problems

%Initialize the positions of search agents
% Positions=initialization(SearchAgents_no,dim,ub,lb);

%————————————————————————————————
%tent初始化
% 设置混沌映射的参数
a = 1.9;
x0 = 0.1;

% 初始化种群
n = SearchAgents_no; % 种群数量
% dim = dim; % 每个个体的维度
Positions = zeros(n, dim); % 初始化种群矩阵
x = x0; % 初始值

id_m=zeros(n,1);

% 使用Tent混沌映射生成随机数初始化种群
for i = 1:n
    for j = 1:dim
        x = a * x * (1 - x);
        Positions(i, j) = x*(ub-lb)+lb;
    end
end
% for i = 1:n
%     for j = 1:dim
%         x = a * x * (1 - x);
%         Positions(i, j) = x*(ub(j)-lb(j))+lb(j);
%     end
% end
%——————————————————————————————


Convergence_curve=zeros(1,Max_iter);
velocity = 1.3*randn(n,dim) ;

pBestScore=inf(n,1);
pBest=zeros(n,dim);



w_max = 0.9;
w_min = 0.4;
w = 0.1;

l=0;% Loop counter

% Main loop
while l<Max_iter
    
    %更新alpha、beta、delta
    fitness_a = zeros(size(Positions,1));
    for i=1:size(Positions,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+(ub-rand()*(ub-lb)).*Flag4ub+(lb+rand()*(ub-lb)).*Flag4lb;%%边界优化
        
        % Calculate objective function for each search agent
        fitness_a(i)=fobj(Positions(i,:));
        
        fitness=fitness_a(i);
        
        if fitness<pBestScore(i)
            pBestScore(i)=fitness;
            pBest(i,:)=Positions(i,:);
        end

        % Update Alpha, Beta, and Delta
        if fitness<Alpha_score
            Alpha_score=fitness; % Update alpha
            Alpha_pos=Positions(i,:);
            if id_m(i)==0
                id_m(i)=1;
            end
        end
        
        if fitness>Alpha_score && fitness<Beta_score
            Beta_score=fitness; % Update beta
            Beta_pos=Positions(i,:);
        end
        
        if fitness>Alpha_score && fitness>Beta_score && fitness<Delta_score
            Delta_score=fitness; % Update delta
            Delta_pos=Positions(i,:);
        end
    end
    
    
    disp(sum(id_m));
    %粒子变异，引入更多随机性，对非最优的所有粒子赋予可能性进行变异
    for i=1:size(Positions,1)
        if fitness_a(i)>Alpha_score&&fitness_a(i)>Beta_score&&fitness_a(i)>Delta_score
            new_p=(Alpha_pos+2*(rand()-1/2)*Positions(i,:))/2;
            if(fobj(new_p)<fitness_a(i))
                Positions(i,:) = new_p;
            end
        end
    end
%     &&rand()/4<l/Max_iter
    
    
    
%     a=2-2*(l/Max_iter)^2; % a decreases linearly fron 2 to 0
    a=2-2*exp(l/Max_iter); % a decreases linearly fron 2 to 0
    
    % Update the Position of search agents including omegas
    for i=1:size(Positions,1)
        
%         w = exp(-abs(fitness_a(i))/abs(Alpha_score));
            
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A1=2*a*r1-a; 
        C1=2*r2; 
        C1=1;

        D_alpha=norm(C1*Alpha_pos-w*Positions(i,:)); % Equation (3.5)-part 1
        X1=Alpha_pos-A1*D_alpha; % Equation (3.6)-part 1


        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A2=2*a*r1-a; 
        C2=2*r2; 
        C2=1;

        D_beta=norm(C2*Beta_pos-w*Positions(i,:)); % Equation (3.5)-part 2
        X2=Beta_pos-A2*D_beta; % Equation (3.6)-part 2

        
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]

        A3=2*a*r1-a; % Equation (3.3)
        C3=2*r2; % Equation (3.4)
        C3=1;

        D_delta=norm(C3*Delta_pos-w*Positions(i,:)); % Equation (3.5)-part 3
        X3=Delta_pos-A3*D_delta; % Equation (3.5)-part 3

        
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        r3=rand(); % r3 is a random number in [0,1]
        

        c2=0.5+2*exp(-(4*l/Max_iter)^2);
        c1=2.2-2*exp(-(4*l/Max_iter)^2); 
        w=w_max-l*((w_max-w_min)/Max_iter);
        
%         w = exp(-pBestScore(i)/Alpha_score);
%         c1 = 2*exp(-l/Max_iter);
%         c2 = exp(l/Max_iter);
        velocity(i,:)=w*velocity(i,:)+c1*rand(1,dim).*(pBest(i,:)-Positions(i,:))+c2*rand(1,dim).*(Alpha_pos-Positions(i,:));
        
        
        if id_m(i)==1&&(i/Max_iter)^2<rand()
%             velocity(i,:)=w*velocity(i,:)+c1*rand(1,dim).*(pBest(i,:)-Positions(i,:))+c2*rand(1,dim).*(Alpha_pos-Positions(i,:));
            Positions(i,:)=Positions(i,:)+velocity(i,:);
           
        else
           
%             Positions(i,:)=Positions(i,:)+w*velocity(i,:)+C1*r1*(X1-Positions(i,:))+C2*r2*(X2-Positions(i,:))+C3*r3*(X3-Positions(i,:));
%             velocity(i,:)=w*velocity(i,:)+c1*rand(1,dim).*(pBest(i,:)-Positions(i,:))+c2*rand(1,dim).*(Alpha_pos-Positions(i,:));
            Positions(i,:)=(X1+X2+X3)/3;
        end

    end
    
    l=l+1;
    Convergence_curve(l)=Alpha_score;
end
