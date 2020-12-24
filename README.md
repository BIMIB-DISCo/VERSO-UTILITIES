# VERSO-UTILITIES
Utilities repository for VERSO (Viral Evolution ReconStructiOn). This repository contains data and scripts to reproduce the analysis on both *real-world* and *simulated* datasets presented in the article: https://www.biorxiv.org/content/10.1101/2020.04.22.044404v4

Note that this is _not_ the repository of the VERSO tool and does not include the related documentation (please refer to: https://github.com/BIMIB-DISCo/VERSO for the tool and the documentation). 

# REAL-WORLD DATASETS
To reproduce the analyses of Datasets #1 (Amplicon) and #2 (RNA-seq) via VERSO please go the folder named: https://github.com/BIMIB-DISCo/VERSO-UTILITIES/tree/main/REAL-WORLD_DATASETS. Please read the following instruction to perform both VERSO STEP #1 and STEP #2. 
  
## VERSO STEP #1

### Requirements 
  * [R] Follow the instructions at: https://www.r-project.org/ 
  * [ape R library, see https://cran.r-project.org/web/packages/ape/index.html] Command: 
  <pre><code>if (!require("ape")) install.packages("ape")</code></pre>
  * [Rfast R library, see https://cran.r-project.org/web/packages/Rfast/index.html] Command: 
  <pre><code>if (!require("Rfast")) install.packages("Rfast")</code></pre>
  
### Running
For each dataset, please run the R scripts main.R included in the relative subfolder as follow:
<pre><code>Rscript main.R</code></pre>

### Outputs 
VERSO STEP #1 returns as output an R list providing the inferred maximum log-likelihood phylogenetic tree.
  
## VERSO STEP #2

### Requirements 
* (1) [Python 3.6.x] Follow the instructions at: https://www.python.org/downloads/
* (2) [Jupyter] Follow the instructions at: https://jupyter.org/install
* (3) [SCANPY 1.6] Run this command via PIP to install the proper version:

	<pre><code>pip install scanpy[leiden]</code></pre>
	Further details at: https://scanpy.readthedocs.io/en/stable/installation.html
 
### Running
Please launch Jupyter from the terminal with the following command:
<pre><code>Jupyter notebook</code></pre>

For each dataset, please execute sequentially the Juypyter notebooks included in each related folder and named:   
<pre><code>VERSO_STEP_2_DATASET_1.ipynb </code></pre>
<pre><code>VERSO_STEP_2_DATASET_2.ipynb</code></pre>

### Outputs 
VERSO STEP #2 returns as output:
* the SVG images including the UMAP plots related to the distinct clonal genotypes included in the datasets. The file names are numbered according to the clonal genotype ID: C01.svg, C02.svg, etc.
* the distance among samples, numbered according to the clonal genotype ID: distances_C01.txt, distances_C02.txt, etc.
* the metadata for each clonal genotype in folders names as: OUTPUT_C01, OUTPUT_C02, etc.

Note that the visualization of the UMAP plots may slightly different due to different package versions.

# SYNTHETIC DATASETS
To reproduce the analysis on the 80 simulated datasets via VERSO please go to the folder named: https://github.com/BIMIB-DISCo/VERSO-UTILITIES/tree/main/SYNTHETIC_DATASETS. 

In the subfolder results you can find an RData named inference.RData where the simulated data, ground truth and inferred phylogenetic trees for each method are provided. In the scripts main_part1_compute_absolute_error.R and main_part2_compute_phylogenetic_distances.R you can find the code to compute the performance of each method. 


