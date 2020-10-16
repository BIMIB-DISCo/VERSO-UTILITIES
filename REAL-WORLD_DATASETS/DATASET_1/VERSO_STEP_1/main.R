# load required libraries and scripts
library("parallel")
library("Rfast")
source("R/frontend.R")
source("R/inference.R")
source("R/utils.R")

# load data
load("RData/clonal_variants.RData")
clonal_variants = clonal_variants[,names(which(colSums(clonal_variants,na.rm=TRUE)/nrow(clonal_variants)>0.030))]
D = list()
D[["Exp"]] = clonal_variants

# define parameters for grid search
alpha = NULL
beta = NULL
for(a in c(0.001,0.010,0.050,0.100)) {
    for(b in c(0.001,0.010,0.050,0.100)) {
        alpha = c(alpha,list(c(a)))
        beta = c(beta,list(c(b)))
    }
}

# perform inference
inference = VERSO(D=D,lik_w=1,alpha=alpha,beta=beta,keep_equivalent=TRUE,check_indistinguishable=TRUE,num_rs=500,num_iter=100000,n_try_bs=5000,marginalize=FALSE,num_processes=16,seed=11111,verbose=TRUE)

# save the results
save(inference,file="results/inference.RData")
