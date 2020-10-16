# load required libraries and sources
library("ape")

# set the seed
set.seed(12345)

# load data
load("results/inference.RData")

# consider the results of all methods
absolute_error = NULL
for(i in names(inference)) {
    for(j in names(inference[[i]])) {
        for(k in names(inference[[i]][[j]])) {
            ground_truth = inference[[i]][[j]][[k]][["ground_truth"]][["phylogenetic_tree"]]
            VERSO = inference[[i]][[j]][[k]][["VERSO"]][["phylogenetic_tree"]]
            Nextstrain_Augur = inference[[i]][[j]][[k]][["Nextstrain/Augur"]][["phylogenetic_tree"]]
            BEAST2 = inference[[i]][[j]][[k]][["BEAST2"]][["phylogenetic_tree"]]
            curr_samples = ground_truth$tip.label
            ground_truth_dist = cophenetic.phylo(ground_truth)
            curr_performance = mean(abs(cophenetic.phylo(VERSO)[curr_samples,curr_samples]-ground_truth_dist[curr_samples,curr_samples]))
            absolute_error = rbind(absolute_error,c(i,j,k,"VERSO",curr_performance))
            curr_performance = mean(abs(cophenetic.phylo(Nextstrain_Augur)[curr_samples,curr_samples]-ground_truth_dist[curr_samples,curr_samples]))
            absolute_error = rbind(absolute_error,c(i,j,k,"Nextstrain/Augur",curr_performance))
            curr_performance = mean(abs(cophenetic.phylo(BEAST2)[curr_samples,curr_samples]-ground_truth_dist[curr_samples,curr_samples]))
            absolute_error = rbind(absolute_error,c(i,j,k,"BEAST2",curr_performance))
        }
    }
}

# save results
save(absolute_error,file="distances/absolute_error.RData")
