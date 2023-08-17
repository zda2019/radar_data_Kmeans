% data = [1,2,3;4,5,6;7,8,9];
% fid = fopen("data.txt",'w');
% [hang,lie] = size(data);
% for i = 1:hang
%     for j = 1:lie
%         fprintf(fid,"%d,",data(i,j));
%     end
%     fprintf(fid,'\n');
% end

[data,cluater]=generate_GMM(500);
fid = fopen("data.txt",'w');
[hang,lie] = size(data);
for i = 1:hang
    for j = 1:lie
        fprintf(fid,"%d,",data(i,j));
    end
    fprintf(fid,'\n');
end

result = load("data_result.txt");

idx = kmeans(data,5);

%%
[data,cluater]=Copy_of_generate_GMM(500);
fid = fopen("data.txt",'w');
[hang,lie] = size(data);
for i = 1:hang
    for j = 1:lie
        fprintf(fid,"%d,",data(i,j));
    end
    fprintf(fid,'\n');
end

result = load("data_result.txt");

idx = kmeans(data,4);
figure();
scatter(data(idx == 1, 1),data(idx == 1,2),'r','Marker','+');
hold on;
scatter(data(idx == 2, 1),data(idx == 2,2),'g','Marker','*');
hold on;
scatter(data(idx == 3, 1),data(idx == 3,2),'b','Marker','o');
hold on;
scatter(data(idx == 4, 1),data(idx == 4,2),'cyan','Marker','x');
% hold on;
% scatter(data(idx == 5, 1),data(idx == 5,2),'black','Marker','.');

