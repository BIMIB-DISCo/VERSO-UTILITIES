# load required libraries and sources
library("ape")
library("phangorn")

# set the seed
set.seed(12345)

# load data
load("results/inference.RData")

# read results for all methods
phylogenetic_distances = NULL
for(i in names(inference)) {
    cat(i,"\n")
    for(j in names(inference[[i]])) {
        cat(j,"\n")
        for(k in names(inference[[i]][[j]])) {
            cat(k,"\n")
            ground_truth = inference[[i]][[j]][[k]][["ground_truth"]][["phylogenetic_tree"]]
            VERSO = inference[[i]][[j]][[k]][["VERSO"]][["phylogenetic_tree"]]
            Nextstrain_Augur = inference[[i]][[j]][[k]][["Nextstrain/Augur"]][["phylogenetic_tree"]]
            BEAST2 = inference[[i]][[j]][[k]][["BEAST2"]][["phylogenetic_tree"]]
            # distances for VERSO
            inference_results = VERSO
            phylo.dist = treedist(ground_truth,inference_results,check.labels=TRUE)
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"VERSO",as.numeric(phylo.dist[2]),"BranchScoreDifference"))
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"VERSO",as.numeric(phylo.dist[4]),"QuadraticPathDifference"))
            # distances for Nextstrain/Augu
            inference_results = Nextstrain_Augur
            phylo.dist = treedist(ground_truth,inference_results,check.labels=TRUE)
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"Nextstrain/Augur",as.numeric(phylo.dist[2]),"BranchScoreDifference"))
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"Nextstrain/Augur",as.numeric(phylo.dist[4]),"QuadraticPathDifference"))
            # distances for BEAST2
            inference_results = BEAST2
            phylo.dist = treedist(ground_truth,inference_results,check.labels=TRUE)
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"BEAST2",as.numeric(phylo.dist[2]),"BranchScoreDifference"))
            phylogenetic_distances = rbind(phylogenetic_distances,c(i,j,k,"BEAST2",as.numeric(phylo.dist[4]),"QuadraticPathDifference"))
        }
    }
}

# save results
save(phylogenetic_distances,file="distances/phylogenetic_distances.RData")
