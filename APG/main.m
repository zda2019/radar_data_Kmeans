%产生3维数据
clear;close all;clc;
rng(1); % set random seed for reproducibility
num_clusters = 20;
num_points = 400;
data = zeros(num_points, 3);
id = zeros(num_points,1);

for i = 1:num_clusters
    mu = 5*rand(1,3);
    sigma = rand(1);
    cluster_data = bsxfun(@plus, sigma * randn(num_points/num_clusters, 3), mu);
    data((i-1)*num_points/num_clusters+1:i*num_points/num_clusters,:) = cluster_data;
    id((i-1)*num_points/num_clusters+1:i*num_points/num_clusters,:)=repmat(i,num_points/num_clusters,1);
end

%聚类指标
ARI = rand_index(id, id, 'adjusted');
%可视化
figure;
scatter3(data(:,1), data(:,2), data(:,3), 10, id, 'filled');

%规定上下限，维度，优化函数
lb = min(min(data));
ub = max(max(data));
dim = 3* num_clusters;
fobj = @(x)kmeans_fitness(x, data, num_clusters);

kmeans_RI = rand_index(kmeans(data,num_clusters), id, 'adjusted');

%%
SearchAgents_no=30; % 粒子数
% Function_name='F3'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
Max_iteration=5000; % 最大迭代次数

% Load details of the selected benchmark function
% [lb,ub,dim,fobj]=Get_Functions_details(Function_name);

% [Best_score,Best_pos,PSOGWO_cg_curve]=PSOGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
disp('1');
tic
[Alpha_score,Alpha_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
t_GWO = toc;
disp('2');
tic
[Pso_score,Pso_pos,PSO_cg_curve]=PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
t_PSO = toc;
% disp('3');
% [IPso_score,IPso_pos,IPSO_cg_curve]=IPSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% disp('4');
% [MPso_score,MPso_pos,MPSO_cg_curve]=MPSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% disp('5');
% tic
% [TACPso_score,TACPso_pos,TACPSO_cg_curve]=TACPSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% t_TACPSO = toc;
% disp('6');
% [IPSOGWO1_score,IPSOGWO1_pos,IPSOGWO1_cg_curve]=IPSOGWO1(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% disp('7'); 
% [IPSOGWO2_score,IPSOGWO2_pos,IPSOGWO2_cg_curve]=IPSOGWO2(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
disp('8');
tic
[IPSOGWO3_score,IPSOGWO3_pos,IPSOGWO3_cg_curve]=IPSOGWO3(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
t_IPSOGWO3 = toc;
% disp('9');
% [IPSOGWO4_score,IPSOGWO4_pos,IPSOGWO4_cg_curve]=IPSOGWO4(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% disp('10');
% tic;
% [DMCPSO_score,DMCPSO_pos,DMCPSO_cg_curve]=DMCPSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
% t_DMCPSO=toc;

% disp('11');

% t = [t_GWO, t_PSO, t_TACPSO, t_IPSOGWO3, t_DMCPSO];
t = [t_GWO, t_PSO, t_IPSOGWO3];

%%
% figure('Position',[500 500 660 290])
%Draw search space
% subplot(1,2,1);
% func_plot(Function_name);
% title('Parameter space')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
% subplot(1,2,2);
figure();
% semilogy(PSOGWO_cg_curve,'Color','r')
% hold on
semilogy(GWO_cg_curve,'Color','b','LineStyle','-.','LineWidth',1.5)
hold on
semilogy(PSO_cg_curve,'Color','g','LineStyle','--','LineWidth',1.5)
hold on
% semilogy(IPSO_cg_curve,'Color','c')
% hold on
% semilogy(MPSO_cg_curve,'Color','m')
% hold on
% semilogy(TACPSO_cg_curve,'Color','y')
% hold on
% semilogy(IPSOGWO1_cg_curve,'Color','#111')
% hold on
% semilogy(IPSOGWO2_cg_curve,'Color','#857')
% hold on
semilogy(IPSOGWO3_cg_curve,'Color','r','LineWidth',1.5)
hold on
% semilogy(IPSOGWO4_cg_curve,'Color','#336')
% hold on
% semilogy(DMCPSO_cg_curve,'Color','#AAA')
% title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
% legend('GWO','PSO','TACPSO','IPSOGWO3','DMCPSO')
legend('GWO','PSO','APG')
% legend('GWO','PSO')
% legend('GWO','PSO','TACPSO','IPSOGWO1','IPSOGWO3','DMCPSO')
% legend('PSOGWO','GWO','PSO','IPSO','MPSO','TACPSO','IPSOGWO3','IPSOGWO4')
% legend('PSOGWO','GWO','PSO','IPSO','MPSO','TACPSO','IPSOGWO1','IPSOGWO2','IPSOGWO3','IPSOGWO4')
% legend('GWO','PSO')

% display(['The best solution obtained by PSOGWO is : ', num2str(Best_pos)]);
% display(['The best optimal value of the objective funciton found by PSOGWO is : ', num2str(Best_score)]);
% display(['The best solution obtained by GWO is : ', num2str(Alpha_pos)]);
% display(['The best optimal value of the objective funciton found by GWO is : ', num2str(Alpha_score)]);
%%
% function f = kmeans_fitness(x, data, num_clusters)
% centers = reshape(x, num_clusters, 3);
% [~, ~,sumd] = kmeans(data, num_clusters, 'Start', centers,'MaxIter',0);
% % [~, ~,sumd] = kmeans(data, num_clusters, 'Start', centers);
% f = sum(sumd);
% end
%%
%聚类效果
GWO_RI = c_randindex(Alpha_pos, data, num_clusters, id);
PSO_RI = c_randindex(Pso_pos, data, num_clusters, id);
TACPSO_RI = c_randindex(TACPso_pos, data, num_clusters, id);
% IPSOGWO1_RI = c_randindex(IPSOGWO1_pos, data, num_clusters, id);
IPSOGWO3_RI = c_randindex(IPSOGWO3_pos, data, num_clusters, id);
DMCPSO_RI = c_randindex(DMCPSO_pos, data, num_clusters, id);
figure;
% bar([GWO_RI,PSO_RI,TACPSO_RI,IPSOGWO1_RI,IPSOGWO3_RI,DMCPSO_RI]);
bar([kmeans_RI,GWO_RI,PSO_RI,TACPSO_RI,IPSOGWO3_RI,DMCPSO_RI]);


%%
function f = kmeans_fitness(x, data, num_clusters)
centers = reshape(x, num_clusters, []);
sumd =zeros(size(data,1), 1);
idx = zeros(size(data,1),1);
for i=1:size(data,1)
    sumd_e = zeros(num_clusters,1);
    for j=1:num_clusters
        sumd_e(j) = norm(data(i,:)-centers(j,:));
    end
    [sumd(i),idx(i)] = min(sumd_e);
end
f = sum(sumd);
end
        
