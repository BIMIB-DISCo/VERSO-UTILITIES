# VERSO-UTILITIES
Utilities repository for VERSO (Viral Evolution ReconStructiOn). This repository contains data and scripts to reproduce the analysis on both *real-world* and *simulated* datasets presented in the article: https://www.biorxiv.org/content/10.1101/2020.04.22.044404v2

Note that this is _not_ the repository of the VERSO tool and does not include the related documentation (please refer to: https://github.com/BIMIB-DISCo/VERSO for the tool and the documentation). 

# REAL-WORLD DATASETS
To reproduce the analyses of Datasets #1 (Amplicon) and #2 (RNA-seq) via VERSO please open the folder named: https://github.com/BIMIB-DISCo/VERSO-UTILITIES/tree/main/REAL-WORLD_DATASETS. Please read the following instruction to perform both VERSO STEP #1 and STEP #2. 
  
## VERSO STEP #1

### Requirements 
  * [R] Follow the instructions at: https://www.r-project.org/ 
  
### Running
For each dataset, please run the script xxx
  
## VERSO STEP #2

### Requirements 
* (1) [Python 3.6.x] Follow the instructions at: https://www.python.org/downloads/
* (2) [Jupyter] Follow the instructions at: https://jupyter.org/install
* (3) [Scanpy 1.6] Follow the instructions at: https://scanpy.readthedocs.io/en/stable/installation.html
 
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

  
# SYNTHETIC DATASETS
To reproduce the analysis on the 80 simulated datasets via VERSO please open the folder named: https://github.com/BIMIB-DISCo/VERSO-UTILITIES/tree/main/SYNTHETIC_DATASETS. 


