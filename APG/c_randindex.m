function randindex = c_randindex(pos,data,num_clusters,id)


%修改参数形状
centers = reshape(pos, num_clusters, []);
[idx, ~,~] = kmeans(data, num_clusters, 'Start', centers);

randindex = rand_index(id, idx, 'adjusted');



end

