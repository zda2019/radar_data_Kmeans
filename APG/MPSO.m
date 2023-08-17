%  Autonomous Groups Particles Swarm Optimization (AGPSO) source codes version 1.1   %
%                                                                                    %
%  Developed in MATLAB R2014a(7.13)                                                  %
%                                                                                    %
%  Author and programmer: Seyedali Mirjalili                                         %
%                                                                                    %
%         e-Mail: ali.mirjalili@gmail.com                                            %
%                 seyedali.mirjalili@griffithuni.edu.au                              %
%                                                                                    %
%       Homepage: http://www.alimirjalili.com                                        %
%                                                                                    %
%   Main paper: S. Mirjalili, A. Lewis, A. Safa Sadiq                                %
%               Autonomous Particles Groups for Particle Swarm Optimization          %
%               Arab J Sci Eng,  Volume 39, Issue 6, pp 4683-4697,                   %
%               http://dx.doi.org/10.1007/s13369-014-1156-x                          %
%                                                                                    %

function [gBestScore,gBest,cg_curve]=MPSO(N,Max_iteration,lb,ub,dim,fobj)

wMax=0.9;
wMin=0.4;
c1=2;
c2=2;

vel=zeros(N,dim);
pos=initialization(N,dim,ub,lb);
pBestScore=zeros(N);
pBest=zeros(N,dim);
gBestScore=0;
gBest=zeros(1,dim);

%Initialization
% for i=1:size(pos,1) 
%     for j=1:size(pos,2) 
%         pos(i,j)=(ub(j)-lb(j))*rand()+lb(j);
%         vel(i,j)=0.3*rand();
%     end
% end
for i=1:N
    pBestScore(i)=inf;
end

%initialize gBestScore for min
gBestScore=inf;
     
    
for l=1:Max_iteration
    %Calculate Score Function
    for i=1:size(pos,1)  
        fitness=0;
        Tp=pos(i,:)>ub;Tm=pos(i,:)<lb;pos(i,:)=(pos(i,:).*(~(Tp+Tm)))+ub.*Tp+lb.*Tm;                   
                   
        fitness=fobj(pos(i,:));
       
        if(pBestScore(i)>fitness)
            pBestScore(i)=fitness;
            pBest(i,:)=pos(i,:);
        end
        if(gBestScore>fitness)
            gBestScore=fitness;
            gBest=pos(i,:);
        end
    end

    c1=(-2.05/Max_iteration)*l+2.55;
    c2=(1/Max_iteration)*l+1.25;    
    
    %update the W of PSO
    w=wMax-l*((wMax-wMin)/Max_iteration);
    
    %Update the Velocity and Position of particles
    for i=1:size(pos,1)
        for j=1:size(pos,2)       
            vel(i,j)=w*vel(i,j)+c1*rand()*(pBest(i,j)-pos(i,j))+c2*rand()*(gBest(j)-pos(i,j));
            pos(i,j)=pos(i,j)+vel(i,j);
        end
    end
    cg_curve(l)=gBestScore;
end

end

