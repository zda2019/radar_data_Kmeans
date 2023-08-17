% clear;
% close all
% clc;
% parpool(6)

[data,cluater]=generate_GMM(2000);

MDL=[];
tic;
[idx,C,sumd,D] = kmeans(data,1);
for K = 2:20
    newC = [C(1:end-1,:);C(end,:)-sqrt(sum(sumd)/10000);C(end,:)+sqrt(sum(sumd)/10000)];
    [idx,C,sumd,D] = kmeans(data,K,"Start",newC);
    MDL=[MDL;rand_index(cluater,idx,"adjusted")];
end
t1=toc;
figure;
plot(MDL,"LineStyle","-","LineWidth",2);
hold;


IMDL=[];
tic;
parfor K = 1:20
    [idx,C,sumd,D] = kmeans(data,K);
    IMDL=[IMDL;rand_index(cluater,idx,"adjusted")];
end
t2=toc;
% figure;
plot(IMDL,"LineStyle","--","LineWidth",2);
xlabel("clusters");
ylabel("rand index")

updata = t1/t2;%速度比

grid on
box on
legend('MDL','IMDL')




% 
% tic;
% parfor i= 1:10000000000
%     A= i;
% end
% t1=toc;
% 
% tic;
% for i= 1:10000000000
%     A= i;
% end
% t2=toc;



