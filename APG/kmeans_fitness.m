function f = kmeans_fitness(x, data, num_clusters)
centers = reshape(x, num_clusters, 3);
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
        

