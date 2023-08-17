% Grey Wolf Optimizer
function [Alpha_score,Alpha_pos,Convergence_curve]=GWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
% initialize alpha, beta, and delta_pos
Alpha_pos=zeros(1,dim);
Alpha_score=inf; %change this to -inf for maximization problems

Beta_pos=zeros(1,dim);
Beta_score=inf; %change this to -inf for maximization problems

Delta_pos=zeros(1,dim);
Delta_score=inf; %change this to -inf for maximization problems

%Initialize the positions of search agents
Positions=initialization(SearchAgents_no,dim,ub,lb);

Convergence_curve=zeros(1,Max_iter);
velocity = .3*randn(SearchAgents_no,dim) ;

pBestScore=inf(SearchAgents_no,1);
pBest=zeros(SearchAgents_no,dim);

w_max = 0.4;
w_min = 0.0;
w = 0.4;

l=0;% Loop counter

% Main loop
while l<Max_iter
    
    fitness_a = zeros(size(Positions,1));
    for i=1:size(Positions,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
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
    
    
    
    
    a=2-2*((l)/Max_iter)^2; % a decreases linearly fron 2 to 0
    
    % Update the Position of search agents including omegas
    for i=1:size(Positions,1)
            
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A1=2*a*r1-a; 
        C1=2*r2; 

        D_alpha=norm(C1*Alpha_pos-w*Positions(i,:)); % Equation (3.5)-part 1
        X1=Alpha_pos-A1*D_alpha; % Equation (3.6)-part 1

        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A2=2*a*r1-a; 
        C2=2*r2; 

        D_beta=norm(C2*Beta_pos-w*Positions(i,:)); % Equation (3.5)-part 2
        X2=Beta_pos-A2*D_beta; % Equation (3.6)-part 2
        
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]

        A3=2*a*r1-a; % Equation (3.3)
        C3=2*r2; % Equation (3.4)

        D_delta=abs(C3*Delta_pos-w*Positions(i,:)); % Equation (3.5)-part 3
        X3=Delta_pos-A3*D_delta; % Equation (3.5)-part 3
        
%         r1=rand(); % r1 is a random number in [0,1]
%         r2=rand(); % r2 is a random number in [0,1]
%         r3=rand(); % r3 is a random number in [0,1]
% 
%         % velocity updation
%         w = w_min +(w_max-w_min)*(l/Max_iter)^2;
%         velocity(i,:)=w*velocity(i,:)+C1*r1*(X1-Positions(i,:))+C2*r2*(X2-Positions(i,:))+C3*r3*(X3-Positions(i,:));
% 
%         % positions update
%         Positions(i,:)=Positions(i,:)+velocity(i,:);
        
        
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        r3=rand(); % r3 is a random number in [0,1]
        

        c1=0.5+2*exp(-(4*l/Max_iter)^2);
        c2=2.2-2*exp(-(4*l/Max_iter)^2); 
        w=w_max-l*((w_max-w_min)/Max_iter);
        velocity(i,:)=w*velocity(i,:)+c1*rand()*(pBest(i,:)-Positions(i,:))+c2*rand()*(Alpha_pos-Positions(i,:));
        
        if fobj(Positions(i,:)+velocity(i,:))<fobj((X1+X2+X3)/3)
            Positions(i,:)=Positions(i,:)+velocity(i,:);
        else
            if l/Max_iter>rand()
                Positions(i,:)=Positions(i,:)+velocity(i,:);
            else
                Positions(i,:)=(X1+X2+X3)/3;
            end
%             Positions(i,:)=(X1+X2+X3)/3;
        end

    end
    
    l=l+1;
    Convergence_curve(l)=Alpha_score;
end
