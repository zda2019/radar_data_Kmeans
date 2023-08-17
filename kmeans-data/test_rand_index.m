%% Two arbitrary partitions
p1 = [1 2 3 3 2 1 1 3 3 1 2 2];
p2 = [3 2 3 2 2 1 1 2 3 1 3 1];

% Compute the unadjusted rand index
ri = rand_index(p1, p2);
assert(ri == 7/11);

% Compute the adjusted rand index
ari = rand_index(p1, p2, 'adjusted');
assert(ari == 1/12);

%% Two perfect partitions
p1 = [1 1 1];
p2 = [1 1 1];

% Compute the unadjusted rand index
ri = rand_index(p1, p2);
assert(ri == 1);

% Compute the adjusted rand index
ari = rand_index(p1, p2, 'adjusted');
assert(ari == 1);

%%
ari_result = rand_index(cluater',result','adjusted');
