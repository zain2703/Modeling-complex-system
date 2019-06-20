clear all
n = 100; % initial number of websites
www = ones(n,1); % initial world wide web with each site having a self link - 
                %array value stores the number of in-links to each site           

m = 5; % number of site to which a newly created site links to
p = 0.6; %probability of choosing a site at random
T = 10000; %Number of days for which new sites of created - one new site each day - following rules of linking to other sites

selfLinks = ones(n+T,1);
network = diag(selfLinks);

for t=1:100
    
    prob = rand; % generate random probability for every day
    if prob < p
        randomPermutation = randperm(n+t-1); %random permutation of number between 1 to n
        sitesChosenToLink = randomPermutation(1:m); % choose first m integers and create an array
        for i=1:m
            network(n+t, sitesChosenToLink(i)) = 1;
         %   www(sitesChosenToLink(i)) = www(sitesChosenToLink(i)) + 1; % increase the number of in-links to the chosen sites by 1 
        end
    else
        outlinksVector = sum(network,1);
        outlinks = outlinksVector(1:n+t);
        totalWeight = sum(outlinks);
        randomPermutation = randperm(totalWeight); %random permutation of number between 1 to total sum of links
        linksChosen = randomPermutation(1:m); % choose first m integers and create an array
        for j=1:m
            sumOfWeights = 0;
            k = 1;
            while(sumOfWeights < linksChosen(j))
                sumOfWeights = sumOfWeights + outlinks(k);
                k = k + 1;
            end
          %  www(k-1) = www(k-1) + 1;
            network(n+t, k-1) = 1;
        end
    end
   % n = n + 1; % increment total number of sites by 1
   % www = [www;1];
end

% subplot(1, 2, 1);
% histogram(sum(network,1));
% subplot(1 , 2, 2);
% bins = 2.^((1:10)-1);
% h = hist(sum(network,1),bins);
% plot(log(bins), log(h));

G = digraph(network);
plot(G);

% [bin,binsize] = conncomp(G,'Type','weak');
% idx = binsize(bin) == max(binsize);
% SG = subgraph(G, idx);
% plot(SG);